
import SwiftUI

struct addView: View {
    @ObservedObject var habit : Habits
    @State private var habitName = ""
    @State private var description = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView{
            
            Form{
                Section{
                    TextField("", text: $habitName)
                }header: {
                    Text("Name of the habit")
                }
                Section{
                    TextField("", text: $description)
                }header: {
                    Text("Description")
                }
            }
            
            .navigationTitle("Add habit")
            
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            .toolbar{
                Button("Add"){
                    if habitName != "" && habit.verifyExistingHabit(newHabitName: habitName) == false{
                        habit.addHabit(name: habitName, description: description)
                        dismiss()
                    }
                }
                
                Button("Close"){
                    dismiss()
                }
                
            }
        }
    }
}

struct addView_Previews: PreviewProvider {
    static var previews: some View {
        addView(habit: Habits())
    }
}
