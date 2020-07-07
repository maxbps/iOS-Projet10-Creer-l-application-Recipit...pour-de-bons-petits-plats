import UIKit
import Foundation
import Alamofire

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFill) {
        contentMode = mode
        Alamofire.request(url).responseData { response in
            switch response.result {
            case .success:
                if let data = response.result.value {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async() {
                        self.image = image
                    }
                }
            case .failure(let error):
                print("error \(error.localizedDescription)")
            }
        }
    }
}

extension UIView{
    
    func addShadow(whiteView: UIView){
        whiteView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7).cgColor
        whiteView.layer.shadowRadius = 2.0
        whiteView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        whiteView.layer.shadowOpacity = 2.0
        whiteView.layer.cornerRadius = 25.0
    }
}

extension UIViewController {

    func presentAlert(message: String) {
        let alertVC = UIAlertController(title: "Alerte", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
}
