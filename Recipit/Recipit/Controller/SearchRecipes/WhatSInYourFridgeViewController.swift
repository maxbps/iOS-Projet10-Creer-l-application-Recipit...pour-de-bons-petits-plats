import UIKit

class WhatSInYourFridgeViewController: UIViewController {
    
    var recipes : RecipesData!
    
    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var textflied: UITextField!
    @IBOutlet weak var ingredientsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        whiteView.addShadow(whiteView: whiteView)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToList"{
            let succesVC = segue.destination as! RecipeListViewController
            succesVC.recipes = recipes
        }
    }
    var yummlyService = YummlyService()
    var ingredients: [String] = []
    
    @IBAction func clearButton(_ sender: Any) {
        ingredients = []
        ingredientsLabel.text = "Ingredients will appear here"
    }
    
    @IBAction func addIngredientButton(_ sender: Any) {
        guard let ingredientText = textflied.text else {return}
        ingredients.append(ingredientText)
        ingredientsLabel.text = ingredients.joined(separator: "\n")
    }
    
    @IBAction func gerRecipesButton(_ sender: Any) {
        RecipeURL.parameters = ingredients.joined(separator: "+")
        
        yummlyService.getRecipes { (success, yummlyResponseJSON) in
            guard let recipes = yummlyResponseJSON else {
                self.presentAlert(message: "Error response")
                print("error")
                return
            }
            self.recipes =  recipes
            self.performSegue(withIdentifier: "segueToList", sender: self)
        }
    }
    
}

