import Foundation
import Alamofire

protocol YummlyProtocol {

 func request(url: URL, completionHandler: @escaping (DataResponse<Any>) -> Void)
    
}
