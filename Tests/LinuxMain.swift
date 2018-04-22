//
//  LinuxMain.swift
//  StorageKit
//
//  Created by Gustavo Perdomo on 4/16/18.
//  Copyright © 2018 Gustavo Perdomo. All rights reserved.
//

import XCTest

import StorageKitTests

var tests = [XCTestCaseEntry]()
tests += StorageKitTests.allTests()
XCTMain(tests)
