class Complex
  let x: F64
  let y: F64

  new create(x': F64, y': F64) =>
    x = x'
    y = y'

  fun mul(other: Complex): Complex =>
    // (x + yi)(u + vi) = (xu - yv) + (xv + yu)i
    let u = other.x
    let v = other.y

    let x' = (x*u) - (y*v)
    let y' = (x*v) + (y*u)

    Complex(x', y')

  fun add(other: Complex): Complex =>
    // (x + yi) + (u + vi) = (x + u) + (y + v)i
    let u = other.x
    let v = other.y

    let x' = x + u
    let y' = y + v

    Complex(x', y')

  fun sub(other: Complex): Complex =>
    // (x + yi) + (u + vi) = (x + u) + (y + v)i
    let u = other.x
    let v = other.y

    let x' = x - u
    let y' = y - v

    Complex(x', y')

  fun abs(): F64 =>
    // |(x + yi)| = sqrt(x^2 + y^2)
    (x.pow(2) + y.pow(2)).sqrt()

// Equatable
  fun box eq(that: box->Complex): Bool val =>
    (x==that.x) and (y==that.y)

  fun box ne(that: box->Complex): Bool val =>
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
