//
//  File.swift
//  
//
//  Created by 鈴木剛 on 2021/05/09.
//

import Foundation

public final class CommandLineTool {
    private let arguments: [String]
    
    public init(arguments: [String] = CommandLine.arguments)  {
        self.arguments = arguments
    }
    
    public func run() throws {
        print("Hello World!")
    }
}
