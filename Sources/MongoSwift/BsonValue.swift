import Foundation

public enum BsonType: Int {
    case invalid = 0x00,
    double = 0x01,
    string = 0x02,
    document = 0x03,
    array = 0x04,
    binary = 0x05,
    undefined = 0x06,
    objectId = 0x07,
    boolean = 0x08,
    dateTime = 0x09,
    null = 0x0a,
    regularExpression = 0x0b,
    dbPointer = 0x0c,
    javascript = 0x0d,
    symbol = 0x0e,
    javascriptWithScope = 0x0f,
    int32 = 0x10,
    timestamp = 0x11,
    int64 = 0x12,
    decimal128 = 0x13,
    minKey = 0xff,
    maxKey = 0x7f
}

public protocol BsonValue {
    var bsonType: BsonType { get }
}

extension String : BsonValue {
  public var bsonType: BsonType { return .string }
}
