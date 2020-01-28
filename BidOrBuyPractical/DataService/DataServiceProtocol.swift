import Foundation

protocol DataServiceProtocol {
    func get(with path: Path, completion: @escaping (Any?, Error?) -> Void)
}
