//
//  ViewController.swift
//  Recipe
//
//  Created by Grant David Hughes on 6/25/25.
//

import UIKit

struct Recipe {
    let title: String
    let imageTitle: String
    let description: String
    let ingredients: [String]
    let instructions: [String]
}

let _data: [Recipe] = [
    Recipe(title: "French Toast",
           imageTitle: "french_toast",
           description: "Classic French Toast With A Hint Of Cinnamon and Vanilla Extract!",
           ingredients: [" Loaf of Bread", " 3 Large Eggs", " 1/2 cup Milk", " 1 Teaspoon of Vanilla extract", " 1 Teaspoon Of Cinnamon (Can Add More If You Like)"],
           instructions:  ["1) Place a skillet on a burner and trun on to medium",
                           "2) In a large bowl, whisk the eggs and milk",
                           "3) Add and whisk the vanilla extract and cinnamon",
                           "4) Open the bread and place a slice in the mixture (It needs to be soaked)",
                           "5) Once the bread is soaked, place it in the skillet",
                           "6) Cook the French toast for 2-3 minutes on each side until golden brown",
                           "7) Serve hot"]),
    Recipe(title: "Scrambled Eggs",
           imageTitle: "scrambled-eggs",
           description: "The Perfect Tasting Scrambled Eggs!",
           ingredients: ["Eggs", " 1-2 Teapsoon of Oil OR 1/2 to 1 Tablespoon of Butter"],
           instructions: ["1) Place pan on burner and turn on low",
                          "2) Whisk the eggs in a bowl",
                          "3) Add oil or butter to the pan",
                          "4) Pour the eggs into the pan", "5) Scramble the eggs over medium heat",
                          "5) Serve"]),
    Recipe(title: "Peanut Butter and Jelly Sandwich",
           imageTitle: "peanut_butter_and_jelly_sandwich",
           description: "A Classic Peanut Butter and Jelly Sandwich!",
           ingredients: ["Bread", "Peanut Butter", "Jelly"],
           instructions: ["1) Take two slices of bread",
                          "2) Spread peanut butter on one side of each slice of bread",
                          "3) Spread jelly on the other side of each slice of bread",
                          "4) Put the two slices together to make a sandwich"])
]

class RecipeListPage: UIViewController {
    
    var model: [Recipe]! = _data

    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
    }
    
    @IBOutlet var table: UITableView!
    
}

extension RecipeListPage: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = model[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipeDetailsStoryBoard = UIStoryboard(name: "RecipeDetailsPage", bundle: Bundle.main)
        let recipeDetailsPage = recipeDetailsStoryBoard.instantiateInitialViewController() as! RecipeDetailsPage
        recipeDetailsPage.model = model[indexPath.row]
        navigationController?.pushViewController(recipeDetailsPage, animated: true)
    }
}

class RecipeDetailsPage: UIViewController {
    var model: Recipe!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ingredientsstack: UIStackView!
    @IBOutlet weak var stepsTable: UITableView!
    @IBOutlet weak var recipeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = model.title
        
        recipeImage.image = UIImage(named: model.imageTitle)
        descriptionLabel.text = model.description
        
        model.ingredients.forEach { ingredient in
            let label = UILabel()
            label.text = ingredient
            ingredientsstack.addArrangedSubview(label)
        }
        stepsTable.dataSource = self
    }
}

extension RecipeDetailsPage: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.instructions.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = "Step \(indexPath.row + 1)"
        cell.detailTextLabel?.text = model.instructions[indexPath.row]
        cell.detailTextLabel?.numberOfLines = 0
        
        return cell
    }
}


