import UIKit

class FavoriteSelectedViewController: UIViewController {
    
    var recipeFavoriteSelected : Recipe!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UITextView!
    @IBOutlet weak var image400: UIImageView!
    @IBOutlet weak var whiteView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        whiteView.addShadow(whiteView: whiteView)
        imageRequest()
        titleLabel.text = recipeFavoriteSelected.recipeName
        ingredientsLabel.text = recipeFavoriteSelected.ingredientsDetail
    }
    
    func imageRequest(){
        let imageURL = self.recipeFavoriteSelected.image!.replacingOccurrences(of: "s90-c", with: "s400-c")
        print(imageURL)
        self.image400.downloaded(from: URL(string: imageURL)!)
    }
    
}



