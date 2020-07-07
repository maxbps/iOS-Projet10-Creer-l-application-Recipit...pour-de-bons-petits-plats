import Foundation
import Alamofire

class YummlyService {
    
    private let yummlySession: YummlyProtocol
    
    init(yummlySession: YummlyProtocol = YummlySession()) {
        self.yummlySession = yummlySession
    }
    
    func getRecipes(callback: @escaping (Bool, RecipesData?) -> Void) {
        let yummlyUrlInString = RecipeURL.baseURL + RecipeURL.parameters
        print(yummlyUrlInString)
        guard let url = URL(string: yummlyUrlInString) else { return }
        
        yummlySession.request(url: url) { responseData in
            guard let data = responseData.data, responseData.error == nil else {
                callback(false, nil)
                return
            }
            guard let urlResponseHTTP = responseData.response, urlResponseHTTP.statusCode == 200 else {
                callback(false, nil)
                return
            }
            guard let recipesObject = try? JSONDecoder().decode(RecipesData.self, from: data) else {
                callback(false, nil)
                return
            }
            callback(true, recipesObject)
        }
    }
    
    func getRecipeDetails(callback: @escaping (Bool, RecipeDetailsData?) -> Void) {
        let yummlyUrlInString = RecipeDetailsURL.baseURL + RecipeDetailsURL.recipeId + RecipeDetailsURL.parameters
        guard let url = URL(string: yummlyUrlInString) else { return }
        
        yummlySession.request(url: url) { responseData in
            guard let data = responseData.data, responseData.error == nil else {
                callback(false, nil)
                return
            }
            guard let urlResponseHTTP = responseData.response, urlResponseHTTP.statusCode == 200 else {
                callback(false, nil)
                return
            }
            guard let recipesObject = try? JSONDecoder().decode(RecipeDetailsData.self, from: data) else {
                callback(false, nil)
                return
            }
            callback(true, recipesObject)
        }
    }
    
}
