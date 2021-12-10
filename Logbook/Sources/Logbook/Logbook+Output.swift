//
//  Logbook+Output.swift
//
//
//  Created by Rayhan Nabi on 12/10/21.
//

import Foundation

public extension Logbook {
    /// The log output destination
    enum Output {
        /// Logs to Xcode console
        ///
        /// If console kind is ``Logbook/Logbook/Console/unified``,
        /// also outputs to Unified Logging System.
        case console(_ kind: Console)
    }

    /// The console output destination
    enum Console {
        /// Outputs to Xcode console only
        ///
        /// Uses `print(:)` function for output
        case xcode
        /// Outputs to the Unified Logging System
        ///
        /// Uses `OSLog` for logging, outputs are visible
        /// in both Xcode and Console app.
        case unified
    }
}

// MARK: - Logbook.Output + Equatable

extension Logbook.Output: Equatable {}
