
import SwiftUI

struct AstronautView: View {
    let astronaut : Astronaut
    var body: some View {
        GeometryReader{ geo in
            ScrollView{
                VStack{
                    Image(astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 0.9)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke()
                        }
                        .padding([.top , .bottom])
                    VStack{
                        Separator(alocatedLength: 1.0)
                        Text(astronaut.description)
                    }
                    .padding([.bottom , .horizontal])
                    
                    
                }
                
                
            }
        }
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
        
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronaut: [String: Astronaut] = Bundle.main.decode(file: "astronauts.json")
    static var previews: some View {
        AstronautView(astronaut: astronaut["aldrin"]!)
            .preferredColorScheme(.dark)
    }
}
