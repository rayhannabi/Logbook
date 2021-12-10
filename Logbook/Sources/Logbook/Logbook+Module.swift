//
//  Logbook+Module.swift
//
//
//  Created by Rayhan Nabi on 12/10/21.
//

import Foundation

public extension Logbook {
    /// Defines the module for logging
    ///
    /// Modules can be initialized directly with string literals.
    /// Also the following predefined modules are available.
    /// - ``Module/app``
    /// - ``Module/apn``
    /// - ``Module/db``
    /// - ``Module/net``
    ///
    /// Example
    /// ```swift
    /// let Log = Logbook.shared
    /// Log.debug(someValue, "Success", module: .app)
    /// Log.error("Error fetching data", error, module: "CustomCategory")
    /// ```
    ///
    /// **Note**
    ///
    /// If using ``Console/unified`` console as log output, modules are passed as categories.
    struct Module: ExpressibleByStringLiteral {
        public typealias StringLiteralType = String

        var value: String
        
        /// Initializes the module
        /// - Parameter value: Any string value
        public init(stringLiteral value: String) { self.value = value }
    }
}

public extension Logbook.Module {
    /// Used for generic app event logging
    static var app: Self { "App" }
    /// Used for network event logging
    static var net: Self { "Net" }
    /// Used for database event logging
    static var db: Self { "DB" }
    /// Used for push notification event logging
    static var apn: Self { "APN" }
}
