import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(storage_kitTests.allTests),
    ]
}
#endif