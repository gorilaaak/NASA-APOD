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


//Text(detailModel.nasaDATA?.title ?? "")
//    AsyncImage(url: URL(string: "\(detailModel.nasaDATA?.hdurl ?? "")")) { image in
//        image.resizable()
//            .scaledToFit()
//            .cornerRadius(10)
//    } placeholder: {
//        Color.gray
//            .frame(height: 300)
//}
//Text(detailModel.nasaDATA?.explanation ?? "")
//Text("Copyright: \(detailModel.nasaDATA?.copyright ?? "Nobody")")
//Text("Date: \(detailModel.nasaDATA?.date ?? "")")
