//
//  Adapter.swift
//  StorageKit
//
//  Created by Gustavo Perdomo on 4/16/18.
//  Copyright © 2018 Gustavo Perdomo. All rights reserved.
//

import Async
import Foundation

/// `Adapter` provides an interface with commons operations to handle files.
 public protocol Adapter: class {
     /// Reads the content of the file.
     ///
     /// - Parameter path: Path to the file to be reading.
     /// - Returns: The content of the file, if exists.
     /// - Throws: `AdapterError`.
     func read(at path: String) throws -> Data?

     /// Writes the given content into the file.
     ///
     /// - Parameters:
     ///   - on: The worker.
     ///   - content: The content of the file.
     ///   - path: Path where will be written.
     /// - Returns: Future<StorageResult>
     /// - Throws: `AdapterError`.
    func write(on worker: Worker, content: Data, at path: String) throws -> Future<StorageResult>

     /// Indicates whether the file exists.
     ///
     /// - Parameter path: A path.
     /// - Returns: `true`if the path exists, `false` otherwise.
     /// - Throws: `AdapterError`.
     func exists(at path: String) throws -> Bool

     /// Returns an array of all paths (files and directories).
     ///
     /// - Returns: Array of paths.
     /// - Throws: `AdapterError`.
     func list() throws -> [String]

     /// Deletes the path.
     ///
     /// - Parameters:
     ///   - on: The worker.
     ///   - path: A path.
     /// - Returns: Future<StorageResult>
     /// - Throws: `AdapterError`.
     func delete(on worker: Worker, at path: String) throws -> Future<StorageResult>

     /// Renames the file.
     ///
     /// - Parameters:
     ///   - on: The worker.
     ///   - path: A path.
     ///   - target: A path.
     /// - Returns: Future<StorageResult>
     /// - Throws: `AdapterError`
     func rename(on worker: Worker, at path: String, to target: String) throws -> Future<StorageResult>

     /// Check if the path is a directory.
     ///
     /// - Parameter path: A path.
     /// - Returns: `true`if the path is adirectory, `false` otherwise.
     /// - Throws: `AdapterError`.
     func isDirectory(at path: String) throws -> Bool
 }
