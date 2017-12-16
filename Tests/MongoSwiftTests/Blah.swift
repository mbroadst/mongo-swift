import Foundation
import XCTest
@testable import MongoSwift

final class MongoSwiftTests: XCTestCase {
    static var allTests : [(String, (MongoSwiftTests) -> () throws -> Void)] {
        return [
            ("testDocument", testDocument)
        ]
    }

    func testDocument() {
        var doc = Document();
        doc["testing"] = "this thing";
        XCTAssertEqual(doc["testing"] as! String, "this thing");
    }
}
