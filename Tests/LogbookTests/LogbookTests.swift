@testable import Logbook
import XCTest

final class LogbookTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssert(Logbook.shared.isEnabled, "Logbook is not enabled")
    }
}
