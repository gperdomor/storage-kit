//
//  Adapter.swift
//  StorageKit
//
//  Created by Gustavo Perdomo on 4/16/18.
//  Copyright © 2018 Gustavo Perdomo. All rights reserved.
//

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
     ///   - content: The content of the file.
     ///   - path: Path where will be written.
     /// - Returns: `true`if the file was written, `false` otherwise.
     /// - Throws: `AdapterError`.
     func write(content: Data, at path: String) throws -> Bool

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
     /// - Parameter path: A path.
     /// - Throws: `AdapterError`.
     func delete(at path: String) throws

     /// Renames the file.
     ///
     /// - Parameters:
     ///   - path: A path.
     ///   - target: A path.
     /// - Throws: `AdapterError`
     func rename(at path: String, to target: String) throws

     /// Check if the path is a directory.
     ///
     /// - Parameter path: A path.
     /// - Returns: `true`if the path is adirectory, `false` otherwise.
     /// - Throws: `AdapterError`.
     func isDirectory(at path: String) throws -> Bool
 }
