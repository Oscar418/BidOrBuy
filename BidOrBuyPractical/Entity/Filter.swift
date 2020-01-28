import Foundation

class Filter {
    
    var displayName:String?
    var name:String?
    var type:String?
    var value:String?
    
    init(with dictionary: [String: Any]?) {
        self.displayName = dictionary?["displayName"] as? String
        self.name = dictionary?["name"] as? String
        self.type = dictionary?["type"] as? String
        self.value = dictionary?["value"] as? String
    }
}
