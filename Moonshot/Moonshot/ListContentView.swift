
import SwiftUI

struct ListContentView: View {
    let missions: [Mission] = Bundle.main.decode(file: "missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode(file: "astronauts.json")
    var body: some View {
        VStack{
            ForEach(missions){mission in
                NavigationLink{
                    MissionView(mission: mission, astronauts: astronauts)
                    
                }label: {
                    HStack{
                        Image(mission.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100 , height: 100)
                            .padding()
                        VStack(alignment: .leading){
                            Text(mission.displayName)
                                .font(.title)
                                .foregroundColor(.white)
                            Text(mission.dispalyFormatedDate)
                                .font(.title3)
                                .foregroundColor(.white.opacity(0.5))
                        }
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.lightBackground)
                        
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.lightBackground))
                    
                }
                //Separator(alocatedLength: 1.0)
            }
            .padding([.bottom , .horizontal])
        }
           
    }
}

struct ListContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListContentView()
    }
}
