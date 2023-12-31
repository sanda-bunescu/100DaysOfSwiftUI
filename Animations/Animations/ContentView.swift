//
//  ContentView.swift
//  Animations
//
//  Created by Sanda Bunescu on 27.08.2023.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}
extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}
struct ContentView: View {
    @State private var animationAmount = 1.0
    @State private var rotationAmount = 0.0
    @State private var animavtionValue = 1.0
    @State private var rotation = 0.0
    @State private var enabled = false
    
    @State private var dragAmount = CGSize.zero
    
    @State private var showingTransition = false
    
    @State private var isShowingRed = false
    
    @State private var datePick = Date()
    let letters = Array("Hello SwiftUI")
    let test = "hi👍🏼👎🏼"
    var body: some View {
                VStack {
                    Stepper("Scale amount", value: $animationAmount, in: 1...10)
        
        
                    Button("Tap Me") {
                        animationAmount += 1
                    }
                    .padding(40)
                    .background(.red)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .scaleEffect(animationAmount)
                    .animation(
                        .easeInOut(duration: 1)
                        .repeatCount(3, autoreverses: true),
                        value: animationAmount
                    )
                    Spacer()
                    Button("Tap Me") {
                        withAnimation(.easeInOut(duration: 3).repeatCount(2)){
                            rotationAmount += 360
                        }
                    }
                    .padding(50)
                    .background(.black)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .rotation3DEffect(Angle.degrees(rotationAmount), axis: (x: 0, y: 1, z: 0))
                    Button("third"){
                        withAnimation(.easeInOut(duration: 3)){
                            rotation += 360
                        }
                        enabled.toggle()
        
                    }
                    .padding(20)
                    .foregroundColor(.black)
                    .background(enabled ? .blue : .red)
                    .animation(.default, value: enabled)
                    .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
                    .rotation3DEffect(.degrees(rotation), axis: (x: 0 , y: 1 , z: 0))
        
                    Button("Tap Me") {
                        enabled.toggle()
                    }
                    .frame(width: 60, height: 60)
                    .background(enabled ? .blue : .red)
                    .animation(.default, value: enabled)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
                    .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
        
                    LinearGradient(gradient: .init(colors: [.blue , .black]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .frame(width: 300 , height: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .offset(dragAmount)
                        .gesture(
                            DragGesture()
                                .onChanged{ dragAmount = $0.translation }
                                .onEnded{ _ in
                                    withAnimation(.spring()){
                                        dragAmount = .zero
                                    }
                                }
                        )
                }
        VStack{
            HStack(spacing: 0) {
                ForEach(0..<letters.count, id: \.self) { num in
                    Text(String(letters[num]))
                        .padding(5)
                        .font(.title)
                        .background(enabled ? .blue : .red)
                        .offset(dragAmount)
                        .animation(.default.delay(Double(num) / 20), value: dragAmount)
                }
            }
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded { _ in
                        dragAmount = .zero
                        enabled.toggle()
                    }
            )
            VStack{
                Button("Tap me"){
                    withAnimation{
                        showingTransition.toggle()
                    }
                }
                if showingTransition == true{
                    Rectangle()
                        .fill(.red)
                        .frame(width: 200 , height: 100)
                        .transition(.asymmetric(insertion: .scale, removal: .opacity))
                }
            }
            ZStack {
                Rectangle()
                    .fill(.blue)
                    .frame(width: 200, height: 200)
                
                if isShowingRed {
                    Rectangle()
                        .fill(.red)
                        .frame(width: 200, height: 200)
                        .transition(.pivot)
                }
            }
            .onTapGesture {
                withAnimation {
                    isShowingRed.toggle()
                }
            }
            Stepper("test \(rotation)", value: $rotation, in: 1...10)
            DatePicker("data", selection: $datePick , displayedComponents: .date )
            
            DatePicker("data \(datePick)", selection: $datePick , displayedComponents: .date )
            //Text("\(test.count)")
        }
    }
}

func test1(){
    var d = DateComponents()
    d.day = 10
    d.month = 7
    d.year = 2002
    let data = Calendar.current.date(from: d)

    var components = DateComponents()
    components.year = 2023
    components.month = 7
    components.day = 14

    let calendar = Calendar.current
    let datePick = calendar.date(from: components)?.formatted(date: .omitted, time: .omitted)

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
