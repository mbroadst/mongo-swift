import libbson
import Foundation

// : Collection, ExpressibleByDictionaryLiteral, ExpressibleByArrayLiteral

public class Document {
    internal var data: UnsafeMutableRawPointer!

    public init() {
        data = BCON_NEW()
    }

    deinit {
        bson_destroy(data);
    }
}
