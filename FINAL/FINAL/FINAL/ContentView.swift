//
//  ContentView.swift
//  FINAL
//
//  Created by Grant David Hughes on 7/30/25.
//

import SwiftUI
import Charts

struct ContentView: View {
    @StateObject private var viewModel = ModelView()
    @State private var amount = ""
    @State private var selectedType: TransactionType = .expense
    @State private var selectedDate = Date()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                Text("Current Balance: $\(viewModel.balance, specifier: "%.2f")")
                    .font(.largeTitle)
                    .bold()
                
                Chart {
                    ForEach(viewModel.cumulativeData(), id: \.0) { date, value in LineMark(x: .value("Date", date), y: .value("Balance", value))
                    }
                }
                .frame(height: 200)
                
                Form {
                    Section(header: Text("New Transaction")) {
                        TextField("Amount", text: $amount)
                            .keyboardType(.decimalPad)
                        Picker("Type", selection: $selectedType) { ForEach(TransactionType.allCases) { type in Text(type.rawValue).tag(type) }
                        }
                        DatePicker("Date", selection: $selectedDate, displayedComponents: .date)
                        Button("Add Transaction") { if let amt = Double(amount) { viewModel.addTransaction(amount: amt, type: selectedType, date: selectedDate)
                            amount = "" }
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
                
                List {
                    ForEach(viewModel.transactions.reversed()) { txn in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(txn.type.rawValue)
                                    .font(.headline)
                                Text(txn.date, style: .date)
                                    .font(.caption)
                            }
                            Spacer()
                            
                            Text(String(format: "$%.2f", txn.amount))
                                .foregroundColor(txn.type == .income ? .green : .red)
                        }
                    }
                }
            }
            .navigationTitle("Finance Tracker")
        }
    }
}

#Preview {
    ContentView()
}
