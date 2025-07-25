//
//  ViewController.swift
//  Proj_3
//
//  Created by Grant David Hughes on 7/21/25.
//

import UIKit

class PokemonViewController: UITableViewController {
    var PokeList: [PokemonAPI] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Pokedex (100 Pokemon)"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        fetchingPokemonData { [weak self] list in
            self?.PokeList = list
            self?.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return PokeList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = PokeList[indexPath.row].name.capitalized
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPokemon = PokeList[indexPath.row]
        let detailViewController = PokemonDetailController(pokeURL: selectedPokemon.url)
        navigationController?.pushViewController(detailViewController, animated: true)
        }

}

