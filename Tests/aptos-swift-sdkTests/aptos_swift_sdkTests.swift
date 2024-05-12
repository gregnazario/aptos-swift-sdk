import XCTest
@testable import aptos_swift_sdk

final class aptos_swift_sdkTests: XCTestCase {
    func testU8() throws {
        let inputs: [UInt8] = [0,1,255]

        let serializer = Serializer()
        for input in inputs {
            serializer.u8(input: input)
        }

        assert(inputs == serializer.toBytes())
        
        let deserializer = Deserializer(data: inputs)
        
        for input in inputs {
            assert(input == deserializer.u8())
        }
    }
    
    func testU16() throws {
        let inputs: [UInt16] = [0, 1, 255, 65535]
        let serialized: [UInt8] = [0, 0, 1, 0, 255, 0, 255, 255]

        let serializer = Serializer()
        for input in inputs {
            serializer.u16(input: input)
        }

        assert(serialized == serializer.toBytes())
        
        let deserializer = Deserializer(data: serialized)
        
        for input in inputs {
            let output = deserializer.u16()
            assert(input == output)
        }
    }
    
    func testU32() throws {
        let inputs: [UInt32] = [0, 1, 255, 65535]
        let serialized: [UInt8] = [0, 0, 0, 0, 1, 0, 0, 0, 255, 0, 0, 0, 255, 255, 0, 0]

        let serializer = Serializer()
        for input in inputs {
            serializer.u32(input: input)
        }

        assert(serialized == serializer.toBytes())
        
        let deserializer = Deserializer(data: serialized)
        
        for input in inputs {
            assert(input == deserializer.u32())
        }
    }
    
    func testU64() throws {
        let inputs: [UInt64] = [0, 1, 255, 65535]
        let serialized: [UInt8] = [0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 255, 0, 0, 0, 0, 0, 0, 0, 255, 255, 0, 0, 0, 0, 0, 0,]

        let serializer = Serializer()
        for input in inputs {
            serializer.u64(input: input)
        }

        assert(serialized == serializer.toBytes())
        
        let deserializer = Deserializer(data: serialized)
        
        for input in inputs {
            assert(input == deserializer.u64())
        }
    }
}
