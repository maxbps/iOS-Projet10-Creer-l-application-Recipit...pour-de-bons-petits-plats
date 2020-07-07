import UIKit
import WebKit


class RecipeWeb: UIViewController {
    var recipeid: String!
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(URLRequest(url: URL(string: "http://yummly.com/recipe/" + recipeid)!))
    }
}

func check(error: Error?) {
    if error == nil {
        print("tout va bien")
    }else {
        print("erreur")
    }
}
