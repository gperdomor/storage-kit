//
//  BucketInfo.swift
//  StorageKit
//
//  Created by Gustavo Perdomo on 4/18/18.
//  Copyright © 2018 Gustavo Perdomo. All rights reserved.
//

import Foundation
import Vapor

public struct BucketInfo: Content {
    /// Name of the bucket.
    public let name: String
    
    /// Date of bucket creation.
    public let creationDate: Date?

    
    /// Create a new BucketInfo.
    ///
    /// - Parameters:
    ///   - name: The name of the bucket.
    ///   - creationDate: The creation date of the bucket.
    public init(name: String, creationDate: Date?) {
        self.name = name
        self.creationDate = creationDate
    }
}
