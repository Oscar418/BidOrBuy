import Foundation

class TradeSearchInterator: TradeSearchInteractable {
    var service: DataServiceProtocol?
    var tradeSearchPresentable: TradeSearchPresentable?
    
    func fetchTrades() {
        self.service?.get(with: .tradesearch, completion: { (response, error) in
            if let failure = error {
                self.tradeSearchPresentable?.onFetchTradesFailure(with: failure)
            } else {
                let value = response as? [String: Any]
                let tradeSearch = TradeSearch(with: value)
                self.tradeSearchPresentable?.onFetchTradesSuccess(tradeSearch: tradeSearch)
            }
        })
    }
}
