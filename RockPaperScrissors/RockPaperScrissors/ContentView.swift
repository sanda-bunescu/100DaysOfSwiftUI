
import SwiftUI

struct ContentView: View {
    let options = ["rock" , "paper" , "scissors"]
    @State private var randomOption = Int.random(in: 0...2)
    @State private var winLose = Bool.random()
    @State private var score = 0
    @State private var equality = false
    @State private var numberOfSteps = 0
    @State private var gameEnd = false
    var body: some View {
        ZStack{
            LinearGradient(colors: [.white , .gray], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Rock Paper Scrissors")
                    .font(.largeTitle.bold())
                    .fontWeight(.heavy)
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.gray, .black],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                Spacer()
                VStack{
                    Text("My choice is:")
                        
                    Text("\(options[randomOption])").font(.title.monospaced().bold())
                    Text("You need to \(winLose ? "win" : "lose")")
                }
                .font(.title2)
                .foregroundStyle(Color.secondary)
                Spacer()
                HStack{
                    ForEach(options , id: \.self){option in
                        Button(){
                            verifyResult(buttonPressed: option)
                            numberOfSteps += 1
                        }label:{
                            Image(option)
                                .resizable()
                                .frame(width: 120 , height: 120)
                        }
                        .clipShape(Capsule())
                    }
                }
                .padding()
                .alert("Equality" , isPresented: $equality){
                    Button("Continue"){
                        equality = false
                    }
                    .foregroundColor(.blue)
                } message:{
                    Text("Score is not changed")
                }
                Spacer()
                Spacer()
                Text("Score: \(score)")
                    .font(.title.weight(Font.Weight.semibold))
                    
            }
            .alert("End of the game" , isPresented: $gameEnd){
                Button("Restart"){
                    gameEnd = false
                    numberOfSteps = 0
                    score = 0
                }
            }message: {
                Text("Your score is: \(score)")
            }
            .padding()
        }
    }
    func playerWon(buttonPressed : String) -> Bool{
        if(options[randomOption] == "rock")
        {
            if buttonPressed == "scissors"{
                return false
            }
            if buttonPressed == "paper"{
                return true
            }
        }
        if(options[randomOption] == "paper")
        {
            if buttonPressed == "rock"{
                return false
            }
            if buttonPressed == "scissors"{
                return true
            }
        }
        if(options[randomOption] == "scissors")
        {
            if buttonPressed == "paper"{
                return false
            }
            if buttonPressed == "rock"{
                return true
            }
        }
        return false;
    }
    func verifyResult(buttonPressed : String){
        if numberOfSteps == 9{
            gameEnd = true
        }
        if(options[randomOption] == buttonPressed)
        {
            equality = true
        }else{
            score = (winLose == playerWon(buttonPressed: buttonPressed)) ? score + 1 : score - 1
        }
        reset()
    }
    func reset(){
        randomOption = Int.random(in: 0...2)
        winLose.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
