//
//  modelView.swift
//  FINAL
//
//  Created by Grant David Hughes on 7/30/25.
//

import Foundation
import SwiftUI

class ModelView: ObservableObject {
    @Published var transactions: [Money] = []
    
    var balance: Double { transactions.reduce(0)
        { total, txn in txn.type == .income ? total + txn.amount : total - txn.amount }
    }
    
    func addTransaction(amount: Double, type: TransactionType, date: Date = Date()) {
        let txn = Money(date: date, amount: amount, type: type)
        transactions.append(txn)
    }
    
    func cumulativeData() -> [(Date, Double)] {
        var runningTotal = 0.0
        return transactions.sorted(by: { $0.date < $1.date }).map {
            txn in runningTotal += txn.type == .income ? txn.amount : -txn.amount
            return (txn.date, runningTotal) }
    }
}
