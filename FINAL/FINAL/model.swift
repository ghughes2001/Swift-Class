//
//  model.swift
//  FINAL
//
//  Created by Grant David Hughes on 7/30/25.
//

import Foundation
import SwiftUICore

enum TransactionType: String, CaseIterable, Identifiable {
    case income = "Income"
    case expense = "Expense"
    
    var id: String { self.rawValue }
}

struct Money: Identifiable {
    let id = UUID()
    let date: Date
    let amount: Double
    let type: TransactionType
}
