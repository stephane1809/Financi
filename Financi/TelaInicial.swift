//
//  TelaInicial.swift
//  Financi
//
//  Created by Stephane Girão Linhares on 13/05/22.
//

import SwiftUI

struct TelaInicial: View {
    @Binding var renda: Renda?
    var body: some View {
        NavigationView{
            VStack {
                Text("FINANCI")
                    .fontWeight(.light)
                    .foregroundColor(.blue)
                .font(.largeTitle)
                Spacer()
                
                Text("Renda Inicial: \(CurrencyFormat(renda!.valorInicial).valueFormated)")
                    .font(.title2)
                    .foregroundColor(.blue)

                Text("Meta de economia: \(CurrencyFormat(renda!.meta).valueFormated)")
                    .font(.title2)
                    .foregroundColor(.blue)

                Spacer()
            }
        }
        
    }
}

struct TelaInicial_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TelaInicial(renda: .constant(Renda()))
            TelaInicial(renda: .constant(Renda()))
                .preferredColorScheme(.dark)
        }
    }
}
