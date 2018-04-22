//
//  StorageKitError.swift
//  StorageKit
//
//  Created by Gustavo Perdomo on 4/16/18.
//  Copyright © 2018 Gustavo Perdomo. All rights reserved.
//

import Debugging

/// Errors that can be thrown while working with Vapor.
public struct StorageKitError: Debuggable {
    public static let readableName = "Storage Error"
    public let identifier: String
    public var reason: String
    public var sourceLocation: SourceLocation?
    public var stackTrace: [String]
    public var suggestedFixes: [String]
    public var possibleCauses: [String]

    init(
        identifier: String,
        reason: String,
        suggestedFixes: [String] = [],
        possibleCauses: [String] = [],
        source: SourceLocation
        ) {
        self.identifier = identifier
        self.reason = reason
        self.sourceLocation = source
        self.stackTrace = StorageKitError.makeStackTrace()
        self.suggestedFixes = suggestedFixes
        self.possibleCauses = possibleCauses
    }
}

/// For printing un-handleable errors.
func ERROR(_ string: @autoclosure () -> String, file: StaticString = #file, line: Int = #line) {
    print("[Storage] \(string()) [\(file.description.split(separator: "/").last!):\(line)]")
}
