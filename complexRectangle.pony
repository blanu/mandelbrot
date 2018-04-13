class ComplexRectangle
  let topLeft: Complex
  let bottomRight: Complex

  let _xoff: F64
  let _xlen: F64
  let _yoff: F64
  let _ylen: F64

  new create(topLeft': Complex, bottomRight': Complex) =>
    topLeft = topLeft'
    bottomRight = bottomRight'

    _xoff = topLeft.x
    _xlen = bottomRight.x - topLeft.x
    _yoff = bottomRight.y
    _ylen = bottomRight.y - topLeft.y

  fun sample(x: F64, y: F64): Complex =>
    let xpos = _xoff + (_xlen * x)
    let ypos = _yoff + (_ylen * y)
    Complex(xpos, ypos)

  // Equatable
  fun box eq(that: box->ComplexRectangle): Bool val =>
    (topLeft==that.topLeft) and (bottomRight==that.bottomRight)

  fun box ne(that: box->ComplexRectangle): Bool val =>
    (topLeft!=that.topLeft) or (bottomRight!=that.bottomRight)

  // Stringable
  fun box string(): String iso^ =>
    let s = recover iso String end
    s.append("(")
    s.append(topLeft.string())
    s.append(", ")
    s.append(bottomRight.string())
    s.append(")")
    consume s
