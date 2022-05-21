//
//  ControlGastos.swift
//  Financi
//
//  Created by Stephane Girão Linhares on 17/05/22.
//

import Foundation
import Metal
class ControlGastos: ObservableObject {
    @Published var gasto: Gastos
    
    init(gastoInicial: Gastos) {
        self.gasto = gastoInicial
    }
    
    func add(_ gastoNovo: Gastos) {
    
        // ctrl de renda, add <- gastoNovo
    } //
    func update() {}
    func delete() {}
}
