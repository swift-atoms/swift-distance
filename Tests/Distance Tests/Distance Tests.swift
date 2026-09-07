import Subtraction
import Distance
import Testing

@Suite
struct `Forward distance is checked and saturates for reversed bounds` {

    @Test
    func `forward distance is exact`() throws {
        #expect(try Distance.exact(from: UInt(3), to: 8) == 5)
        let report = Distance.reporting(from: UInt(3), to: 8)
        #expect(report.value == 5)
        #expect(!report.overflow)
    }

    @Test
    func `backward distance reports and saturates`() {
        let report = Distance.reporting(from: UInt(8), to: 3)
        #expect(report.overflow)
        #expect(Distance.saturating(from: UInt(8), to: 3) == .zero)
        #expect(throws: Subtraction.Error.overflow) {
            try Distance.exact(from: UInt(8), to: 3)
        }
    }
}
