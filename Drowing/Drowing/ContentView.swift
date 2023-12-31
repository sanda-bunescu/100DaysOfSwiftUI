//
//  ContentView.swift
//  Drowing
//
//  Created by Sanda Bunescu on 23.09.2023.
//

import SwiftUI

struct Quadrant: View {
    var body: some View {
        ZStack {
            //Crosshairs()
            Rectangle()
                .stroke(Color.primary)
            Image(systemName: "circle")
                .offset(x: 40.0, y: -40.0)
        }
        .frame(width: 160, height: 160)
    }
}

struct Arc: Shape{
    let start: Angle
    let end: Angle
    let clock: Bool
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: start, endAngle: end, clockwise: clock)
        
        return path
    }
}

struct Arrow: Shape{
    var arrowWidth:Double
    let lineLenght: Double
    let LineTriangeDistance: Double
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX - arrowWidth, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX - arrowWidth, y: rect.height - lineLenght))
        path.addLine(to: CGPoint(x: rect.midX - arrowWidth - LineTriangeDistance, y: rect.height - lineLenght))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX + arrowWidth + LineTriangeDistance, y: rect.height - lineLenght))
        path.addLine(to: CGPoint(x: rect.midX + arrowWidth, y: rect.height - lineLenght))
        path.addLine(to: CGPoint(x: rect.midX + arrowWidth, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX - arrowWidth, y: rect.maxY))
        return path
    }
}

struct ContentView: View {
    @State private var lineThickness = 25.0
    @State private var lineHeigth = 200.0
    @State private var LineTriangeDistance = 20.0
    @State private var startGradient = 0.0
    @State private var stopGradient = 0.0
    var body: some View {
        //Arc(start: .degrees(-90), end: .degrees(90), clock: true)
            //.frame(width: 100 , height: 100)
            //.stroke(ImagePaint(image: Image("test") , sourceRect: CGRect(x: 0, y: 0.5, width: 0.5, height: 0.5), scale: 0.8) , lineWidth: 30)
        //Quadrant()
//        VStack{
//            Arrow(arrowWidth: lineThickness, lineLenght: lineHeigth, LineTriangeDistance: LineTriangeDistance)
//            //.stroke(.red, style: StrokeStyle(lineWidth: 10 , lineCap: .square, lineJoin: .miter))
//                .fill(LinearGradient(colors: [.blue , .red], startPoint: .top, endPoint: .bottom))
//                    .frame(width: 300, height: 300)
//            Text("Width of the arrow")
//            Slider(value: $lineThickness, in: 1...50)
//
//        }
        VStack{
            Rectangle()
                .fill(LinearGradient(stops: [.init(color: .black, location: startGradient) , .init(color: .blue, location: stopGradient)], startPoint: .top, endPoint: .bottom))
            Text("Gradient start position")
            Slider(value: $startGradient)
            Text("Gradient stop position")
            Slider(value: $stopGradient)
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
