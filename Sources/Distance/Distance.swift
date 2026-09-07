public import Subtraction




public enum Distance {}

extension Distance {

    @inlinable
    public static func reporting<Value: FixedWidthInteger & UnsignedInteger>(
        from start: Value,
        to end: Value
    ) -> (value: Value, overflow: Bool) {
        Subtraction.reporting(end, start)
    }

    @inlinable
    public static func exact<Value: FixedWidthInteger & UnsignedInteger>(
        from start: Value,
        to end: Value
    ) throws(Subtraction.Error) -> Value {
        try Subtraction.exact(end, start)
    }

    @inlinable
    public static func saturating<Value: FixedWidthInteger & UnsignedInteger>(
        from start: Value,
        to end: Value
    ) -> Value {
        Subtraction.saturating(end, start)
    }
}
