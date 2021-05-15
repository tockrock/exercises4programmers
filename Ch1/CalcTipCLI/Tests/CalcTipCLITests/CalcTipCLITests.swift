import XCTest
import class Foundation.Bundle

final class CalcTipCLITests: XCTestCase {
    func testHappyPath() throws {
        let result = try runProcess(arguments: argumentHelper())

        XCTAssertEqual(result, "Tip Amount: $150.00\nTotal: $1,150.00\n")
    }
    
    func testNonNumbericalBill() throws {
        let bill = "abcde"
        let result = try runProcess(arguments: argumentHelper(bill: bill))
        XCTAssertEqual(result, "Non Valid Number Error: can't convert to double \"\(bill)\"\n")
    }
    
    func testNonNumbericalTip() throws {
        let tip = "foobar"
        let result = try runProcess(arguments: argumentHelper(tip: tip))
        XCTAssertEqual(result, "Non Valid Number Error: can't convert to double \"\(tip)\"\n")
    }
    
    func testTipTooHigh() throws {
        let tip = "1000"
        let result = try runProcess(arguments: argumentHelper(tip: tip))
        XCTAssertEqual(result, "Non Valid Number Error: tip can't be over 100 \"\(tip)\"\n")
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
    
    func argumentHelper(bill: String = "1000", tip: String = "15", response: Bool = true) -> [String] {
        var arguments = ["-b", String(bill), "-t", String(tip)]
        if response {
            arguments.append("-r")
        }
        return arguments
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
