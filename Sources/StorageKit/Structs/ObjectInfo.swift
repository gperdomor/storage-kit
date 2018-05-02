//
//  ObjectInfo.swift
//  StorageKit
//
//  Created by Gustavo Perdomo on 4/18/18.
//  Copyright © 2018 Gustavo Perdomo. All rights reserved.
//

import Foundation
import Vapor

public struct ObjectInfo: Content {
    /// Name of the object.
    public let name: String
    
    /// Name of the object prefix.
    public let prefix: String?
    
    /// Size of the object.
    public let size: Int?
    
    /// MD5 checksum of the object.
    public let etag: String
    
    /// Time when object was last modified.
    public let lastModified: Date?
    
    /// the absolute URL of the object.
    public let url: URL?
    
    
    /// Create a new ObjectInfo.
    ///
    /// - Parameters:
    ///   - name: Name of the object
    ///   - prefix: Prefix
    ///   - size: Size of the object.
    ///   - etag: MD5 checksum.
    ///   - lastModified: Time when object was last modified.
    public init(name: String, prefix: String?, size: Int?, etag: String, lastModified: Date?, url: URL?) {
        self.name = name
        self.prefix = prefix
        self.size = size
        self.etag = etag
        self.lastModified = lastModified
        self.url = url
    }
}
