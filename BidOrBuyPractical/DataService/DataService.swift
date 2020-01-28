import Foundation
import Alamofire

class DataService: DataServiceProtocol {
    
    let baseURL = "https://demo.bidorbuy.co.za/services/v3"
    let auth = "kfpP9jzHLmoTqRBtzGvxkYYF2GzfWfWhtgHGZVpB"
    let platform = "4"
    let cid = "987654321"
    
    func get(with path: Path, completion: @escaping (Any?, Error?) -> Void) {
        let url = "\(self.baseURL)\(path.rawValue)"
        let headers = self.getHttpHeaders()
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            print(response)
            if response.result.isSuccess {
                completion(response.result.value, nil)
            } else {
                completion(nil, response.error)
            }
        }
    }
    
    func getHttpHeaders() -> [String: String]? {
        var headers:Dictionary = [String: String]()
        headers["X-BOB-AUTHID"] = self.auth
        headers["X-BOB-PLATFORM"] = self.platform
        headers["X-BOB-CID"] = self.cid
        return headers
    }
}
