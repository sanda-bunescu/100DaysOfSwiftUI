//
//  HabitList.swift
//  habitTrack
//
//  Created by Sanda Bunescu on 01.10.2023.
//

import SwiftUI

struct HabitList: View {
    
    @ObservedObject var habits: Habits
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    Text("Press on habit to start the session")
                        .font(.headline)
                        .opacity(0.6)
                    ForEach(habits.habitsList){ activity in
                        NavigationLink(activity.name){
                            VStack{
                                habitDescriptionView(habits: habits,name: activity.name ,description: activity.description, practiceTime: activity.time)
                            }
                        }
                        
                    }
                    .onDelete(perform: habits.removeHabit)
                }
            }
            
            .navigationTitle("Habit List")
            .toolbar{
                Button("Close"){
                    dismiss()
                }
                EditButton()
            }
        }
    }
}

#Preview {
    HabitList(habits: Habits())
}
