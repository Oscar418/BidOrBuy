import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: TradeSearchPresentable?
    var tradeSearch: TradeSearch?
    let dependancyContainer = DependencyContainer.container()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Trade Search"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.presenter = dependancyContainer.resolve(TradeSearchPresentable.self)
        self.presenter?.view = self
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.setupTradeSearchTableViewCell()
        self.fetchTrades()
    }
    
    func setupTradeSearchTableViewCell() {
        let nib = UINib(nibName: "TradeSearchTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "TradeSearchTableViewCell")
    }
    
    func fetchTrades() {
        guard Reachability.isConnected() else {
            let messageLibrary = MessageLibrary(.network)
            self.showErrorMessage(library: messageLibrary)
            return
        }
        self.showBusyView()
        self.presenter?.fetchTrades()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = self.tradeSearch?.trade?.count else {
            return 0
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TradeSearchTableViewCell", for: indexPath) as? TradeSearchTableViewCell {
            cell.trade = self.tradeSearch?.trade?[indexPath.row]
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
}


extension HomeViewController: TradeSearchPresenterViewable {
    
    func showOnSuccess(with tradeSearch: TradeSearch) {
        self.hideBusyView()
        self.tradeSearch = tradeSearch
        self.tableView.reloadData()
    }
    
    func showOnFailure(with error: Error?) {
        self.hideBusyView()
        let messageLibrary = MessageLibrary(.serverFailure)
        self.showErrorMessage(library: messageLibrary)
    }
}
