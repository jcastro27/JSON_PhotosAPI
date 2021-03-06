//
//  ContentView.swift
//  SwiftUIPhoto1.2
//
//  Created by Joseph Castro on 6/24/22.
//

import SwiftUI
struct ContentView: View {
    @StateObject private var photoListVM = PhotoListViewModel()

    var body: some View {
        NavigationView{
            List(photoListVM.photos) {photo in
            HStack{
                AsyncImage(url: photo.thumbnailUrl)
                Text(photo.title)
            }
            }.task {
                await photoListVM.populatePhotos()
            }
            .navigationTitle("Photos")
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
