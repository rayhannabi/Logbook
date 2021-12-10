//
//  Logbook+Config.swift
//
//
//  Created by Rayhan Nabi on 12/10/21.
//

import Foundation

public extension Logbook {
    /// Defines configurations for ``Logbook``
    struct Configuration {
        /// Subsystem for the unified logging system
        ///
        /// This value is typically set to the bundle identifier.
        /// For ``Logbook/Logbook/Console/xcode`` console output, this value is ignored.
        public var subsystem: String?

        /// The output destination for logging
        ///
        /// Example
        /// ```swift
        /// Logbook.shared.config.output = .console(.unified)
        /// ```
        public var output: Output

        /// Shows the log level description if `true`
        public var showsLevel: Bool

        /// Shows the module description if `true`
        public var showsModule: Bool

        /// Shows the file name and line number if set to `true`
        public var showsFileName: Bool

        /// Shows colored book emojis based on log level if `true`
        public var showsEmoji: Bool

        /// Separator string for displaying items
        ///
        /// Default value is an empty string.
        /// Multiple items passed for logging will be separated using this value.
        public var itemSeparator: String

        /// Initializes the ``Logbook`` configuration
        /// - Parameters:
        ///   - subsystem: The subsystem for the unified logging system
        ///   - output: The output destination for logging
        ///   - showsLevel: Shows the log level description
        ///   - showsModule: Shows the module description
        ///   - showsFileName: Shows the file name and line number
        ///   - showsEmoji: Shows colored emoji
        ///   - itemSeparator: Separator string for displaying items
        public init(
            subsystem: String? = nil,
            output: Logbook.Output = .console(.unified),
            showsLevel: Bool = true,
            showsModule: Bool = true,
            showsFileName: Bool = true,
            showsEmoji: Bool = true,
            itemSeparator: String = ""
        ) {
            self.subsystem = subsystem
            self.output = output
            self.showsLevel = showsLevel
            self.showsModule = showsModule
            self.showsFileName = showsFileName
            self.showsEmoji = showsEmoji
            self.itemSeparator = itemSeparator
        }
    }
}
