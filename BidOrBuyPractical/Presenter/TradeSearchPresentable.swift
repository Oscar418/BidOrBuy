import Foundation

protocol TradeSearchPresentable {
    var view: TradeSearchPresenterViewable?{get set}
    func fetchTrades()
    func onFetchTradesSuccess(tradeSearch: TradeSearch)
    func onFetchTradesFailure(with error: Error?)
}
