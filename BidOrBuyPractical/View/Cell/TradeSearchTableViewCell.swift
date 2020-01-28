import UIKit
import Kingfisher

class TradeSearchTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    var trade:Trade? {
        didSet {
            self.populateCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func populateCell() {
        self.titleLabel.text = self.trade?.title
        self.locationLabel.text = self.trade?.location
        self.typeLabel.text = self.trade?.type
        guard let amount = self.trade?.amount else {
            return
        }
        self.amountLabel.text = "R\(amount).00"
        self.loadAssetImage()
    }
    
    func loadAssetImage() {
        guard let imageURL = self.trade?.images?.first?.image else {
            return
        }
        guard let url = URL(string: imageURL) else {
            return
        }
        let resource = ImageResource(downloadURL: url, cacheKey: imageURL)
        self.thumbnailImageView?.kf.setImage(with: resource, placeholder: nil, options: nil, progressBlock: nil, completionHandler: nil)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
