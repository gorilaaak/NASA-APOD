//
//  ContentView.swift
//  NASA APOD
//
//  Created by Jakub Petrik on 06/03/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Text")
            .onAppear {
                fetchData()
            }
    }
    
    func fetchData() {
        let urlString = "https://api.nasa.gov/planetary/apod?api_key=\(APIkey.appID)&count=1"
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("Missing data!")
                return
            }
            
            if let json = try? JSONSerialization.jsonObject(with: data) {
                print(json)
            }
        }
        
        task.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
