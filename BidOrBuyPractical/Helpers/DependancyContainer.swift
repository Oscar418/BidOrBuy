import Foundation
import Swinject

struct DependencyContainer {
    
    static func container() -> Container {
        let container = Container()
        
        container.register(TradeSearchPresentable.self) { r in
            let presenter = TradeSearchPresenter()
            let tradeSearchInteractor = TradeSearchInterator()
            presenter.interactor = tradeSearchInteractor
            tradeSearchInteractor.service = r.resolve(DataServiceProtocol.self)
            tradeSearchInteractor.tradeSearchPresentable = presenter
            return presenter
        }
        
        container.register(DataServiceProtocol.self) { r in
            return DataService()
        }
        
        return container
    }
}
