//
//  Adapter.swift
//  StorageKit
//
//  Created by Gustavo Perdomo on 4/16/18.
//  Copyright © 2018 Gustavo Perdomo. All rights reserved.
//

import Async
import Foundation
import Vapor

/// `Adapter` provides an interface with commons operations to handle files.
public protocol Adapter: class {
    // MARK: Bucket Operations
    
    /// Create a new bucket.
    ///
    /// - Parameters:
    ///   - bucket: name of the bucket.
    ///   - container: Vapor Container.
    /// - Returns: Future<Void>
    /// - Throws: <#throws value description#>
    func create(bucket: String, on container: Container) throws -> Future<Void>
    
    /// Permanently deletes an empty bucket.
    ///
    /// - Parameters:
    ///   - bucket: name of the bucket.
    ///   - container: Vapor Container.
    /// - Returns: Future<Void>
    /// - Throws: <#throws value description#>
    func delete(bucket: String, on container: Container) throws -> Future<Void>
    
    /// Returns metadata for the specified bucket.
    ///
    /// - Parameters:
    ///   - bucket: name of the bucket.
    ///   - container: Vapor Container.
    /// - Returns: Future<BucketInfo?>
    /// - Throws: <#throws value description#>
    func get(bucket: String, on container: Container) throws -> Future<BucketInfo?>
    
    /// Retrieves a list of buckets.
    ///
    /// - Parameter container: Vapor Container.
    /// - Returns: Array of BucketInfo.
    /// - Throws: <#throws value description#>
    func list(on container: Container) throws -> Future<[BucketInfo]>
    
    // MARK: Objects Operations
    
    /// Create a copy of an object.
    ///
    /// - Parameters:
    ///   - object: name of the source object.
    ///   - bucket: name of the source bucket.
    ///   - as: name of the target object.
    ///   - targetBucket: name of the target bucket.
    ///   - container: Vapor Container.
    /// - Returns: Future<ObjectInfo>
    /// - Throws: <#throws value description#>
    func copy(object: String, from bucket: String, as: String, to targetBucket: String, on container: Container) throws -> Future<ObjectInfo>
    
    /// Create a new object
    ///
    /// - Parameters:
    ///   - object: name of the object.
    ///   - bucket: name of the bucket.
    ///   - content: Data oto be writen.
    ///   - container: Vapor Container.
    /// - Returns: Future<ObjectInfo>
    /// - Throws: <#throws value description#>
    func create(object: String, in bucket: String, with content: Data, on container: Container) throws -> Future<ObjectInfo>
    
    /// Permanently deletes an empty bucket.
    ///
    /// - Parameters:
    ///   - object: name of the object.
    ///   - bucket: name of the bucket.
    ///   - container: Vapor Container.
    /// - Returns: Future<Void>
    /// - Throws: <#throws value description#>
    func delete(object: String, in bucket: String, on container: Container) throws -> Future<Void>
    
    /// Reads the content of a object inside a bucket.
    ///
    /// - Parameters:
    ///   - object: name of the object.
    ///   - bucket: name of the bucket.
    ///   - container: Vapor Container
    /// - Returns: Future<Data>
    /// - Throws: <#throws value description#>
    func get(object: String, in bucket: String, on container: Container) throws -> Future<Data>
    
    /// Retrieves a list of objects from a bucket.
    ///
    /// - Parameters:
    ///   - bucket: name of the bucket.
    ///   - prefix: <#prefix description#>
    ///   - container: Vapor Container.
    /// - Returns: Future<[ObjectInfo]>
    /// - Throws: <#throws value description#>
    func listObjects(in bucket: String, prefix: String?, on container: Container) throws -> Future<[ObjectInfo]>
}
