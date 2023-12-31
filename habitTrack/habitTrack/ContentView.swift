
import SwiftUI
struct Habit : Identifiable , Codable{
    var id = UUID()
    let name: String
    let description: String
    var time: Int
}

class Habits : ObservableObject {
    @Published var habitsList = [Habit](){
        didSet{
            if let encoded = try? JSONEncoder().encode(habitsList){
                UserDefaults.standard.set(encoded, forKey: "habits")
            }
        }
        
    }
    init(){
        if let data = UserDefaults.standard.data(forKey: "habits"){
            if let decoded = try? JSONDecoder().decode([Habit].self, from: data){
                habitsList = decoded
                return
            }
        }
        habitsList = []
    }
    func addHabit(name: String , description: String ){
        habitsList.append(Habit(name: name , description: description, time: 0))
    }
    func removeHabit(index: IndexSet){
        habitsList.remove(atOffsets: index)
    }
    func verifyExistingHabit(newHabitName: String) -> Bool{
        if habitsList.contains(where: {$0.name == newHabitName}){
            return true
        }
        return false
    }
    func addTime(newTime: Int , habitName: String){
        if let index = habitsList.firstIndex(where: {$0.name == habitName}){
            habitsList[index].time = habitsList[index].time + newTime
            if let encoded = try? JSONEncoder().encode(habitsList){
                UserDefaults.standard.set(encoded, forKey: "habits")
            }
        }
        
    }
}

struct ContentView: View {
    @StateObject var habits = Habits()
    @State private var showAddView = false
    @State private var showListView = false
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                VStack(alignment: .center){
                    Text("HabitTrack")
                        .padding()
                        .font(.system(size: 40 , design: .serif))
                    
                    Group{
                        Text("Empower Your Daily Routine:")
                        Text("Habit Tracking and Monitoring App")
                    }
                    .font(.system(size: 20 , design: .serif))
                }
                Spacer()
                Button{
                    showListView = true
                }label:{
                    HStack{
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                    .font(.system(size: 20,design: .serif))
                    .foregroundStyle(.white)
                    .frame(width: 330 , height: 60)
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                }
                .padding(.bottom)
                Button{
                    showAddView = true
                }label:{
                    HStack{
                        Image(systemName:"plus")
                        Text("Add")
                    }
                    .font(.system(size: 20,design: .serif))
                        .foregroundStyle(.white)
                        .frame(width: 330 , height: 60)
                        .background(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                Spacer()
            }
            
            .background(
                Image("rm251-mind-15-e")
                .resizable()
                .scaledToFill()
            )
            .sheet(isPresented: $showAddView){
                addView(habit: habits)
            }
            .sheet(isPresented: $showListView){
                HabitList(habits: habits)
            }
            .preferredColorScheme(.dark)
            .ignoresSafeArea()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
