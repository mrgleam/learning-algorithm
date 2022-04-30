import gleam/io
import gleam/list.{any, filter, contains, map, append}

pub type Vertex {
  Vertex(label: String, neighbors: List(String), distance: Int, predecessor :String)
}

pub type Graph = List(Vertex)

// Getter
// Takes in a vertex, a list of vertexes, and returns true or false.
fn vertex_in_vertexes(vertex: Vertex, vertexes: List(Vertex)) -> Bool {
  case vertex, vertexes {
    _, [] -> False
    v, vs -> any(vs, fn(x) { x.label == v.label })
  }
}

// Takes a graph, a list of labels, and outputs a list of vertexes.
pub fn graph_vertexes(graph: Graph, labels: List(String)) -> List(Vertex) {
  case graph, labels {
    [], _ -> []
    vs, [] -> vs
    vs, labels -> filter(vs, fn(x) { labels |> contains(x.label) })
  }
}

pub fn bfs(in: Graph, out: Graph, queue: List(Vertex), seen: List(Vertex)) -> Graph {
  case in, out, queue, seen {
    [], _, _, _ -> []
    _, o, [], _ -> o
    i, o, [hq, ..tq], s -> {
      let current_label = hq.label

      let current_neighbors = hq.neighbors

      let vertexes_of_neighbors = graph_vertexes(i, current_neighbors)

      let dist = hq.distance + 1

      let filtered_neighbors = filter_vertex_neighbors(s, vertexes_of_neighbors)

      let enqueue = update_distance_and_predecessor(filtered_neighbors, dist, current_label)

      let new_out = append(o, enqueue)

      let new_queue = append(tq, enqueue)

      let new_seen = append(s, enqueue)

      bfs(i, new_out, new_queue, new_seen)
    }
  }
}

fn filter_vertex_neighbors(seen: List(Vertex), neighbors: List(Vertex)) -> List(Vertex) {
  case seen, neighbors {
    _, [] -> []
    [], _ -> []
    s, vn -> filter(vn, fn(x) { !vertex_in_vertexes(x, s)})
  }
}

fn update_distance_and_predecessor(vertexes: List(Vertex), dist: Int, pred_label: String) -> List(Vertex) {
  case vertexes, dist, pred_label {
    [], _, _ -> []
    vs, d, l -> map(vs, fn(x) { Vertex(x.label, x.neighbors, d, l) })
  }
}

pub fn main() {
  io.println("Hello from bfs!")
}
