import gleeunit
import gleeunit/should
import gleamlang.{gcd, euclid_gcd}

pub fn main() {
  gleeunit.main()
}

pub fn gcd_test() {
  gcd(0,5) |> should.equal(5)
  gcd(5,0) |> should.equal(5)
  gcd(1,1) |> should.equal(1)
  gcd(56,42) |> should.equal(14)
  gcd(461952,116298) |> should.equal(18)
}

pub fn gcd_large_number_case_1_test() {
  gcd(7966496,314080416) |> should.equal(32)
}

// Timeout
// pub fn gcd_large_number_case_2_test() {
  // gcd(24826148,45296490) |> should.equal(526)
// }

pub fn euclid_gcd_test() {
  euclid_gcd(0,5) |> should.equal(5)
  euclid_gcd(5,0) |> should.equal(5)
  euclid_gcd(1,1) |> should.equal(1)
  euclid_gcd(56,42) |> should.equal(14)
  euclid_gcd(461952,116298) |> should.equal(18)
  euclid_gcd(7966496,314080416) |> should.equal(32)
  euclid_gcd(24826148,45296490) |> should.equal(526)
}
