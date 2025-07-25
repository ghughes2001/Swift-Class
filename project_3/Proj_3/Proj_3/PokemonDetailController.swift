//
//  PokemonDetailController.swift
//  Proj_3
//
//  Created by Grant David Hughes on 7/21/25.
//

import Foundation
import UIKit

class PokemonDetailController: UIViewController {
    let pokeURL: String
    let labelForName = UILabel()
    let image = UIImageView()
    let labelForType = UILabel()
    
    init(pokeURL: String) {
        self.pokeURL = pokeURL
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Initializer has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layoutViews()
        fetchingPokemonDetails(url: pokeURL) { [weak self] detail in
            guard let detail = detail else { return }
            self?.labelForName.text = detail.name.capitalized
            self?.labelForType.text = "Types: " + detail.types.map { $0.type.name.capitalized }.joined(separator: ", ")
            
            if let imageURL = detail.sprites.front_default, let url = URL(string: imageURL) {
                URLSession.shared.dataTask(with: url) { data, _, _ in if let data = data {
                    DispatchQueue.main.async {
                        self?.image.image = UIImage(data: data)
                    }
                }
                }.resume()
            }
        }
    }
    
    func layoutViews() {
        labelForName.font = .boldSystemFont(ofSize: 24)
        labelForType.numberOfLines = 0
        image.contentMode = .scaleAspectFit
        
        let stack = UIStackView(arrangedSubviews: [labelForName, image, labelForType])
        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        
        NSLayoutConstraint.activate([stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20), stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20), stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20), ])
    }
}
