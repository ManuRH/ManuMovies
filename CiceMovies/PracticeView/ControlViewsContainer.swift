//
//  ControlViewsContainer.swift
//  CiceMovies
//
//  Created by cice on 09/06/2021.
//

import SwiftUI

struct ControlViewsContainer: View {
    
    @State private var showAlert = false
    @State private var showActionSheet = false
    @State private var showCustomAlert = false
    
    @State private var changeButonName = "Show Action sheet"
    
    var body: some View {
        ZStack{
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    
                    HeaderComponent()
                    
                    Divider()
                                        
                    CustomButton(showAlertUno: self.$showAlert)
                        .alert(isPresented: self.$showAlert, content: {
                            Alert(title: Text("Ulaaaaa"),
                                  message: Text("Aqui los chicos de CICE con la cabeza rota"),
                                  primaryButton: .default(Text("OK")),
                                  secondaryButton: .cancel())
                        })
                                        
                    Button(action: {
                        self.showActionSheet.toggle()
                    }, label: {
                        HStack{
                            Image(systemName: "play")
                            Text(self.showActionSheet ? "Show Action sheet" : changeButonName)
                        }
                        .font(.title)
                        .foregroundColor(.black)
                    })
                    .actionSheet(isPresented: self.$showActionSheet, content: {
                        ActionSheet(title: Text("Action Sheet"),
                                    message: Text("Esta es una hoja de aciones"),
                                    buttons: [.default(Text("Boton 1"), action: {
                                        self.changeButonName = "El que sea da igual"
                                    }), .default(Text("Boton 2"), action: {
                                        //
                                    }), .cancel()])
                    })
                    
                    Button(action: {
                        self.showCustomAlert.toggle()
                    }, label: {
                        HStack{
                            Image(systemName: "folder")
                            Text("Custom popup")
                        }
                        .font(.title)
                        .foregroundColor(.black)
                    })
                }
            }
            .blur(radius: self.showCustomAlert ? 10 : 0)
            
            if self.showCustomAlert {
                CustomPopupView(showingCustomPopup: self.$showCustomAlert)
            }
        }
    }
}

 struct CustomButton: View {
    @Binding var showAlertUno: Bool
    var body: some View {
        Button(action: {
            self.showAlertUno = true
        }, label: {
            HStack{
                Image(systemName: "play.fill")
                Text("Alert View")
            }
            .font(.title)
            .foregroundColor(.black)
        })
    }
}

struct CustomPopupView: View {
    
    @Binding var showingCustomPopup: Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.7)
                .ignoresSafeArea()
            VStack(spacing: 20) {
                Text("Custom Popup")
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.yellow)
                    .foregroundColor(.black)
                Spacer()
                Button(action: {
                    self.showingCustomPopup = false
                }, label: {
                    Text("Cerrar")
                        .bold()
                        .foregroundColor(.red)
                })
                .padding()
            }
            .frame(width: 300, height: 300)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 10)
        }
    }
}

struct HeaderCustomView: View {
    
    var nombre: String
    var imagen: String
    
    var body: some View {
        HStack{
            Image(systemName: imagen)
                .padding(.trailing)
            Text(nombre)
                .bold()
                .foregroundColor(.blue)
        }
        .padding()
        .font(.title)
        .foregroundColor(.red)
    }
}

struct FormView: View {
    
    @State private var toggle = false
    @State private var myTextField = ""
    @State private var myDatePicker = Date()
    
    var body: some View {
        Form {
            Section{
                HeaderComponent()
            }
            
            Section(header: Text("Cabecera de la seccion")) {
                Text("Como veis se puede añadir un texto a la cabecera")
            }
            
            Section(header: HeaderCustomView(nombre: "Contactos", imagen: "person.2.square.stack.fill")) {
                Text("Aqui un ejemplo de cabecera de imagen con texto")
            }
            
            Section{
                Button(action: {}, label: {
                    Text("Button")
                })
                Toggle(isOn: self.$toggle, label: {
                    Text("Toggle")
                })
                
                Stepper(
                    onIncrement: { },
                    onDecrement: {  },
                    label: {
                        Text("Stepper")
                    })
                TextField("Este es un Textfield", text: self.$myTextField)
                Text(self.myTextField)
                Image(systemName: "leaf.arrow.circlepath")
                Circle()
                DatePicker("datePicker", selection: self.$myDatePicker, displayedComponents: [.date, .hourAndMinute])
            }
        }
    }
}



struct ControlViewsContainer_Previews: PreviewProvider {
    static var previews: some View {
        ControlViewsContainer()
        //CustomButton(showAlert: .constant(true))
        //CustomPopupView(showingCustomPopup: .constant(true))
        //FormView()
    }
}
