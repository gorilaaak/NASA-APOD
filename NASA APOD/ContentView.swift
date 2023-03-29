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
        ScrollView {
            VStack(
                alignment: .center,
                spacing: 20
            ) {
                ForEach(detailModel.nasaDATA, id: \.self) {data in
                    
                    Text(data.title)
                        .font(.title)
                        .bold()
                        .padding(.top, 30)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .multilineTextAlignment(.center)
                    
                    AsyncImage(url: URL(string: "\(data.hdurl)")) { image in
                        image.resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .padding(.top, 20)
                            .onTapGesture (count: 2, perform: {
                                detailModel.fetchData()
                            })
                        
                    } placeholder: {
                        Color.gray
                            .frame(height: 300)
                }
                    Text(data.explanation)
                        .lineSpacing(5)
                        .font(.callout)
                    
                    Text("Copyright: \(data.copyright ?? "Nobody")")
                    
                    Text("Caption date: \(data.date)")
                }
                
            }
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
