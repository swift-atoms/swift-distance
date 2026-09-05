# Distance

`Distance` identifies and implements directed forward separation for fixed-width
unsigned integers. Its `reporting`, `exact`, and `saturating` policies delegate
to Subtraction. A backward pair reports overflow, exact throws
`Subtraction.Error.overflow`, and saturation returns zero. The operation does not
claim metric axioms.
