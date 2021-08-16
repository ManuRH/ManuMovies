//
//  FashionContentView.swift
//  CiceMovies
//
//  Created by cice on 10/06/2021.
//

import SwiftUI

struct CustomNavigationView: View {
    var body: some View {
        ZStack{
            HStack(spacing: 15) {
                Button(action: {}, label: {
                    Image(systemName: "slider.horizontal.3")
                        
                })
                Spacer()
                Text("Seasons")
                    .font(.title2)
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "magnifyingglass")
                })
                Button(action: {}, label: {
                    Image(systemName: "alarm")
                })
                Button(action: {}, label: {
                    Image(systemName: "cart")
                })
            }
            .font(.callout)
            .foregroundColor(.black)
        }
        .background(Color.white)
        .padding([.leading, .trailing], 5)
    }
}

struct DetailScroll: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(datas) { item in
                LazyVGrid(columns: Array(repeating: GridItem(), count: 2)){
                    ForEach(item.myRows) { itemX in
                        NavigationLink(
                            destination: DetalleFashionContentView(modelData: itemX),
                            label: {
                                CardCarrousel(modelData: itemX)
                            })
                            .buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
    }
}

struct CardCarrousel: View {
    
    var modelData: Row
    
    var body: some View {
        VStack(spacing: 20) {
            Image(modelData.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .border(Color.black, width: 1)
            HStack{
                VStack(alignment: .leading, spacing: 10, content: {
                    Text(modelData.name).font(.callout).lineLimit(1)
                    Text(modelData.price).fontWeight(.heavy)
                })
                Spacer()
                Button(action: {}, label: {
                    Image("Options")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 10, height: 10)
                })
                .padding(.trailing, 15)
                .contextMenu(ContextMenu(menuItems: {
                    Text("Menu Item 1")
                    Text("Menu Item 2")
                    Text("Menu Item 3")
                }))
            }
        }
    }
}

struct CustomMainView: View {
    
    @State private var selected = "Dress"
    @State private var isExpanded = false
    
    var body: some View {
        VStack(spacing: 20){
            HStack{
                /*DisclosureGroup(
                    isExpanded: self.$isExpanded.animation(),
                    content: { VStack(alignment: .leading){
                        Label("Sun", systemImage: "sun.max")
                        Label("Sun", systemImage: "sun.max")
                        Label("Sun", systemImage: "sun.max")
                    } },
                    label: { Label("Casual Dress", systemImage: "") }
                )*/
                Button(action: {}, label: {
                    HStack{
                        Text("Casual Dress")
                            .font(.headline)
                        Spacer()
                        Image(systemName: "chevron.down")
                            .font(.title3)

                    }
                    .padding()
                })
                .foregroundColor(.black)
                
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "slider.horizontal.3")
                        .padding()
                })
                .foregroundColor(.black)
                .contextMenu(menuItems: {
                    Text("Menu Item 1")
                    Text("Menu Item 2")
                    Text("Menu Item 3")
                })
            }
            
            HStack{
                ForEach(types, id: \.self) { item in
                    HStack{
                        Button(action: {
                            self.selected = item
                        }, label: {
                            Text(item)
                                .font(.system(size: 8, weight: .semibold, design: .default))
                                .padding()
                        })
                        .foregroundColor(self.selected == item ? .white : .black)
                        .background(self.selected == item ? Color.black : Color.clear)
                        .cornerRadius(10)
                    }
                }
            }
            
            DetailScroll()
        }
        .padding([.leading, .trailing], 20)
        .background(Color.white)
    }
}

struct FashionContentView: View {
    var body: some View {
        NavigationView{
            VStack(spacing: 20){
                CustomNavigationView()
                CustomMainView()
            }
            .navigationBarHidden(true)
        }
    }
}

struct FashionContentView_Previews: PreviewProvider {
    static var previews: some View {
        FashionContentView()
        //DetailScroll()
    }
}

// MARK: - Model Data
struct type: Identifiable {
    var id: Int
    var myRows: [Row]
}

struct Row: Identifiable {
    var id: Int
    var name: String
    var image: String
    var price: String
}

var sizes = ["S", "M", "L", "XL"]
var types = ["Dress", "Pants", "Blazers", "Jackets"]
var datas = [type(id: 0, myRows: [Row(id: 0, name: "Fit And Flare", image: "p2", price: "€199"),
                                 Row(id: 1, name: "Fit And Summer", image: "p3", price: "€399"),
                                 Row(id: 2, name: "Empire And Flare", image: "p4", price: "€299"),
                                 Row(id: 3, name: "Fit And Vibes", image: "p2", price: "€99"),
                                 Row(id: 4, name: "Empire And Vibes", image: "p3", price: "€599"),
                                 Row(id: 5, name: "Fit And Empire", image: "p4", price: "€199")])]
