//
//  SecondView.swift
//  Financi
//
//  Created by Stephane Girão Linhares on 12/05/22.
//

import SwiftUI

struct SecondView: View {
    @Binding var renda: Renda?

    
    var body: some View {
        NavigationView{
            VStack(alignment: .center) {
                //                ZStack(alignment: .leading) {
                //                    GeometryReader { proxy in
                //                        HStack {
                //                            Spacer()
                //                            RoundedRectangle(cornerRadius: 10)
                //                                .frame(width: 300, height: 45)
                //                                .padding()
                //                                .foregroundColor(.green)
                //
                //                            Spacer()
                //                        }
                //                        RoundedRectangle(cornerRadius: 10)
                //                            .frame(width: 70.0, height: 45)
                //                            .offset(x: ((proxy.size.width - 300) / 2) - 18, y: 0)
                //                            .padding()
                //                            .foregroundColor(.red)
                //
                //
                //                        RoundedRectangle(cornerRadius: 10)
                //                            .frame(width: 3.0, height: 45)
                //                            .offset(x:  300, y: 0)
                //                            .padding()
                //                            .foregroundColor(.black)
                //
                //
                //                    }
                //                }
                Text("Valor inicial: \(CurrencyFormat(renda!.valorInicial).valueFormated)")
                    .bold()
                
                ZStack {
                    nullBar
                    inExpenseLimit
                }
                VStack {
                    
                    HStack{
                         
                        Circle()
                            .fill(Color("SpentColor"))
//                            .fill(.yellow)
//                            .fill(Color("meuYellow"))
                            .frame(width: 16, height: 16)
       
                        Text("Valor gasto: \(CurrencyFormat(renda!.valorGastos).valueFormated)")
                        
                        
                    }
                    HStack{
                         
                        Circle()
                            .fill(.green)
                            .frame(width: 16, height: 16)
       
                        Text("Valor restante: \(CurrencyFormat(renda!.valorFinal).valueFormated)  ")
                        
                        
                    }
                    HStack{
                         
                        Circle()
                            .fill(.red)
                            .frame(width: 16, height: 16)
       
                        Text("Limite de gasto: \(CurrencyFormat(renda!.meta).valueFormated)")
                        
                        
                    }

                }.padding(.trailing, 200.0)
                
                

            
                Text("Despesas")
                    .font(.title2).bold()
                    .padding([.top], 50)
                
                List{
                    ForEach(renda!.gastos){gasto in
                        HStack{
                            Text(gasto.titulo)
                            Spacer()
                            Text(gasto.valor, format: .currency(code: renda!.moeda))
                            
                        }
                    }
                    
                    
                }.listStyle(.plain)
                    
                
            }.navigationTitle("\(getFormattedDate(date: Date(), template: "dd MMMM"))")
        }
    }
    
    var nullBar: some View{
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        Color("SpentColor"),
//                        Color("meuYellow"),
//                        Color(.black),
                    ]),
                startPoint: .leading,
                endPoint: .trailing
            )
                .frame(
                    width: UIScreen.main.bounds.width*0.9,
                    height: UIScreen.main.bounds.height*0.05
                ).cornerRadius(10)
        }
    
    var inExpenseLimit: some View{
            HStack{
                LinearGradient(
                    gradient: Gradient(
                        colors: [
                            Color(.red),
                            Color(.green),
                            Color(.green),
                        ]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            }
            .frame(
                width: UIScreen.main.bounds.width*0.9,
                height: UIScreen.main.bounds.height*0.05
            ).mask(
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: UIScreen.main.bounds.width*0.9*0.5)
                }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            )
        }
}

//struct SecondView_Previews: PreviewProvider {
//    static var previews: some View {
//        SecondView(renda: Renda.exemplo)
//    }
//}



func getFormattedDate(date: Date, template: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.setLocalizedDateFormatFromTemplate(template)
    dateFormatter.locale = Locale(identifier: "pt_BR")
    return dateFormatter.string(from: date)
    
}

