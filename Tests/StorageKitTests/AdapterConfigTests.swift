//
//  AdapterConfigTests.swift
//  StorageKit
//
//  Created by Gustavo Perdomo on 4/16/18.
//  Copyright © 2018 Gustavo Perdomo. All rights reserved.
//

import XCTest
@testable import StorageKit

final class AdapterConfigTests: XCTestCase {
    func testInitializer() {
        let config = AdapterConfig()

        XCTAssertEqual(config.adapters.count, 0)
    }
    
    func testAdd() {
        var config = AdapterConfig()

        XCTAssertEqual(config.adapters.count, 0)

        config.add(adapter: DummyAdapter(id: "test"), as: AdapterIdentifier<DummyAdapter>("local"))
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
        ("testAdd", testAdd)
    ]
}
