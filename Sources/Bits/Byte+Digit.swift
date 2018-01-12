// MARK: Digits

extension Byte {
    /// Returns whether or not a given byte represents a UTF8 digit 0 through 9
    public var isDigit: Bool {
        return (.zero ... .nine).contains(self)
    }

    /// 0 in utf8
    public static let zero: Byte = 0x30

    /// 1 in utf8
    public static let one: Byte = 0x31

    /// 2 in utf8
    public static let two: Byte = 0x32

    /// 3 in utf8
    public static let three: Byte = 0x33

    /// 4 in utf8
    public static let four: Byte = 0x34

    /// 5 in utf8
    public static let five: Byte = 0x35

    /// 6 in utf8
    public static let six: Byte = 0x36

    /// 7 in utf8
    public static let seven: Byte = 0x37

    /// 8 in utf8
    public static let eight: Byte = 0x38

    /// 9 in utf8
    public static let nine: Byte = 0x39
}

extension Int {
    public func bytes(reserving: Int = 0) -> [UInt8] {
        var data = [UInt8]()
        data.reserveCapacity(reserving)
        
        var i: Int
        
        if self < 0 {
            data.append(.hyphen)
            // make positive
            i = -self
        } else {
            i = self
        }
        
        var offset = 0
        var testI = i
        
        repeat {
            offset = offset &+ 1
            testI = testI / 10
            data.append(0)
        } while testI > 0
        
        while offset > 0 {
            // subtract first to be before the `data.count`
            offset = offset &- 1
            data[offset] = 0x30 &+ numericCast(i % 10)
            i = i / 10
        }
        
        return data
    }
}
