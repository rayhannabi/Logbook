//
//  Logbook.swift
//
//
//  Created by Rayhan Nabi on 12/10/21.
//

import Foundation
import os.log

// MARK: - Logbook

/// An Xcode and Console logger
public class Logbook {
    /// Shared instance to use globally
    ///
    /// To avoid `import` statements everywhere, create a global variable once
    /// and assign it to this instance.
    ///
    /// **Example**
    /// ```swift
    /// // AppDelegate.swift
    /// import Logbook
    /// let Log = Logbook.shared
    ///
    /// // SomeFile.swift
    /// Log.debug(someValue)
    /// ```
    public static let shared = Logbook()

    /// Sets if logging is enabled
    ///
    /// Default value is `true`
    public var isEnabled: Bool
    /// Minimum level to log
    ///
    /// Default value is ``Level/debug``
    public var minimumLevel: Level

    /// Configuration for logging
    public var config: Configuration

    private init() {
        isEnabled = true
        minimumLevel = .debug
        config = .init()
    }

    func post(
        _ items: [Any?],
        _ module: String?,
        _ level: Level,
        _ file: String,
        _ line: Int
    ) {
        guard level >= minimumLevel else { return }
        let entry = createEntry(items, module, level, file, line)

        switch config.output {
        case let .console(kind):
            consoleLog(kind, module, level, entry)
        }
    }
}

private extension Logbook {
    func consoleLog(
        _ kind: Logbook.Console,
        _ module: String?,
        _ level: Logbook.Level,
        _ entry: String
    ) {
        switch kind {
        case .unified:
            unifiedLog(module, level, entry)
        case .xcode:
            print(entry)
        }
    }

    func unifiedLog(_ module: String?, _ level: Logbook.Level, _ entry: String) {
        if let subsystem = config.subsystem, let module = module {
            let osLog = OSLog(subsystem: subsystem, category: module)
            os_log(level.logType, log: osLog, "%@", entry)
        } else {
            os_log(level.logType, "%@", entry)
        }
    }

    func createEntry(
        _ items: [Any?],
        _ module: String?,
        _ level: Level,
        _ file: String,
        _ line: Int
    ) -> String {
        var entryItems = [String]()
        let description = logDescription(from: config, level, module, file, line)
        entryItems.append(description)
        entryItems.append(parseItems(items, delimiter: config.itemSeparator))
        return entryItems.joined(separator: " ")
    }

    func parseItems(_ items: [Any?], delimiter: String) -> String {
        items.map {
            guard let any = $0 else { return "Nil" }
            if let anyString = any as? String { return anyString }
            return "\(any)"
        }
        .joined(separator: delimiter)
    }

    func parseFilePath(_ file: String) -> String? {
        guard let fileName = file.split(separator: "/").last else { return nil }
        return String(fileName)
    }

    func timeStamp() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS Z"
        return dateFormatter.string(from: Date())
    }

    func logDescription(
        from config: Configuration,
        _ level: Level,
        _ module: String?,
        _ file: String,
        _ line: Int
    ) -> String {
        var descriptions = [String]()
        if config.output == .console(.xcode) { descriptions.append(timeStamp()) }
        if config.showsEmoji { descriptions.append(level.emoji) }
        if config.showsLevel { descriptions.append(level.value) }
        if config.output != .console(.unified),
           config.showsModule,
           let module = module { descriptions.append("[\(module)]") }
        if config.showsFileName, let file = parseFilePath(file) {
            descriptions.append("[\(file):\(line)]")
        }
        return descriptions.joined(separator: " ")
    }
}
