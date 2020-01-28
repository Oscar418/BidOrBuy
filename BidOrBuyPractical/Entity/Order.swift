import Foundation

class Order {
    
    var displayName:String?
    var value:String?
    var selected:Bool?
    
    init(with dictionary: [String: Any]?) {
        self.displayName = dictionary?["displayName"] as? String
        self.value = dictionary?["value"] as? String
        self.selected = dictionary?["selected"] as? Bool
    }
}
