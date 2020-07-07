import UIKit
import CoreData

class RecipeSelectedViewController: UIViewController {
    
    var yummlyRecipeDetailsService = YummlyService()
    var recipeDetail: RecipeDetailsData!
    var indexPath = 0
    var recipeSelected : Infos!
    var ingredients = ""
    var isRecipeAlreadySaveBool: Bool = false
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var whiteWiew: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UITextView!
    @IBOutlet weak var image400: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        whiteWiew.addShadow(whiteView: whiteWiew)
        request()
        imageRequest()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        isRecipeAlreadySave()
    }
    
    func saveRecipe(named recipeName: String, ingredients: String, ingredientsDetail: String, image: String, time: String, rate: String){
        var recipes : [Recipe] = Recipe.all
        isRecipeAlreadySave()
        switch isRecipeAlreadySaveBool{
        case true :
            AppDelegate.viewContext.delete(recipes[indexPath])
            saveButton.setTitle("Save", for: .normal)
        case false :
            let recipe = Recipe(context: AppDelegate.viewContext)
            recipe.recipeName = recipeName
            recipe.ingredients = ingredients
            recipe.ingredientsDetail = ingredientsDetail
            recipe.time = time
            recipe.rate = rate
            recipe.image = image
            saveButton.setTitle("Delete", for: .normal)
        }
        try? AppDelegate.viewContext.save()
    }
    
    func request(){
        RecipeDetailsURL.recipeId = recipeSelected.id
        yummlyRecipeDetailsService.getRecipeDetails { (success, yummlyResponseJSON) in
            guard let recipe = yummlyResponseJSON else {
                self.presentAlert(message: "Error response")
                print("error")
                return
            }
            self.recipeDetail = recipe
            self.ingredients = " - " + self.recipeDetail.ingredientLines.joined(separator: "\n - ")
            self.ingredientsLabel.text = self.ingredients
            self.titleLabel.text = self.recipeSelected.recipeName
        }
    }
    
    func imageRequest(){
        let imageURL = self.recipeSelected.imageUrlsBySize.the90.replacingOccurrences(of: "s90-c", with: "s400-c")
        self.image400.downloaded(from: URL(string: imageURL)!)   }
    
    @IBAction func save(_ sender: Any) {
        saveRecipe(named: recipeSelected.recipeName, ingredients: recipeSelected.ingredients.joined(separator: ", "), ingredientsDetail: ingredients, image: recipeSelected.imageUrlsBySize.the90, time: String(recipeSelected.totalTimeInSeconds/60), rate: String(recipeSelected.rating) )
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToWKWeb"{
            let succesVC = segue.destination as! RecipeWeb
            succesVC.recipeid = recipeSelected.id
        }
    }
    
    func isRecipeAlreadySave(){
        var count = -1
        for coreRecipe in Recipe.all {
            count += 1
            if coreRecipe.recipeName == recipeSelected.recipeName{
                indexPath = count
                isRecipeAlreadySaveBool = true
                saveButton.setTitle("Delete", for: .normal)
                return
            }else{
                isRecipeAlreadySaveBool = false
                saveButton.setTitle("Save", for: .normal)
            }
        }
    }
    
}

