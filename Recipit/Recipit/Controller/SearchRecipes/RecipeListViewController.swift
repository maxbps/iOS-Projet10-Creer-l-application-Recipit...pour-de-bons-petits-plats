import UIKit
import Alamofire

class RecipeListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var recipes : RecipesData!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        if recipes != nil { print(recipes.matches.count) }
    }
    
}

extension RecipeListViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as? RecipeTableViewCell else {
            print("erreur")
            return UITableViewCell()
        }
        
        guard let response = recipes else {
            print("erreur")
            return UITableViewCell() }
        
        let recipe = response.matches[indexPath.row]
        let ingredients = response.matches[indexPath.row].ingredients.joined(separator: ", ")
        let imageURL = response.matches[indexPath.row].imageUrlsBySize.the90
        print(imageURL)
        cell.configure(labelNameLabel: recipe.recipeName, labelIngredientsLabel:
            ingredients, recipePicUrl: imageURL, rate: recipe.rating, time: recipe.totalTimeInSeconds)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let response = recipes else { return 0 }
        return response.matches.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToRecipe"{
            guard let indexPath = self.tableView.indexPathForSelectedRow else { return }
            let succesVC = segue.destination as! RecipeSelectedViewController
            succesVC.recipeSelected = recipes.matches[indexPath.row]
        }
    }
    
}

