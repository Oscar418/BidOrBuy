import Foundation

class TradeSearchPresenter: TradeSearchPresentable {
    
    var view: TradeSearchPresenterViewable?
    var interactor: TradeSearchInteractable?
    
    func fetchTrades() {
        self.interactor?.fetchTrades()
    }
    
    func onFetchTradesSuccess(tradeSearch: TradeSearch) {
        self.view?.showOnSuccess(with: tradeSearch)
    }
    
    func onFetchTradesFailure(with error: Error?) {
        self.view?.showOnFailure(with: error)
    }
}
