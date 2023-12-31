import SwiftUI

struct LocalizareaInPoligonConvex: View {
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
        
        var Gx = (varfuri[0].x + varfuri[1].x + varfuri[2].x) / 3
        var Gy = (varfuri[0].y + varfuri[1].y + varfuri[2].y) / 3

        var multimeVarfuri = varfuri
        var punctM = m
        
        for i in 0..<multimeVarfuri.count{
            multimeVarfuri[i].x = multimeVarfuri[i].x - Gx
            multimeVarfuri[i].y = multimeVarfuri[i].y - Gy
        }
        punctM.x = punctM.x - Gx
        punctM.y = punctM.y - Gy
        Gx = 0
        Gy = 0
        
        multimeVarfuri = sorteaza(array: multimeVarfuri)
        print(multimeVarfuri)
        print("PunctM: \(punctM)")
        
        let pozitionareaLuiM = cautaPunctulM(array: multimeVarfuri, M: punctM)!
        
        if determiantul(a: punctM, b: multimeVarfuri[pozitionareaLuiM], c: multimeVarfuri[pozitionareaLuiM + 1]) > 0{
            return "M(\(punctM.x),\(punctM.y)) se afla in interior"
        }
        if determiantul(a: punctM, b: multimeVarfuri[pozitionareaLuiM], c: multimeVarfuri[pozitionareaLuiM + 1]) < 0{
            return "M(\(punctM.x),\(punctM.y)) se afla in exterior"
        }
        if determiantul(a: punctM, b: multimeVarfuri[pozitionareaLuiM], c: multimeVarfuri[pozitionareaLuiM + 1]) == 0{
            return "M(\(punctM.x),\(punctM.y)) se afla pe frontiera"
        }
        return "M se afla intre (\(multimeVarfuri[pozitionareaLuiM].x),\(multimeVarfuri[pozitionareaLuiM].y)) si (\(multimeVarfuri[pozitionareaLuiM + 1].x),\(multimeVarfuri[pozitionareaLuiM + 1].y))"
        
    }
    
    func sorteaza(array: [punct]) -> [punct]{
        guard array.count > 1 else { return array }
        
        let mid = array.count / 2
        let leftArray = sorteaza(array: Array(array[0..<mid]))
        let rightArray = sorteaza(array: Array(array[mid..<array.count]))
        
        return merge(leftArray: leftArray, rightArray: rightArray)
    }
    func merge(leftArray: [punct] , rightArray: [punct]) -> [punct]{
        var newSortedArray = [punct]()
        var leftArrayIndex = 0
        var rightArrayIndex = 0
        
        while(leftArrayIndex < leftArray.count && rightArrayIndex < rightArray.count){
            if cadran(pentru: leftArray[leftArrayIndex]) > cadran(pentru: rightArray[rightArrayIndex]) || (cadran(pentru: leftArray[leftArrayIndex]) == cadran(pentru: rightArray[rightArrayIndex]) && determiantul(a: leftArray[leftArrayIndex], b: punct(x: 0, y: 0), c: rightArray[rightArrayIndex]) > 0)
            {
                newSortedArray.append(rightArray[rightArrayIndex])
                rightArrayIndex += 1
            }else{
                newSortedArray.append(leftArray[leftArrayIndex])
                leftArrayIndex += 1
            }
        }
        while(leftArrayIndex < leftArray.count){
            newSortedArray.append(leftArray[leftArrayIndex])
            leftArrayIndex += 1
        }
        while(rightArrayIndex < rightArray.count){
            newSortedArray.append(rightArray[rightArrayIndex])
            rightArrayIndex += 1
        }
        return newSortedArray
    }
    
    func cadran(pentru p: punct) -> Int{
        if p.x > 0 && p.y >= 0{
            return 1
        }
        if p.x <= 0 && p.y > 0{
            return 2
        }
        if p.x < 0 && p.y <= 0{
            return 3
        }
        if p.x >= 0 && p.y < 0{
            return 4
        }
        return -1
    }
    
    func cautaPunctulM(array: [punct] , M: punct) -> Int?{
        var position = -1
        var s = 0
        var d = array.count - 1
        while(s <= d){
            position = s + (d - s) / 2
            if verificaApartenentaPunctuluiM(A1: array[position], A2: array[position + 1], M: M) == true{
                return position
            }else{
                if cadran(pentru: M) > cadran(pentru: array[position]) || (cadran(pentru: M) == cadran(pentru: array[position]) && determiantul(a: M, b: punct(x: 0, y: 0), c: array[position]) > 0){
                    s = position + 1
                }else{
                    d = position - 1
                }
            }
            
            
        }
        return nil
    }
    func verificaApartenentaPunctuluiM(A1: punct , A2: punct , M: punct) -> Bool{
        if (cadran(pentru: A1) < cadran(pentru: M) || (cadran(pentru: A1) == cadran(pentru: M) && determiantul(a: M, b: punct(x: 0, y: 0), c: A1) >= 0)) && (cadran(pentru: A2) > cadran(pentru: M) || (cadran(pentru: A2) == cadran(pentru: M) && determiantul(a: A2, b: punct(x: 0, y: 0), c: M) >= 0)){
            return true
        }
        return false
    }
}

#Preview {
    LocalizareaInPoligonConvex()
}
