import Foundation

class Trade {
    var images:[Image]?
    var amount:Int?
    var title:String?
    var type:String?
    var userId:Int?
    var hotSelling:Bool?
    var recommendedRetailPrice:Int?
    var categoryBreadCrumb:String?
    var userAlias:String?
    var closeTime:String?
    var homeCategoryId:Int?
    var location:String?
    var openTime:String?
    var tradeId:Int?
    var status:String?
    
    init(with dictionary: [String: Any]?) {
        self.images = [Image]()
        self.amount = dictionary?["amount"] as? Int
        self.title = dictionary?["title"] as? String
        self.type = dictionary?["type"] as? String
        self.userId = dictionary?["userId"] as? Int
        self.hotSelling = dictionary?["amount"] as? Bool
        self.recommendedRetailPrice = dictionary?["recommendedRetailPrice"] as? Int
        self.userAlias = dictionary?["userAlias"] as? String
        self.closeTime = dictionary?["closeTime"] as? String
        self.homeCategoryId = dictionary?["homeCategoryId"] as? Int
        self.location = dictionary?["location"] as? String
        self.openTime = dictionary?["openTime"] as? String
        self.tradeId = dictionary?["tradeId"] as? Int
        self.status = dictionary?["status"] as? String
        guard let trades = dictionary?["images"] as? [[String:Any]] else {
            return
        }
        for item in trades {
            self.images?.append(Image(with: item))
        }
    }
}
