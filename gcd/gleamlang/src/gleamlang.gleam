import gleam/io
import gleam/int.{absolute_value, min}
import gleam/list.{range, filter, reverse}

pub fn gcd(x: Int, y: Int) -> Int {
  case x, y {
    0, _ -> absolute_value(y)
    _, 0 -> absolute_value(x)
    x, y -> {
      let a = absolute_value(x)
      let b = absolute_value(y)
      case divisors(a, b) {
        [] -> -1
        [h, ..] -> h
      }
    }
  }
}

fn divisors(x: Int, y: Int) -> List(Int) {
  let a = min(x,y)
  filter(reverse(range(1, a + 1)), fn(z) { x % z + y % z == 0 })
}

pub fn euclid_gcd(x: Int, y: Int) -> Int {
  case x, y {
    x, 0 -> absolute_value(x)
    x, y -> {
      let a = absolute_value(x)
      let b = absolute_value(y)
      euclid_gcd(b, a % b)
    }
  }
}

pub fn main() {
  io.println("Hello from gleamlang!")
}
