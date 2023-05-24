//
//  ConsumeRestApiApp.swift
//  cat_app
//
//  Created by Andres Salazar on 10/11/22.
//
import SwiftUI
import Combine

struct Breed: Codable {
    let id: String
    let name: String
    // Add other properties as needed
}

class BreedViewModel: ObservableObject {
    @Published var breeds: [Breed] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    func fetchBreeds() {
        guard let url = URL(string: "https://api.thecatapi.com/v1/breeds") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Breed].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .assign(to: \.breeds, on: self)
            .store(in: &cancellables)
    }
}
