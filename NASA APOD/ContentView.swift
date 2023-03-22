//
//  ContentView.swift
//  NASA APOD
//
//  Created by Jakub Petrik on 06/03/2023.
//

import SwiftUI

struct ContentView: View{
    @StateObject private var detailModel = viewModel()
    
    
    var body: some View {
        NavigationView {
            List {
                Text(detailModel.nasaDATA?.title ?? "")
                Text(detailModel.nasaDATA?.explanation ?? "")
                Text(detailModel.nasaDATA?.copyright ?? "")
                Text(detailModel.nasaDATA?.date  ?? "")
            }
            .navigationTitle("NASA APOD")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                detailModel.fetchData()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
