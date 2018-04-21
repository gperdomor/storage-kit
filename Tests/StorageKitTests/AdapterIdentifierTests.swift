//
//  AdapterIdentifierTests.swift
//  StorageKit
//
//  Created by Gustavo Perdomo on 4/16/18.
//  Copyright © 2018 Gustavo Perdomo. All rights reserved.
//

import XCTest
@testable import StorageKit

final class AdapterIdentifierTests: XCTestCase {
    func testInitializer() {
        let local = AdapterIdentifier<DummyAdapter>("local")
        let s3 = AdapterIdentifier<DummyAdapter>("s3")

        XCTAssertEqual(local.uid, "local")
        XCTAssertEqual(s3.uid, "s3")
    }
    
    func testEquatable() {
        let local = AdapterIdentifier<DummyAdapter>("s3")
        let s3 = AdapterIdentifier<DummyAdapter>("s3")
        XCTAssertEqual(s3, local)
    }
    
    func testHashable() {
        let s3 = AdapterIdentifier<DummyAdapter>("s3")
        XCTAssertEqual(s3.hashValue, "s3".hashValue)
    }
    
    func testCustomStringConvertible() {
        let s3 = AdapterIdentifier<DummyAdapter>("s3")
        XCTAssertEqual(s3.description, "s3")
    }
    
    func testLinuxTestSuiteIncludesAllTests() throws {
        #if os(macOS) || os(iOS) || os(tvOS) || os(watchOS)
        let thisClass = type(of: self)
        let linuxCount = thisClass.allTests.count
        let darwinCount = Int(thisClass.defaultTestSuite.testCaseCount)
        
        XCTAssertEqual(linuxCount, darwinCount, "\(darwinCount - linuxCount) tests are missing from allTests")
        #endif
    }
    
    static var allTests = [
        ("testLinuxTestSuiteIncludesAllTests", testLinuxTestSuiteIncludesAllTests),
        ("testInitializer", testInitializer),
        ("testHashable", testHashable),
        ("testInitializer", testInitializer),
        ("testCustomStringConvertible", testCustomStringConvertible)
    ]
}
