//
//  ControlRenda.swift
//  Financi
//
//  Created by Stephane Girão Linhares on 17/05/22.
//

import Foundation
class ControlRenda: ObservableObject {
    @Published var renda: Renda?
    
    init() {
        load()
    }
    func add(rendaNova: Renda) {
        self.renda = rendaNova
    }
    func addGasto(gastoNovo: Gastos) {
        renda?.gastos.append(gastoNovo)
    }
    func update(rendaNova: Renda) {
        self.renda = rendaNova
    }
    func delete() {
        // apagar o objeto
    }
    func load() {
        self.renda = Renda.exemplo
    }
    //save
}
