use "ponytest"

actor Main is TestList
  new create(env: Env) =>
    PonyTest(env, this)

  new make() =>
    None

  fun tag tests(test: PonyTest) =>
    test(_TestAdd)
    test(_TestSub)
    test(_TestMul)
    test(_TestAbs)

class iso _TestAdd is UnitTest
  fun name(): String => "addition"

  fun apply(h: TestHelper) =>
    let a = Complex(2, 3)
    let b = Complex(1, 5)
    let c = a.add(b)

    h.assert_eq[Complex](c, Complex(3, 8))

class iso _TestSub is UnitTest
  fun name(): String => "subtraction"

  fun apply(h: TestHelper) =>
    let a = Complex(2, 3)
    let b = Complex(1, 5)
    let c = a.sub(b)

    h.assert_eq[Complex](c, Complex(1, -2))

class iso _TestMul is UnitTest
  fun name(): String => "multiplication"

  fun apply(h: TestHelper) =>
    let a = Complex(2, 3)
    let b = Complex(1, 5)
    let c = a.mul(b)

    h.assert_eq[Complex](c, Complex(-13, 13))

class iso _TestAbs is UnitTest
  fun name(): String => "absolute value"

  fun apply(h: TestHelper) =>
    let a = Complex(2, 3)
    let r = a.abs()

    h.log(r.string())

    // Should be 3.60555..., but comparing floats for equality is hard because of precision
    h.assert_eq[U64]((r*100000).u64(), 360555)
