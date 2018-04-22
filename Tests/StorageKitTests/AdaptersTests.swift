//
//  AdaptersTests.swift
//  StorageKit
//
//  Created by Gustavo Perdomo on 4/16/18.
//  Copyright © 2018 Gustavo Perdomo. All rights reserved.
//

import XCTest
@testable import StorageKit

final class AdaptersTests: XCTestCase {
    func testInitializer() {
        var dictionary = [String : Any]()
        var adapters = Adapters(dictionary)
        
        XCTAssertEqual(adapters.storage.count, 0)
        
        let local = AdapterIdentifier<DummyAdapter>("local")
        let s3 = AdapterIdentifier<DummyAdapter>("s3")
        
        let localAdapter = DummyAdapter(id: "test-local")
        let s3Adapter = DummyAdapter(id: "test-s3")
        
        dictionary = [local.uid : localAdapter, s3.uid: s3Adapter]
        adapters = Adapters(dictionary)
        
        XCTAssertEqual(adapters.storage.count, 2)
    }
    
    func testFindingAdapter() {
        let local = AdapterIdentifier<DummyAdapter>("local")
        let s3 = AdapterIdentifier<DummyAdapter>("s3")
        
        let localAdapter = DummyAdapter(id: "test-local")
        let s3Adapter = DummyAdapter(id: "test-s3")
        
        let dictionary: [String : Any] = [local.uid : localAdapter, s3.uid: s3Adapter]
        let adapters = Adapters(dictionary)
        
        XCTAssertEqual(adapters.adapter(for: local)?.id, localAdapter.id)
        XCTAssertEqual(adapters.adapter(for: s3)?.id, s3Adapter.id)
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
        ("testFindingAdapter", testFindingAdapter)
    ]
}
