//
//  ColiniaritateView.swift
//  GeometrieComputationala
//
//  Created by Sanda Bunescu on 15.10.2023.
//

import SwiftUI

struct ColiniaritateView: View {
    let sortare = mergeSort()
    @State private var y = ""
    
    @State private var a = ["" , "" , ""]
    @State private var b = ["" , "" , ""]
    @State private var c = ["" , "" , ""]
    
    @State private var rezultat = ""
    var body: some View {
        NavigationStack{
                Form{
                    Section{
                        ForEach( a.indices , id: \.self){ index in
                            HStack{
                                TextField("Ax", text: $a[index])
                                Divider()
                                TextField("0" , text: $y)
                                    .disabled(true)
                            }
                        }
                    }header: {
                        Text("Coordonatele de pe dreapta A")
                    }
                    Section{
                        ForEach( b.indices , id: \.self){ index in
                            HStack{
                                TextField("Bx", text: $b[index])
                                Divider()
                                TextField("1" , text: $y)
                                    .disabled(true)
                            }
                        }
                    }header: {
                        Text("Coordonatele de pe dreapta B")
                    }
                    Section{
                        ForEach( c.indices , id: \.self){ index in
                            HStack{
                                TextField("Cx", text: $c[index])
                                Divider()
                                TextField("2" , text: $y)
                                    .disabled(true)
                            }
                        }
                    }header: {
                        Text("Coordonatele de pe dreapta C")
                    }
                    Section{
                        
                        let intA = a.compactMap{ Int($0) }
                        let intB = b.compactMap{ Int($0) }
                        let intC = c.compactMap{ Int($0) }
                        
                        Button("Verifica punctele coliniare"){
                            verifica(a: intA, b: intB, c: intC)
                        }
                    }
                    Section{
                        Text(rezultat)
                    }header: {
                        Text("Puncte coliniare")
                    }
                }
                .navigationTitle("Coliniaritate")
                .navigationBarTitleDisplayMode(.inline)
            
        }
    }
    
    func verifica(a: [Int] , b: [Int] , c: [Int]){
        let bSortat = sortare.sorteaza(array: b)
        let cSortat = sortare.sorteaza(array: c)
        var d = [Int]()
    
        
        for i in 0..<3{
            d.append(bSortat[i] * 2)
        }
        
        for i in 0..<3{
            var e = [Int]()
            for j in 0..<3{
                e.append(a[i] + cSortat[j])
            }
            
            var k = 0
            var p = 0
            
            while k < 3 && p < 3{
                if d[k] == e[p]{
                    rezultat.append("A(\(a[i]) , 0) , B(\(d[k]/2) , 1) , C(\(e[p] - a[i]) , 2) \n")
                    
                    break
                }
                if d[k] < e[p]{
                    k += 1
                }
                if k < 3 && p < 3 && d[k] > e[p]{
                    p += 1
                }
                
            }
        }
        
    }
}

#Preview {
    ColiniaritateView()
}
