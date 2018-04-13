class PointRectangle
  let topLeft: Point
  let bottomRight: Point

  let _xoff: I64
  let _xlen: I64
  let _yoff: I64
  let _ylen: I64

  new create(topLeft': Point, bottomRight': Point) =>
    topLeft = topLeft'
    bottomRight = bottomRight'

    _xoff = topLeft.x
    _xlen = bottomRight.x - topLeft.x
    _yoff = bottomRight.y
    _ylen = bottomRight.y - topLeft.y

  fun sample(x: I64, y: I64): Point =>
    let xpos = _xoff + (_xlen * x)
    let ypos = _yoff + (_ylen * y)
    Point(xpos, ypos)

  // Equatable
  fun box eq(that: box->PointRectangle): Bool val =>
    (topLeft==that.topLeft) and (bottomRight==that.bottomRight)

  fun box ne(that: box->PointRectangle): Bool val =>
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
