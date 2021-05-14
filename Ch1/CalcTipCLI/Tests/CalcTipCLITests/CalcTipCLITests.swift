import XCTest
import class Foundation.Bundle

final class CalcTipCLITests: XCTestCase {
    func testHappyPath() throws {
        let result = try runProcess(arguments: ["-b", "1000", "-t", "15"])

        XCTAssertEqual(result, "Tip Amount: $150.00\nTotal: $1,150.00\n")
    }
    
    func runProcess(arguments: [String]) throws -> String? {
        let binary = productsDirectory.appendingPathComponent("calctip")
        
        let process = Process()
        process.executableURL = binary
        
        let pipe = Pipe()
        process.standardOutput = pipe
        
        process.arguments = arguments
        
        try process.run()
        process.waitUntilExit()

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        return String(data: data, encoding: .utf8)
        
    }

    /// Returns path to the built products directory.
    var productsDirectory: URL {
      #if os(macOS)
        for bundle in Bundle.allBundles where bundle.bundlePath.hasSuffix(".xctest") {
            return bundle.bundleURL.deletingLastPathComponent()
        }
        fatalError("couldn't find the products directory")
      #else
        return Bundle.main.bundleURL
      #endif
    }
}
