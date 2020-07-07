import UIKit

class FavoriteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelIngredients: UILabel!
    @IBOutlet weak var recipePic: UIImageView!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var imageURL: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(labelNameLabel: String, labelIngredientsLabel: String, recipePicUrl: String, rateLabelValue: String, timeLabelValue: String){
        addShadow(whiteView: whiteView )
        labelName.text = labelNameLabel
        labelIngredients.text = labelIngredientsLabel
        rateLabel.text = rateLabelValue
        timeLabel.text = timeLabelValue
        recipePic.downloaded(from: URL(string:recipePicUrl)!)
    }
    
}
