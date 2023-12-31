//
//  MissionView.swift
//  Moonshot
//
//  Created by Sanda Bunescu on 20.09.2023.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission
    struct crewMember {
        let role: String
        let astronaut: Astronaut
    }
    let crew: [crewMember]
    
    init(mission: Mission , astronauts: [String: Astronaut]){
        self.mission = mission
        self.crew = mission.crew.map{ member in
            if let astronaut = astronauts[member.name]{
                return crewMember(role: member.role , astronaut: astronaut)
            }
            else{
                fatalError("No such crew member")
            }
            
        }
    }
    var body: some View {
        //GeometryReader is used for giving the child view(Image in this case) a size based on it's parent view(VStack in this case). I used 60% width of my Image from the VStack view.
            GeometryReader{ geo in
                ScrollView{
                    VStack{
                        Image(mission.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: geo.size.width * 0.6)
                            .padding(.top)
                        Text("Launch Date: \(mission.displayDateOnScreen)")
                            .font(.caption)
                        VStack(alignment: .leading){
                            Separator(alocatedLength: 1.0)
                            
                            Text("Mission Highlights")
                                .font(.title.bold())
                                .padding(.bottom, 5)
                            Text(mission.description)
                                .font(.title3)
                            Separator(alocatedLength: 1.0)
                            Text("Crew")
                                .font(.title.bold())
                        }
                        .padding(.horizontal)
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack{
                                ForEach(crew , id: \.role) { member in
                                    NavigationLink{
                                        AstronautView(astronaut: member.astronaut)
                                    }label: {
                                        Image(member.astronaut.id)
                                            .resizable()
                                            .frame(width: 100 , height: 75)
                                            .clipShape(Circle())
                                            .overlay{
                                                Circle()
                                                    .strokeBorder(.white , lineWidth: 1)
                                            }
                                        VStack(alignment: .leading){
                                            Text(member.astronaut.name)
                                                .foregroundColor(.white)
                                            Text(member.role)
                                                .foregroundColor(.secondary)
                                        }
                                    }
                                    .padding()
                                }
                            }
                        }
                    }
                    .padding(.bottom)
                }
            }
            .navigationTitle(mission.displayName)
            .navigationBarTitleDisplayMode(.inline)
            .background(.darkBackground)
        
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode(file: "missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode(file: "astronauts.json")
    static var previews: some View {
        MissionView(mission: missions[1] , astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
