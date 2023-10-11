
import Alamofire
import Foundation

struct PaginatedQuery<T: Codable>: Codable {
  var rows: [T]
  var start: Int
  var pageSize: Int
  var total: Int
}
