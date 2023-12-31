//
//  GridContentView.swift
//  Moonshot
//
//  Created by Sanda Bunescu on 22.09.2023.
//

import SwiftUI

struct GridContentView: View {
    let astronauts : [String: Astronaut] = Bundle.main.decode(file: "astronauts.json")
    let missions: [Mission] = Bundle.main.decode(file: "missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        LazyVGrid(columns: columns){
            ForEach(missions) { mission in
                NavigationLink{
                    MissionView(mission: mission, astronauts: astronauts)
                }label:{
                    VStack{
                        Image(mission.imageName)
                            .resizable()
                            .scaledToFit()//or .aspectRatio(contentMode: .fit)
                            .frame(width: 100 , height: 100)
                            .padding()
                        VStack{
                            Text(mission.displayName)
                                .font(Font.headline)
                                .foregroundColor(.white)
                            Text(mission.dispalyFormatedDate)
                                .font(Font.subheadline)
                                .foregroundColor(Color.white.opacity(0.5))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.lightBackground)
                        
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                    )
                }
            }
            .padding([.horizontal , .bottom])
        }
    }
}

struct GridContentView_Previews: PreviewProvider {
    static var previews: some View {
        GridContentView()
    }
}
