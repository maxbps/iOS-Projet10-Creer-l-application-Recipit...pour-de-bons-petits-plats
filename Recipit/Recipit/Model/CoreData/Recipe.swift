import Foundation
import CoreData

class Recipe: NSManagedObject{
    static var all: [Recipe]{
        let request: NSFetchRequest<Recipe> = Recipe.fetchRequest()
        guard let recipes = try? AppDelegate.viewContext.fetch(request) else{
            return []
        }
        return recipes
    }
}

