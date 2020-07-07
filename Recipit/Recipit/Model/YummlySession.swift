import Foundation
import Alamofire

class YummlySession: YummlyProtocol {
    
    func request(url: URL, completionHandler: @escaping (DataResponse<Any>) -> Void) {
        Alamofire.request(url).responseJSON { responseData in
            completionHandler(responseData)
        }
    }
    
}
