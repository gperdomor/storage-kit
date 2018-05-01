//
//  StorageMetadata.swift
//  StorageKit
//
//  Created by Gustavo Perdomo on 4/30/18.
//  Copyright © 2018 Gustavo Perdomo. All rights reserved.
//

import Foundation
import Vapor

public typealias StorageACL = [ACLPermission: [ACLKey: String]]

public struct StorageMetadata: Codable {
    public let predefinedACL: PredefinedACL?
    public let acl: StorageACL
}

public enum PredefinedACL: String, Codable {
    case `default`
    // For Object and Bucket
    case `private`
    case publicRead
    case publicReadWrite
    case awsExecRead
    case authenticatedRead
    // For Object
    case bucketOwnerRead
    case bucketOwnerFullControl
    // Bucket
    case logDeliveryWrite
}

public enum ACLPermission: String, Codable {
    case read
    case readAcp
    case write
    case writeAcp
    case fullControl
}

public enum ACLKey: String, Codable {
    case userEmail
    case userId
    case groupEmail
    case groupId
    case uri
    case domain
}
