//
//  viewModel.swift
//  NASA APOD
//
//  Created by Jakub Petrik on 22/03/2023.
//

import Foundation
import SwiftUI

class viewModel: ObservableObject {
    @Published var nasaDATA: nasaObject?
    
    func fetchData() {
        let urlString = "https://api.nasa.gov/planetary/apod?api_key=\(APIkey.appID)"
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("Missing data!")
                return
            }
            
            let decoder = JSONDecoder()
            if let json = try? decoder.decode(nasaObject.self, from: data) {
                DispatchQueue.main.async {
                    self.nasaDATA = json
                }
            }
        }
        
        task.resume()
    }
}
