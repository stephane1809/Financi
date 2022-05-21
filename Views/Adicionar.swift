//
//  Adicionar.swift
//  Financi
//
//  Created by Stephane Girão Linhares on 17/05/22.
//

import SwiftUI

struct Adicionar: View {
    
    @EnvironmentObject var ctrlRenda: ControlRenda
    
    @State private var text: String = ""
    @State private var text2: String = ""
    @State private var text3: String = ""
    
    private var selectedKeyboard: UIKeyboardType = .default
    var body: some View {
        NavigationView{
            VStack{
                List{
                    Section("Nome:"){
                        TextEditor(text: $text)
                    }
                    
                    Section("valor:"){
                        TextField("00,00", text: $text2)
                            .keyboardType(.decimalPad)
                    }
                    
                }
                .listStyle(.insetGrouped)
                Spacer()
                Button(action: {
                    ctrlRenda.addGasto(gastoNovo: Gastos(titulo: text, valor: Double(text2)!, descricao: text3))
                })
                {
                    Text("Salvar")
                }.padding()
               

            }.navigationTitle("Nova despesa")
        }
        
    }
}

struct Adicionar_Previews: PreviewProvider {
    static var previews: some View {
        Adicionar()
            .environmentObject(ControlRenda())
    }
}




