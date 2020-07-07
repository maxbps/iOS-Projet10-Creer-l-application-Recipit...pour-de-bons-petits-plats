import UIKit
import CoreData

class FavoritesListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var recipes : [Recipe] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        recipes = Recipe.all
        tableView.reloadData()
    }
    
}

extension FavoritesListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as? FavoriteTableViewCell
            else { print("a")
                return UITableViewCell() }
        
        let recipe = recipes[indexPath.row]
        let error = "error"
        cell.configure(labelNameLabel: recipe.recipeName ?? error, labelIngredientsLabel: recipe.ingredients ?? error, recipePicUrl: recipe.image ?? error, rateLabelValue: recipe.rate ?? error, timeLabelValue: recipe.time ?? error)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if recipes.count == 0 {
            presentAlert(message: "Pour remplir cette section il faut ajouter des recettes aux favoris")
        }
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            AppDelegate.viewContext.delete(recipes[indexPath.row])
            try? AppDelegate.viewContext.save()
            recipes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToFavorite"{
            guard let indexPath = self.tableView.indexPathForSelectedRow else { return }
            let succesVC = segue.destination as! FavoriteSelectedViewController
            succesVC.recipeFavoriteSelected = recipes[indexPath.row]
        }
    }
    
}
