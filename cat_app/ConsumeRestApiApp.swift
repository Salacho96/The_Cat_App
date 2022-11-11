//
//  ConsumeRestApiApp.swift
//  cat_app
//
//  Created by Andres Salazar on 10/11/22.
//

import SwiftUI


func fetchResultsFromApi() {
        struct MyGitHub: Codable {
            
            let breedName: String?
            let origin: String?
            let followers: Int?
            let affectionLevel: Int?
            let intelligence: Int?
            let imageUrl: String
            
            private enum CodingKeys: String, CodingKey {
                case name
                case location
                case followers
                case repos = "public_repos"
                case avatarUrl = "avatar_url"
                
            }
        }
    
    
        guard let gitUrl = URL(string: "https://api.thecatapi.com/v1/breeds") else { return }
        URLSession.shared.dataTask(with: gitUrl) { (data, response
            , error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let gitData = try decoder.decode(MyGitHub.self, from: data)
                print(gitData.name ?? "Empty Name")
                
            } catch let err {
                print("Err", err)
            }
            }.resume()
    }
