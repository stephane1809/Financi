//
//  ContentView.swift
//  Financi
//
//  Created by Stephane Girão Linhares on 12/05/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var ctrlRenda: ControlRenda
    var body: some View {
        TabView {
            SecondView(renda: $ctrlRenda.renda)
                .tabItem {
                    Image(systemName: "calendar")
                }
            Adicionar()
                .tabItem {
                    Image(systemName: "rectangle.stack.fill.badge.plus")
                }
            TelaInicial(renda: $ctrlRenda.renda)
                .tabItem {
                    Image(systemName: "creditcard")
                }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
}
