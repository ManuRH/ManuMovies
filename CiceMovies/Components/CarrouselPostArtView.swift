//
//  CarrouselPostArtView.swift
//  CiceMovies
//
//  Created by cice on 14/06/2021.
//

import SwiftUI

struct CarrouselPostArtView: View {
    
    var modelData: [AppleMoviesViewModel]
    var title: String

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack{
                Text(title).font(.title).fontWeight(.bold).padding(.horizontal)
                Rectangle()
                    .fill(Color(UIColor.red).opacity(0.3))
                    .frame(width: 50, height: 5)
            }.padding(.bottom, 10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16) {
                    ForEach(self.modelData) { item in
                        PosterCardArtworkView(model: item)
                    }
                }
            }
        }
    }
}
