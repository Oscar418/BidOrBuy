import Foundation

class TradeSearch {
    var totalResult:Int?
    var pageNumber:Int?
    var resultsPerPage:Int?
    var trade:[Trade]?
    var orderBy:[Order]?
    var categories:Category?
    var filters:[Filter]?
    
    init(with dictionary: [String: Any]?) {
        self.totalResult = dictionary?["totalResult"] as? Int
        self.pageNumber = dictionary?["pageNumber"] as? Int
        self.resultsPerPage = dictionary?["resultsPerPage"] as? Int
        self.trade = [Trade]()
        self.orderBy = [Order]()
        self.filters = [Filter]()
        guard let trades = dictionary?["trade"] as? [[String:Any]], let orders = dictionary?["orderBy"] as? [[String:Any]], let filters = dictionary?["filters"] as? [[String:Any]] else {
            return
        }
        for item in trades {
            self.trade?.append(Trade(with: item))
        }
        for item in orders {
            self.orderBy?.append(Order(with: item))
        }
        for item in filters {
            self.filters?.append(Filter(with: item))
        }
        self.categories = Category(with: dictionary?["resultsPerPage"] as? [String:Any])
    }
}
