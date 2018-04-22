//
//  DummyAdapter.swift
//  StorageKit
//
//  Created by Gustavo Perdomo on 4/20/18.
//  Copyright © 2018 Gustavo Perdomo. All rights reserved.
//

import Async
import Vapor
@testable import StorageKit

enum TestError: Error {
    case notImplemented
}

class DummyAdapter: Adapter {
    let id: String
    
    init(id: String) {
        self.id = id
    }
    
    func create(bucket: String, metadata: Codable?, on container: Container) throws -> EventLoopFuture<Void> {
        throw TestError.notImplemented
    }
    
    func delete(bucket: String, on container: Container) throws -> EventLoopFuture<Void> {
        throw TestError.notImplemented
    }
    
    func get(bucket: String, on container: Container) throws -> EventLoopFuture<BucketInfo?> {
        throw TestError.notImplemented
    }
    
    func list(on container: Container) throws -> EventLoopFuture<[BucketInfo]> {
        throw TestError.notImplemented
    }
    
    func copy(object: String, from bucket: String, as: String, to targetBucket: String, on container: Container) throws -> EventLoopFuture<ObjectInfo> {
        throw TestError.notImplemented
    }
    
    func create(object: String, in bucket: String, with content: Data, metadata: Codable?, on container: Container) throws -> EventLoopFuture<ObjectInfo> {
        throw TestError.notImplemented
    }
    
    func delete(object: String, in bucket: String, on container: Container) throws -> EventLoopFuture<Void> {
        throw TestError.notImplemented
    }
    
    func get(object: String, in bucket: String, on container: Container) throws -> EventLoopFuture<Data> {
        throw TestError.notImplemented
    }
    
    func listObjects(in bucket: String, prefix: String?, on container: Container) throws -> EventLoopFuture<[ObjectInfo]> {
        throw TestError.notImplemented
    }
}
