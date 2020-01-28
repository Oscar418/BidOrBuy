import UIKit
import Foundation

protocol TradeSearchPresenterViewable {
    func showOnSuccess(with tradeSearch: TradeSearch)
    func showOnFailure(with error: Error?)
}
