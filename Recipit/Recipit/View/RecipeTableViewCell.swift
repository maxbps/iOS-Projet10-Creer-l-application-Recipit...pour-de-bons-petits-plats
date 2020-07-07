import UIKit
import Alamofire
class RecipeTableViewCell: UITableViewCell {

    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelIngredients: UILabel!
    @IBOutlet weak var recipePic: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    var imageURL: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(labelNameLabel: String, labelIngredientsLabel: String, recipePicUrl: String, rate: Int, time: Int){
        addShadow(whiteView: whiteView)
        labelName.text = labelNameLabel
        labelIngredients.text = labelIngredientsLabel
        let stringRate = String(rate)
        let stringTime = String(time/60)
        rateLabel.text = stringRate
        timeLabel.text = stringTime
        recipePic.downloaded(from: URL(string:recipePicUrl)!)
    }

}



