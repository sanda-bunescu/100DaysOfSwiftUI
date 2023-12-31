//
//  ContentView.swift
//  Edutainment
//
//  Created by Sanda Bunescu on 06.09.2023.
//

import SwiftUI

struct gameView: View{
    @Environment(\.dismiss) var dismiss
    var body: some View{
        Text("hi")
        Button("Dismiss"){
            dismiss()
        }
    }
}
struct ContentView: View {
    let image = "Preview"
    @State private var limit = 3
    @State private var questions = [5 , 15 , 20 , 25]
    @State private var nrOfQuestions = 0
    
    @State private var value = [0 , 0]
    @State private var result = 0
    @State private var insertedResult = ""
    
    @State private var score = 0
    @State private var nrOfRepetitions = 0
    
    @State private var alertMessage = ""
    @State private var alertTitle = ""
    @State private var alertShow = false
    
    @State private var disableButtons = false
    @State private var showSheet = false
    
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(colors: [.blue , .yellow], startPoint: .bottomLeading, endPoint: .topTrailing)
                    .ignoresSafeArea()
                VStack {
                    Stepper("Up to: \(limit)", value: $limit, in: 2...12)
                    Section{
                        HStack{
                            ForEach(0..<4){ nr in
                                Button("\(questions[nr])"){
                                    nrOfQuestions = questions[nr]
                                    disableButtons = true
                                }
                                .disabled(disableButtons)
                            }
                            .padding()
                        }
                    }header: {
                        Text("Number of questions").foregroundStyle(.ultraThinMaterial)
                    }
                    Button("Go"){
                        showSheet = true
                    }
                    
//                    Text("\(value[0]) x \(value[1])")
//
//                    TextField("Result", text: $insertedResult)
//                        .keyboardType(.decimalPad)
//                    Text("Score: \(score)")
                    
                }
                .sheet(isPresented: $showSheet){
                    gameView()
                }
                
            }
            .toolbar{
                ToolbarItem(placement: .keyboard){
                    Button("Submit" ){
                        continueGame()
                        insertedResult = ""
                    }
                }
                ToolbarItem(placement: .navigationBarLeading ){
                    Button("Start"){
                        if nrOfRepetitions == 0 && nrOfQuestions != 0{
                            generateRandomMultiplication()
                        }
                    }
                    
                }
            }

        }
        .alert(alertTitle, isPresented: $alertShow ){
            Button("Restart"){
                value[0] = 0
                value[1] = 0
                score = 0
                nrOfRepetitions = 0
                insertedResult = ""
                disableButtons = false
            }
        }message: {
            Text(alertMessage)
        }
        
    }
    func generateRandomMultiplication() {
        value[0] = Int.random(in: 2...limit)
        value[1] = Int.random(in: 2...limit)
        result = value[0] * value[1]
    }
    
    func verifyResult() -> Bool{
        if Int(insertedResult) == result{
            return true
        }
        return false
    }
    func continueGame(){
        if nrOfRepetitions != nrOfQuestions{
            if verifyResult() == true{
                score += 1
            }else{
                score -= 1
            }
            nrOfRepetitions += 1
            generateRandomMultiplication()
        }
        if nrOfQuestions == nrOfRepetitions{
            alertTitle = "Final score"
            alertMessage = "score: \(score)"
            alertShow = true
        }
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
