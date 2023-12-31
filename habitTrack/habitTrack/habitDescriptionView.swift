
import SwiftUI

struct timerView: View {
    //@ObservedObject var habits: Habits
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var startTime = Date.now
    @State private var interval = 0
    @State private var timerPaused = false
    @State private var startTimer = false
    
    var formattedInterval: String{
        let min = interval / 60
        let sec = interval % 60
        return String(format: "%02d:%02d", min , sec)
    }
    @State private var pausedTime = 0
    @State var habitName: String
    @State var habit: Habits
    
    var body: some View {
        VStack{
            Text("\(formattedInterval)")
                .onReceive(timer){ endTime in
                    interval = pausedTime + Int(endTime.timeIntervalSince(startTime))
                }
            HStack{
                Button{
                    if timerPaused == false{
                        timer.upstream.connect().cancel()
                        pausedTime = interval
                        habit.addTime(newTime: pausedTime, habitName: habitName)
                        timerPaused.toggle()
                    
                    }else{
                        startTime = Date.now
                        interval = 0
                        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                        timerPaused.toggle()
                    }
                }label:{
                    if timerPaused{
                        Image(systemName: "play.circle")
                    }else{
                        Image(systemName: "pause.circle")
                    }
                }
            }
        }
    }
}


struct habitDescriptionView: View {
    
    @ObservedObject var habits: Habits
    let name: String
    let description: String
    let practiceTime: Int
    var formattedPracticeTime: String{
        let min = practiceTime / 60
        let sec = practiceTime % 60
        return String(format: "%02d:%02d", min , sec)
    }
    var body: some View {
        
        let timer = timerView(habitName: name, habit: habits)
        NavigationView{
            VStack{
                Text("Habit description")
                    .font(.system(size: 30 , design: .serif))
                Spacer()
                Text(description)
                    .font(.system(size: 20 , design: .serif))
                Spacer()
                Spacer()
                HStack{
                    //Spacer()
                    VStack{
                        Text("Practiced: \(formattedPracticeTime)")
                            .font(.system(size: 25,design: .serif))
                        
                    }
                    Spacer()
                    timer
                        .font(.system(size: 30,design: .serif))
                    //Spacer()
                }
                .padding()
                .foregroundStyle(.white)
                .background(Image("rm251-mind-15-e"))
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(radius: 10)
                .frame(width: 360,height: 400)
                Spacer()
            }
            
        }
    }
}

#Preview {
    habitDescriptionView(habits: Habits() , name:"Sanda" , description: "Hello" , practiceTime: 0)
}
