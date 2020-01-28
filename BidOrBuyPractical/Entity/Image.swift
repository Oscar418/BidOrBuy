import Foundation

class Image {
    
    var image:String?
    var thumbnail:String?
    
    init(with dictionary: [String: Any]?) {
        self.image = dictionary?["image"] as? String
        self.thumbnail = dictionary?["thumbnail"] as? String
    }
}
