//
//  HeaderComponent.swift
//  CiceMovies
//
//  Created by cice on 08/06/2021.
//

import SwiftUI

struct HeaderComponent: View {
    var body: some View {
        VStack{
            CustomTitle(title: "Vistas y Modificadores")
            CustomSubtitle(subtitle: "Conceptos básico")
            CustomDescription(customDescription: "Construir una vista en SwiftUI es muy fácil y lo que hace es basicamente contener subvistas")
        }
    }
}

struct HeaderComponent_Previews: PreviewProvider {
    static var previews: some View {
        HeaderComponent()
    }
}

// Sub Components
struct CustomTitle: View {
    var title: String
    var body: some View {
        Text(title)
            .padding(.horizontal, 20)
            .font(.largeTitle)
            .background(Color.orange)
            .foregroundColor(.black)
            .cornerRadius(10)
    }
}

struct CustomSubtitle: View {
    var subtitle: String
    var body: some View {
        Text(subtitle)
            .padding(.top, 20)
            .font(.title)
            .foregroundColor(.gray)
    }
}

struct CustomDescription: View {
    var customDescription: String
    var body: some View {
        Text(customDescription)
            .padding(.top, 10)
            .frame(maxWidth: .infinity)
            .font(.title)
            .padding()
            .background(Color.orange)
    }
}
