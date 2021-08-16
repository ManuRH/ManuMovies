//
//  MainView.swift
//  CiceMovies
//
//  Created by cice on 08/06/2021.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack(spacing: 10) {

            HeaderComponent()
            
            Button(action: {
               // aqui esta la accion a ejecutar
            }, label: {
                Text("Botón con sombra")
            })
            .padding()
            .font(.title)
            .foregroundColor(.black)
            .background(Color.yellow)
            .cornerRadius(10)
            .shadow(radius: 10)
            
            
        }
    }
}

struct RefactoringView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 20) {
                HeaderComponent()
                Image(systemName: "hand.thumbsup.fill")
                    .font(.system(size:50))
                    
                
                Image("capturaUno")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .shadow(color: .black, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 8, y: 1)
                    .padding()
                    .overlay(
                        Text("SwiftUI")
                            .foregroundColor(.red)
                            .font(.title)
                            .fontWeight(.bold)
                    )
            }
        }
    }
}

struct Shapes: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderComponent()
            Text("Se puede meter shapes para decorar vistas")
                .foregroundColor(.white)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.blue))
                .padding()
            
            Text("Se puede ajustar el fondo pero NO con un shape(poligono)")
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(radius: 10)
        }
    }
}

struct Vertical: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true){
            VStack(spacing: 20){
                
                HeaderComponent()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("VStack dentro de otra VStack")
                    Divider()
                    Text("Esta puede tener subvistas")
                    Divider()
                    Text("Hasta un maximo de 10")
                    Divider()
                    Image(systemName: "arrow.left")
                }
                .font(.title)
                .padding()
                .foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.blue))
                .padding()
                
                VStack(alignment: .trailing, spacing: 10) {
                    Text("VStack dentro de otra VStack")
                    Divider()
                    Text("Esta puede tener subvistas")
                    Divider()
                    Text("Hasta un maximo de 10")
                    Divider()
                    Image(systemName: "arrow.right")
                }
                .font(.title)
                .padding()
                .foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.blue))
                .padding()
                HeaderComponent()
                HeaderComponent()
                HeaderComponent()
                HeaderComponent()
                HeaderComponent()
                HeaderComponent()
                VStack(alignment: .trailing, spacing: 10) {
                    HeaderComponent()
                }
            }
        }
    }
}

struct HorizontalStackView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                HeaderComponent()
                
                HStack(spacing: 20) {
                    Text("Leading")
                    Text("Middle")
                    Text("Trailing")
                }
                .padding()
                .border(Color.orange)
                
                HStack{
                    Image(systemName: "1.circle").foregroundColor(.orange)
                    Image(systemName: "2.circle").foregroundColor(.blue)
                    Image(systemName: "3.circle").foregroundColor(.red)
                }
                .padding()
                .font(.title)
                
                HStack{
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 100) {
                            Button(action: {
                                //Aqui va la accion del boton
                            }, label: {
                                Image(systemName: "a.circle.fill").foregroundColor(.red)
                            })
                            Image(systemName: "b.circle.fill").foregroundColor(.blue)
                            Image(systemName: "c.circle.fill").foregroundColor(.green)
                            Image(systemName: "d.circle.fill").foregroundColor(.gray)
                            Image(systemName: "e.circle.fill").foregroundColor(.red)
                        }
                        .padding(.horizontal, 20)
                    }
                }
                .frame(maxWidth: .infinity)
                .font(.largeTitle)
                .padding([.top, .bottom], 20)
                .background(Color.yellow)
            }
        }
    }
}

struct AlignmentHStackView: View {
    var body: some View {
        VStack(spacing: 20) {
            
            HeaderComponent()
            
            HStack{
                Rectangle()
                    .foregroundColor(.orange)
                    .frame(width: 25)
                Text("Leading")
                Spacer()
                Text("Center")
                Spacer()
                Text("trailing")
                    .padding(.trailing)
            }
            .border(Color.red)
            
            HStack(alignment: .top){
                Rectangle()
                    .foregroundColor(.orange)
                    .frame(width: 25)
                Text("Leading")
                Spacer()
                Text("Center")
                Spacer()
                Text("trailing")
                    .padding(.trailing)
            }
            .border(Color.red)
            
            HStack(alignment: .bottom){
                Rectangle()
                    .foregroundColor(.orange)
                    .frame(width: 25)
                Text("Leading")
                Spacer()
                Text("Center")
                Spacer()
                Text("trailing")
                    .padding(.trailing)
            }
            .border(Color.red)
        }
    }
}

struct HStackPriority: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            HeaderComponent()
            
            Text(".layoutPriority(1) asigna hacia donde va el equilibrio de la vista")
            
            HStack{
                Text("SwiftUI")
                    .font(.title)
                    .lineLimit(1)
                Image("user1")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                Text("Equilibrio de la vista")
                    .font(.title2)
                    .layoutPriority(1)
            }
            .padding(.horizontal)
            
            HStack{
                Text("SwiftUI")
                    .font(.title)
                    .layoutPriority(1)
                Image("user1")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                Text("Equilibrio de la vista")
                    .font(.title2)
                    .lineLimit(1)
                   
            }
            .padding(.horizontal)
        }
        .padding(.vertical)
    }
}

struct ZStackView: View {
    var body: some View {
        ZStack{
            VStack(spacing: 20) {
                Spacer()
                HeaderComponent()
                Spacer()
            }
        }
        .background(Color.gray)
        .ignoresSafeArea()
    }
}

struct ZSatckAlignment: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderComponent()
            
            ZStack(alignment: .bottomLeading) {
                Image("capturaUno")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Rectangle()
                    .foregroundColor(Color.white.opacity(0.6))
                    .frame(maxWidth: .infinity, maxHeight: 60)
                
                VStack(alignment: .leading) {
                    Button(action: {
                        //Aqui va la acción
                    }, label: {
                        Image(systemName: "square.and.arrow.up")
                            .font(.title)
                            .foregroundColor(.red)
                    })
                    .padding()
                    .background(Color.white)
                    .clipShape(Circle())
                    
                    Text("Andres")
                        .font(.title)
                        .padding(8)
                }
                .padding(.leading, 20)
            }
        }
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        //MainView()//.preferredColorScheme(.dark)
        //RefactoringView
        //Shapes
        //Vertical()
        //HorizontalStackView().preferredColorScheme(.dark)
        //AlignmentHStackView()
        //HStackPriority()
        //ZStackView().previewDevice("iPhone 11 Pro")
        ZSatckAlignment()
    }
}
