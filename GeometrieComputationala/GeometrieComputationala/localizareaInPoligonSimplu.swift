import SwiftUI

struct localizareaInPoligonSimplu: View {
    @State private var multimeaVarfurilor = [punct]()
    @State private var Xcoord = ""
    @State private var Ycoord = ""
    @State private var MXcoord = ""
    @State private var MYcoord = ""
    
    @State private var resultat = "-"
    @State private var multimeaPunctelorM = [punct]()
    var linePath: Path {
        var path = Path()
        if let firstPoint = multimeaVarfurilor.first {
            path.move(to: CGPoint(x: CGFloat(firstPoint.x) + 150 , y: CGFloat(firstPoint.y)))
        }
        for point in multimeaVarfurilor.dropFirst() {
            path.addLine(to: CGPoint(x: CGFloat(point.x * 10) + 150, y: CGFloat(point.y * 10)))
            
        }
        return path
    }
    
    var CirclePath: Path{
        var path = Path()
        for punctM in multimeaPunctelorM {
            let circleCenter = CGPoint(x: CGFloat(punctM.x * 10 + 150), y: CGFloat(punctM.y * 10))
            let circleRadius: CGFloat = 2
            path.addArc(center: circleCenter, radius: circleRadius, startAngle: .degrees(0), endAngle: .degrees(360), clockwise: false)
        }

        return path
    
    }

    var body: some View {
        
        Form{
            Section{
                HStack{
                    TextField("X", text: $Xcoord)
                    Divider()
                    TextField("Y", text: $Ycoord)
                }
                Button("Add"){
                    multimeaVarfurilor.append(punct(x: Int(Xcoord)!, y: Int(Ycoord)!))
                }
            }header: {
                Text("Coordonatele varfului")
            }
            ForEach(multimeaVarfurilor ){p in
                Text("X: \(Int(p.x)) Y: \(Int(p.y))")
            }
            GeometryReader { geometry in
                linePath
                    .stroke(Color.red, lineWidth: 2)
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
            .frame(width: 400 , height: 400)
            Section{
                HStack{
                    TextField("Mx", text: $MXcoord)
                    TextField("My", text: $MYcoord)
                }
                Button("Adauga punctul M"){
                    let punctNou = punct(x: Int(MXcoord)!, y: Int(MYcoord)!)
                    multimeaPunctelorM.append(punctNou)
                    
                }
                    ForEach(multimeaPunctelorM) { p in
                        Text(verificaLocalizareaPuntului(punctul: p, in: multimeaVarfurilor))
                    }
            }header: {
                Text("Coordonatele punctului M")
            }
            

        }
    }
    
    func determiantul(a: punct , b: punct , c: punct) -> Int{
        Int((a.x * b.y) + (a.y * c.x) + (b.x * c.y) - (b.y * c.x) - (a.x * c.y) - (b.x * a.y))
    }
    func verificaLocalizareaPuntului(punctul m: punct , in varfuri: [punct]) -> String{
        
        var intersectii = 0
        for nrVarf in 0..<varfuri.count - 1{
            
            var A = punct(x: -100, y: -100)
            var B = punct(x: -100, y: -100)
            
            if varfuri[nrVarf].y == varfuri[nrVarf + 1].y && varfuri[nrVarf + 1].y == m.y && (m.x - varfuri[nrVarf].x)*(m.x - varfuri[nrVarf + 1].x) <= 0 {
                return "Punctul M se afla la frontiera"
            }
            
            if varfuri[nrVarf].y > varfuri[nrVarf + 1].y {
                A = varfuri[nrVarf]
                B = varfuri[nrVarf + 1]
            }
            if varfuri[nrVarf].y < varfuri[nrVarf + 1].y {
                A = varfuri[nrVarf + 1]
                B = varfuri[nrVarf]
            }
            
            if varfuri[nrVarf].y != varfuri[nrVarf + 1].y && m.y > B.y && m.y < A.y {
                if determiantul(a: A, b: m, c: B) > 0{
                    intersectii += 1
                }
                if determiantul(a: A, b: m, c: B) == 0{
                    return "Punctul M se afla la frontiera"
                }
            }
            if varfuri[nrVarf].y != varfuri[nrVarf + 1].y && m.y == A.y {
                if m.x < A.x{
                    intersectii += 1
                }
                if m.x == A.x{
                    return "Punctul M se afla la frontiera"
                }
            }
            
            if varfuri[nrVarf].y != varfuri[nrVarf + 1].y && m.y == B.y {
                if m.x == B.x{
                    return "Punctul M se afla la frontiera"
                }
            }
            
        }
        if intersectii % 2 == 0{
            return "Punctul M se afla in exteriorul planului"
        }else{
            return "Punctul M se afla in interiorul planului"
        }
    }
}

#Preview {
    localizareaInPoligonSimplu()
}
