//
//  ContentView.swift
//  GeometrieComputationala
//
//  Created by Sanda Bunescu on 05.10.2023.
//

import SwiftUI

struct problema{
    let titlu: String
    let descriere: String
    let view : AnyView
}
struct ContentView: View {
    @State private var selection: Int? = 0
    let probleme = [
        problema(titlu: "Problema 1", descriere: "Sortare si cautarea binara", view: AnyView(cautareaBinaraView()) ) ,
        problema(titlu: "Problema 2", descriere: "Coliniaritate", view: AnyView(ColiniaritateView())),
        problema(titlu: "Problema 3", descriere: "Localizarea in triunghi", view: AnyView(localizareaInTriunghi())),
        problema(titlu: "Problema 4", descriere: "Localizarea in poligon simplu", view: AnyView(localizareaInPoligonSimplu())),
        problema(titlu: "Problema 5", descriere: "Localizarea in poligon convex", view: AnyView(LocalizareaInPoligonConvex()))
             ]
    var body: some View {
        NavigationView{
            ZStack{
                Image("rm251-mind-15-e")
                    .resizable()
                    .ignoresSafeArea(.all)
                VStack{
                    Text("Geometrie Computationala")
                        .font(.system(size: 28 ,weight: .heavy, design: .rounded).bold())
                        .foregroundStyle(.white)
                        .padding(.bottom, 25)
                    
                    List(selection: $selection){
                        ForEach(0..<probleme.count, id: \.self){ nr in
                            NavigationLink{
                                probleme[nr].view
                            }label:{
                                HStack{
                                    Text("📚")
                                        .font(.system(size: 35))
                                    VStack(alignment: .leading , spacing: 8){
                                        HStack{
                                            Text(" Problema \(nr + 1)")
                                                .font(.title)
                                            Spacer()
                                        }
                                        Text(probleme[nr].descriere)
                                            .font(.system(size: 23))
                                            .foregroundStyle(.secondary)
                                    }
                                    .foregroundStyle(.black)
                                    .font(.system(size: 22 , design: .monospaced))
                                    
                                }
                            }
                        }
                    }
                    .padding(.horizontal,30)
                    .listStyle(.plain)
                    .listRowSpacing(10)
                    
                }
                .padding(.top)
            }
        }
    }
}

#Preview {
    ContentView()
}
