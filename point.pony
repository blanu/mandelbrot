class Point
  let x: I64
  let y: I64

  new create(x': I64, y': I64) =>
    x = x'
    y = y'

// Equatable
  fun box eq(that: box->Point): Bool val =>
    (x==that.x) and (y==that.y)

  fun box ne(that: box->Point): Bool val =>
    (x!=that.x) or (y!=that.y)

// Stringable
  fun box string(): String iso^ =>
    let s = recover iso String end
    s.append("(")
    s.append(x.string())
    s.append(", ")
    s.append(y.string())
    s.append(")")
    consume s
