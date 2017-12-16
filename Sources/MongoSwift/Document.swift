import libbson
import Foundation

public class Document {
    internal var data: UnsafeMutablePointer<bson_t>!

    public init() {
        data = bson_new()
    }

    deinit {
        bson_destroy(data);
    }

    subscript(key: String) -> BsonValue? {
        get {
            var iter: bson_iter_t = bson_iter_t();
            if (!bson_iter_init(&iter, data)) {
                return nil;
            }

            while (bson_iter_next(&iter)) {
                let ikey = String(cString: bson_iter_key(&iter));
                if (ikey == key) {
                    if (bson_iter_type(&iter) == BSON_TYPE_UTF8) {
                        let len = UnsafeMutablePointer<UInt32>.allocate(capacity: 1)
                        let value = bson_iter_utf8(&iter, len);
                        guard let strValue = value else {
                            // throw some sort of Error?
                            return nil
                        }

                        return String(cString: strValue);
                    }
                }
            }

            return nil
        }

        set(newValue) {
            guard let value = newValue else { return }

            switch (value.bsonType) {
            case .string:
                let strValue = value as! String
                let result = bson_append_utf8(data, key, Int32(key.count), strValue, Int32(strValue.count))
                if (!result) {
                    print("SOMETHING WENT HORRIBLY WRONG");
                }
                break;
            default:
                return
            }
        }
    }
}
