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
                ForEach(detailModel.nasaDATA, id: \.self) {data in
                    Text(data.title)
                    AsyncImage(url: URL(string: "\(data.hdurl)")) { image in
                        image.resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .onTapGesture {
                                detailModel.fetchData()
                            }
                    } placeholder: {
                        Color.gray
                            .frame(height: 300)
                }
                    Text(data.explanation)
                    Text("Copyright: \(data.copyright ?? "Nobody")")
                    Text("Caption date: \(data.date)")
                }
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
