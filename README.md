# swift-distance

Use this package to measure how far an unsigned fixed-width integer position lies ahead of another, for example the count of elements between two offsets, where `end` behind `start` is a fault you must handle. Start from `Distance`. When the result must carry a direction, so `end` behind `start` is a valid negative answer, use `Difference` from swift-difference instead. For plain unsigned subtraction without the from/to framing, use `Subtraction` from swift-subtraction, which `Distance` forwards to.

## Laws

- Distance is directed: the distance from `start` to `end` is `end − start`. It is not symmetric, and it is never the absolute difference.
- When `end ≥ start`, `Distance.exact`, `Distance.reporting` and `Distance.saturating` all return `end − start`, and `Distance.reporting` reports no overflow.
- When `end < start`, the distance is unrepresentable: `Distance.exact` throws, `Distance.reporting` sets `overflow`, and `Distance.saturating` returns zero.
