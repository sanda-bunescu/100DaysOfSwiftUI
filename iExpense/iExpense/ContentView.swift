import SwiftUI
//Identifiable protocol tells SwiftUI that ExpenseItem class has an unique id with which it can uniquely identify an object by this id (* it is used with UUID() )
struct ExpenseItem: Identifiable , Codable{
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}

class Expenses : ObservableObject {
    @Published var personalItems = [ExpenseItem](){
        didSet{
            if let encoded = try? JSONEncoder().encode(personalItems){
                UserDefaults.standard.set(encoded, forKey: "personalItems")
            }
        }
    }
    @Published var businessItems = [ExpenseItem](){
        didSet{
            if let encoded = try? JSONEncoder().encode(businessItems){
                UserDefaults.standard.set(encoded, forKey: "businessItems")
            }
        }
    }
    init(){
        if let PersonalData = UserDefaults.standard.data(forKey: "personalItems"){
            if let decoded =  try? JSONDecoder().decode([ExpenseItem].self, from: PersonalData){
                personalItems = decoded
                if let BusinessData = UserDefaults.standard.data(forKey: "businessItems"){
                    if let decoded =  try? JSONDecoder().decode([ExpenseItem].self, from: BusinessData){
                        businessItems = decoded
                        return
                    }
                }
            }
        }
        personalItems = []
        businessItems = []
    }
    
}

struct ContentView: View {
    @StateObject var expenses = Expenses()
    
    @State private var showingAddView = false
    var body: some View {
        NavigationView{
            List{
                Section{
                    ForEach(expenses.personalItems) { item in
                        HStack{
                            VStack{
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            Spacer()
                            VStack{
                                Text("\(item.amount)")
                            }
                        }
                        .foregroundColor(item.amount < 10 ? .green : item.amount < 100 ? .yellow : .red)
                    }
                    .onDelete(perform: removePersonalItem)
                }header:{
                    Text("Personal expenses")
                }
                Section{
                    ForEach(expenses.businessItems) { item in
                        HStack{
                            VStack{
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            Spacer()
                            VStack{
                                Text("\(item.amount)")
                            }
                        }
                        .foregroundColor(item.amount < 10 ? .green : item.amount < 100 ? .yellow : .red)
                    }
                    .onDelete(perform: removeBusinessItem)
                }header:{
                    Text("Business expenses")
                }

            }
            .toolbar{
                Button{
                    showingAddView = true
                }label:{
                    Image(systemName: "plus")
                }
                EditButton()//used for deleting items
            }
            .sheet(isPresented: $showingAddView){
                AddView(expense: expenses)
            }
            .navigationTitle("iExpenses")
        }
    }
    func removePersonalItem(index : IndexSet){
        expenses.personalItems.remove(atOffsets: index)
        
    }
    func removeBusinessItem(index : IndexSet){
        expenses.businessItems.remove(atOffsets: index)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
