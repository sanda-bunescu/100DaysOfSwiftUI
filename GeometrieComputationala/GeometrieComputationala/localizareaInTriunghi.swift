

import SwiftUI

struct localizareaInTriunghi: View {
    @State private var multimePuncte = [punct]()
    @State private var xCoord = ""
    @State private var yCoord = ""
    @State private var result = ""
    @State private var sensTrigonometric = ""
    
    let A = punct(x: 2, y: 5)
    let B = punct(x: 0, y: 1)
    let C = punct(x: 3, y: 3)
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    Text("Coordonatele varfurilor triunghiului:\nA(\(Int(A.x)) , \(Int(A.y))) B(\(Int(B.x)) , \(Int(B.y))) C(\(Int(C.x)) , \(Int(C.y)))")
                    if ariaTriunghiului(a: A, b: B, c: C) > 0
                    {
                        Text("Sens direct trigonometric")
                    }
                    if ariaTriunghiului(a: A, b: B, c: C) < 0
                    {
                        Text("Sens invers trigonometric")
                    }
                    if ariaTriunghiului(a: A, b: B, c: C) == 0
                    {
                        Text("Punctele sunt coliniare")
                    }
                    
                }header: {
                    Text("Triunghi")
                }
                HStack{
                    TextField("Mx" , text: $xCoord)
                    TextField("My" ,text: $yCoord)
                }
                Button("Add"){
                    let punctNou = punct(x: Int(xCoord)!, y: Int(yCoord)!)
                    multimePuncte.append(punctNou)
                }
                ForEach(multimePuncte ) { p in
                    Text(verificaApartenentaInTriunghi(a: A, b: B, c: C, m: p))
                    
                }
                
                
            }
            .navigationTitle("Apartenenta punctelor in triunghiul ABC")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
    
    func ariaTriunghiului(a: punct , b: punct , c: punct) -> Int{
        Int((a.x * b.y) + (a.y * c.x) + (b.x * c.y) - (b.y * c.x) - (a.x * c.y) - (b.x * a.y))
    }
    
    func verificaApartenentaInTriunghi(a: punct , b: punct , c: punct , m: punct) -> String{
        
        let ariaMAB = ariaTriunghiului(a: m, b: a, c: b)
        let ariaMBC = ariaTriunghiului(a: m, b: b, c: c)
        let ariaMCA = ariaTriunghiului(a: m, b: c, c: a)
        
        
        if ariaMAB > 0 && ariaMBC > 0 && ariaMCA > 0{
            return "Punctul M(\(m.x),\(m.y)) se afla in interior"
        }
        if ariaMAB > 0 && ariaMBC < 0 && ariaMCA > 0{
            return "Punctul M(\(m.x),\(m.y)) se afla in zona 2"
        }
        if ariaMAB > 0 && ariaMBC < 0 && ariaMCA < 0{
            return "Punctul M(\(m.x),\(m.y)) se afla in zona 3"
        }
        if ariaMAB > 0 && ariaMBC > 0 && ariaMCA < 0{
            return "Punctul M(\(m.x),\(m.y)) se afla in zona 4"
        }
        if ariaMAB < 0 && ariaMBC > 0 && ariaMCA < 0{
            return "Punctul M(\(m.x),\(m.y)) se afla in zona 5"
        }
        if ariaMAB < 0 && ariaMBC > 0 && ariaMCA > 0{
            return "Punctul M(\(m.x),\(m.y)) se afla in zona 6"
        }
        if ariaMAB < 0 && ariaMBC < 0 && ariaMCA > 0{
            return "Punctul M(\(m.x),\(m.y)) se afla in zona 7"
        }
        if ariaMAB > 0 && ariaMBC == 0 && ariaMCA > 0{
            return "Punctul M(\(m.x),\(m.y)) se afla pe frontiera 1-2"
        }
        if ariaMAB > 0 && ariaMBC > 0 && ariaMCA == 0{
            return "Punctul M(\(m.x),\(m.y)) se afla pe frontiera 1-4"
        }
        if ariaMAB == 0 && ariaMBC > 0 && ariaMCA > 0{
            return "Punctul M(\(m.x),\(m.y)) se afla pe frontiera 1-6"
        }
        if ariaMAB > 0 && ariaMBC < 0 && ariaMCA == 0{
            return "Punctul M(\(m.x),\(m.y)) se afla pe frontiera 2-3"
        }
        if ariaMAB > 0 && ariaMBC == 0 && ariaMCA < 0{
            return "Punctul M(\(m.x),\(m.y)) se afla pe frontiera 3-4"
        }
        if ariaMAB == 0 && ariaMBC > 0 && ariaMCA < 0{
            return "Punctul M(\(m.x),\(m.y)) se afla pe frontiera 4-5"
        }
        if ariaMAB < 0 && ariaMBC > 0 && ariaMCA == 0{
            return "Punctul M(\(m.x),\(m.y)) se afla pe frontiera 5-6"
        }
        if ariaMAB < 0 && ariaMBC == 0 && ariaMCA > 0{
            return "Punctul M(\(m.x),\(m.y)) se afla pe frontiera 6-7"
        }
        if ariaMAB == 0 && ariaMBC < 0 && ariaMCA > 0{
            return "Punctul M(\(m.x),\(m.y)) se afla pe frontiera 7-2"
        }
        if ariaMAB == 0 && ariaMBC == 0 && ariaMCA > 0{
            return "Punctul M(\(m.x),\(m.y)) se afla pe varful B"
        }
        if ariaMAB == 0 && ariaMBC > 0 && ariaMCA == 0{
            return "Punctul M(\(m.x),\(m.y)) se afla pe varful A"
        }
        if ariaMAB > 0 && ariaMBC == 0 && ariaMCA == 0{
            return "Punctul M(\(m.x),\(m.y)) se afla pe varful C"
        }
        return "\(ariaMAB) \(ariaMBC) \(ariaMCA) "
    }
}


#Preview {
    localizareaInTriunghi()
}
