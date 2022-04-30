import gleeunit
import gleeunit/should
import graph.{Vertex}

pub fn main() {
  gleeunit.main()
}

pub fn bfs_input_empty_test() {
  let in = []
  let queue = graph.graph_vertexes(in, ["e"])
  let out = queue
  let seen = queue
  graph.bfs(in, out, queue, seen) |> should.equal([])
}

pub fn bfs_test() {
  let in = [
    Vertex("a", ["b", "c"], 0, ""),
    Vertex("b", ["a", "d", "e"], 0, ""),
    Vertex("c", ["a", "d"], 0, ""),
    Vertex("d", ["b", "c", "e"], 0, ""),
    Vertex("e", ["b", "d", "f", "g"], 0, ""),
    Vertex("f", ["e", "g", "h"], 0, ""),
    Vertex("g", ["e", "f", "i"], 0, ""),
    Vertex("h", ["f", "i"], 0, ""),
    Vertex("i", ["g", "h"], 0, "")
  ]
  let queue = graph.graph_vertexes(in, ["e"])
  let out = queue
  let seen = queue
  let expected = [
    Vertex("e", ["b", "d", "f", "g"], 0, ""),
    Vertex("b", ["a", "d", "e"], 1, "e"),
    Vertex("d", ["b", "c", "e"], 1, "e"),
    Vertex("f", ["e", "g", "h"], 1, "e"),
    Vertex("g", ["e", "f", "i"], 1, "e"),
    Vertex("a", ["b", "c"], 2, "b"),
    Vertex("c", ["a", "d"], 2, "d"),
    Vertex("h", ["f", "i"], 2, "f"),
    Vertex("i", ["g", "h"], 2, "g")
  ]

  graph.bfs(in, out, queue, seen) |> should.equal(expected)
}
