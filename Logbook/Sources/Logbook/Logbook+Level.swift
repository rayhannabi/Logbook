//
//  Logbook+Level.swift
//
//
//  Created by Rayhan Nabi on 12/10/21.
//

import Foundation
import os.log

public extension Logbook {
    /// Defines the log level
    ///
    /// A minimum log level can be set via ``Logbook/minimumLevel`` property on ``Logbook``.
    /// Log level also provides color emoji, followed by the level description.
    ///
    /// **Note**
    ///
    /// If ``Configuration/output`` configuration is set to ``Console/unified`` console,
    /// the equivalent `OSLogType` is used for logging.
    enum Level: String {
        /// The default log level
        case `default`
        /// The debug level.
        case debug
        /// The error log level
        case error
        /// The fault log level
        case fault
        /// The info log level
        case info
        /// The tag level
        case tag
    }
}

extension Logbook.Level {
    var value: String { rawValue.uppercased() }

    var logType: OSLogType {
        switch self {
        case .default: return .default
        case .debug: return .debug
        case .error: return .error
        case .fault: return .fault
        case .info: return .info
        case .tag: return .default
        }
    }

    var emoji: String {
        switch self {
        case .default: return "📓"
        case .debug: return "📗"
        case .error: return "📕"
        case .fault: return "📙"
        case .info: return "📘"
        case .tag: return "🏷"
        }
    }
}

// MARK: - Logbook.Level + Comparable

extension Logbook.Level: Comparable {
    private var level: Int {
        switch self {
        case .debug: return 0
        case .default: return 1
        case .info,
             .tag: return 2
        case .error,
             .fault: return 3
        }
    }

    public static func < (lhs: Logbook.Level, rhs: Logbook.Level) -> Bool {
        lhs.level < rhs.level
    }
}
