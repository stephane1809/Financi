//
//  Renda.swift
//  Financi
//
//  Created by Stephane Girão Linhares on 16/05/22.
//

import Foundation

struct Renda: Codable {
    var valorInicial: Double = 900
    
    var moeda: String = "BRL"
    var meta: Double = 120
    var dataInicial: Date = Date()
    var dataFinal: Date = Calendar.current.date(byAdding: .day, value: 15, to: Date())!
    var gastos: [Gastos] = []
    var valorGastos: Double{
        var dinheiroGasto = 0.0
        for gasto in gastos {
            dinheiroGasto += gasto.valor
        }
        return dinheiroGasto
    }
    var valorLimite: Double = 0
    var valorFinal: Double {
        var dinheiroGasto = 0.0
        for gasto in gastos {
            dinheiroGasto += gasto.valor
        }
        return valorInicial - dinheiroGasto
    }
}

struct Gastos: Identifiable, Codable {
    var id = UUID()
    var titulo: String // F
    var valor: Double // F
    var descricao: String // F
    var data: Date = Date()
}

extension Renda{
    static var exemplo = Renda(
        valorInicial: 900,
        meta: 120,
        gastos: [
            Gastos(titulo:"Comida",valor: 70, descricao: "batata-frita", data: Date()),
            Gastos(titulo:"Uber1",valor: 140,descricao: "academy1", data: Date()),
            Gastos(titulo:"Uber",valor: 210,descricao: "academy", data: Date()),
            Gastos(titulo:"Uber3",valor: 280,descricao: "academy6", data: Date())
           
        ]
    )
}

class CurrencyFormat{
    private let numberFormatter: NumberFormatter
    
    private let value: Double
    
    let valueFormated: String
    
    init(_ value: Double) {
        self.numberFormatter = NumberFormatter()
        self.numberFormatter.usesGroupingSeparator = true
        self.numberFormatter.numberStyle = .currency
        self.numberFormatter.locale = Locale.current
        self.numberFormatter.maximumFractionDigits = 2
        
        self.value =  value
        
        self.valueFormated = numberFormatter.string(from: NSNumber(value: self.value))!
        
        
    }
}
