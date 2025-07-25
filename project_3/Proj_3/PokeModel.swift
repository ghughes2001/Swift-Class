//
//  PokeModel.swift
//  Proj_3
//
//  Created by Grant David Hughes on 7/21/25.
//

import Foundation

struct PokemonAPI: Decodable {
    let name: String
    let url: String
}

struct Pokemon: Decodable {
    let results : [PokemonAPI]
}

struct Sprites: Decodable {
    let front_default: String?
}

struct PokemonType: Decodable {
    let name: String
}

struct Type: Decodable {
    let type: PokemonType
}

struct PokemonDetails: Decodable {
    let name: String
    let sprites: Sprites
    let types: [Type]
}

func fetchingPokemonData(completion: @escaping ([PokemonAPI]) -> Void) {
    guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=100") else {return}
    
    URLSession.shared.dataTask(with: url) { data, _, error in if let data = data {
        do {
            let decoded = try JSONDecoder().decode(Pokemon.self, from: data)
            DispatchQueue.main.async {
                completion(decoded.results)
            }
        } catch {
            print("Decoding Error: ", error)
        }
    }
    }.resume()
}

func fetchingPokemonDetails(url: String, completion: @escaping (PokemonDetails?) -> Void) {
    guard let url = URL(string: url) else {return}
    
    URLSession.shared.dataTask(with: url) { data, _, error in if let data = data {
        do {
            let detail = try JSONDecoder().decode(PokemonDetails.self, from: data)
            DispatchQueue.main.async {
                completion(detail)
            }
        } catch {
            print("Decoding Error: ", error)
        }
    }
    }.resume()
}
