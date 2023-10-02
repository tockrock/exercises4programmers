// The Swift Programming Language
// https://docs.swift.org/swift-book
// 
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser

@main
struct saying_hello_cli: ParsableCommand {
    mutating func run() throws {
        print("What is your name?", terminator: " ")
        print("Hello, " + readLine()! + ", nice to meet you!")
    }
}
