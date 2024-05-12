// The Swift Programming Language
// https://docs.swift.org/swift-book



// TODO: U128 U256
public class Serializer {
    var _data: [UInt8]
    
    public init() {
        self._data = []
    }
    
    public func consume() -> [UInt8] {
        let data = self._data
        self._data = []
        return data
    }
    
    func u8(input: UInt8) {
        self._data.append(input)
    }
    
    func u16(input: UInt16) {
        self._data.append(UInt8(input & 0xFF))
        self._data.append(UInt8((input >> 8) & 0xFF))
    }
    
    func u32(input: UInt32) {
        self._data.append(UInt8(input & 0xFF))
        self._data.append(UInt8((input >> 8) & 0xFF))
        self._data.append(UInt8((input >> 16) & 0xFF))
        self._data.append(UInt8((input >> 24) & 0xFF))
    }
    
    func u64(input: UInt64) {
        self._data.append(UInt8(input & 0xFF))
        self._data.append(UInt8((input >> 8) & 0xFF))
        self._data.append(UInt8((input >> 16) & 0xFF))
        self._data.append(UInt8((input >> 24) & 0xFF))
        self._data.append(UInt8((input >> 32) & 0xFF))
        self._data.append(UInt8((input >> 40) & 0xFF))
        self._data.append(UInt8((input >> 48) & 0xFF))
        self._data.append(UInt8((input >> 56) & 0xFF))
    }
    
    func toBytes() -> [UInt8] {
        return self._data
    }
}

// TODO: U128 U256
public class Deserializer {
    var _data: [UInt8]
    var _cursor: Int
    
    public init(data: [UInt8]) {
        self._data = data
        self._cursor = 0
    }
    
    func u8() -> UInt8 {
        let ret = self._data[self._cursor]
        _cursor += 1
        return ret
    }
    
    func u16() -> UInt16{
        var ret = UInt16(self.u8())
        print(ret)
        ret += UInt16(self.u8()) << 8
        print(ret)
        return ret
    }
    
    func u32() -> UInt32 {
        var ret = UInt32(self.u8())
        ret += UInt32(self.u8()) << 8
        ret += UInt32(self.u8()) << 16
        ret += UInt32(self.u8()) << 24
       
        return ret
    }
    
    func u64() -> UInt64 {
        var ret = UInt64(self.u8())
        ret += UInt64(self.u8()) << 8
        ret += UInt64(self.u8()) << 16
        ret += UInt64(self.u8()) << 24
        ret += UInt64(self.u8()) << 32
        ret += UInt64(self.u8()) << 40
        ret += UInt64(self.u8()) << 48
        ret += UInt64(self.u8()) << 56
       
        return ret
    }
    
    func toBytes() -> [UInt8] {
        return self._data
    }
}
