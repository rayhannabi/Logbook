//
//  Logbook+API.swift
//
//
//  Created by Rayhan Nabi on 12/10/21.
//

import Foundation

public extension Logbook {
    /// Logs with `default` level
    /// - Parameters:
    ///   - items: Items to log
    ///   - module: Module for logging. Default value is ``Module/app``.
    ///   - file: Name of the file
    ///   - line: Line number of the file
    func `default`(_ items: Any?..., module: Module? = .app, _ file: String = #file, _ line: Int = #line) {
        post(items, module?.value, .default, file, line)
    }

    /// Logs with `debug` level
    /// - Parameters:
    ///   - items: Items to log
    ///   - module: Module for logging. Default value is ``Module/app``.
    ///   - file: Name of the file
    ///   - line: Line number of the file
    func debug(_ items: Any?..., module: Module? = .app, _ file: String = #file, _ line: Int = #line) {
        post(items, module?.value, .debug, file, line)
    }

    /// Logs with `error` level
    /// - Parameters:
    ///   - items: Items to log
    ///   - module: Module for logging. Default value is ``Module/app``.
    ///   - file: Name of the file
    ///   - line: Line number of the file
    func error(_ items: Any?..., module: Module? = .app, _ file: String = #file, _ line: Int = #line) {
        post(items, module?.value, .error, file, line)
    }

    /// Logs with `fault` level
    /// - Parameters:
    ///   - items: Items to log
    ///   - module: Module for logging. Default value is ``Module/app``.
    ///   - file: Name of the file
    ///   - line: Line number of the file
    func fault(_ items: Any?..., module: Module? = .app, _ file: String = #file, _ line: Int = #line) {
        post(items, module?.value, .fault, file, line)
    }

    /// Logs with `info` level
    /// - Parameters:
    ///   - items: Items to log
    ///   - module: Module for logging. Default value is ``Module/app``.
    ///   - file: Name of the file
    ///   - line: Line number of the file
    func info(_ items: Any?..., module: Module? = .app, _ file: String = #file, _ line: Int = #line) {
        post(items, module?.value, .info, file, line)
    }
}
