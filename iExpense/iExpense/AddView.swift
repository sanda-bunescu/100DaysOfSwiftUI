//
//  AddView.swift
//  iExpense
//
//  Created by Sanda Bunescu on 14.09.2023.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    let types = ["Personal" , "Business"]
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var expense : Expenses
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Name", text: $name)
                Picker("Type", selection: $type){
                    ForEach(types , id: \.self){
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
                    
            }
            .toolbar{
                Button("Save"){
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    if type == "Personal"{
                        expense.personalItems.append(item)
                    }else{
                        expense.businessItems.append(item)
                    }
                    dismiss()
                }
            }
            .navigationTitle("Add View")
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expense: Expenses())
    }
}
