import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 5
    @FocusState private var amountFocus : Bool
    var currencyFormat : FloatingPointFormatStyle<Double>.Currency{
        .currency(code: Locale.current.currency?.identifier ?? "USD")
    }
    var totalPerPerson : Double {
        let tipValue = (checkAmount * Double(tipPercentage))/100
        let total = (tipValue + checkAmount)/Double(numberOfPeople + 2)
        return total
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Amount", value: $checkAmount, format: currencyFormat)
                        .keyboardType(.decimalPad)
                        .focused($amountFocus)
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(2..<25){
                            Text("\($0) people")
                        }
                    }
                }header: {
                    Text("Bill info")
                }
                Section{
                    Picker("Tip percentage" , selection: $tipPercentage){
                        ForEach(0..<101){
                            Text($0 , format: .percent)
                        }
                    }.pickerStyle(.navigationLink)
                }header: {
                    Text("Tip percentage")
                }
                Section{
                    let tipValue = (checkAmount * Double(tipPercentage + 1))/100
                    let total = (tipValue + checkAmount)
                    Text(total , format: currencyFormat).foregroundColor(tipPercentage == 0 ? .red : .black)
                } header:{
                    Text("Total undivided amount")
                }
                Section{
                    Text(totalPerPerson , format:  currencyFormat)
                } header:{
                    Text("Total per person")
                }
                
            }.navigationTitle("WeSplit")
                .toolbar{
                    ToolbarItemGroup(placement: .keyboard){
                        Spacer()
                        Button("Wait"){}
                        Button("Done"){
                            amountFocus = false
                        }
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
