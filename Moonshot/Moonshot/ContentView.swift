
import SwiftUI

struct ContentView: View {
    let astronauts : [String: Astronaut] = Bundle.main.decode(file: "astronauts.json")
    let missions: [Mission] = Bundle.main.decode(file: "missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    @State private var showingListView = false
    var body: some View {
        NavigationView{
            ScrollView{
                if showingListView {
                    GridContentView()
                }else{
                    ListContentView()
                }
            }
            .frame(maxWidth: .infinity)
            .background(.darkBackground)
            .navigationTitle("Moonshot")
            .preferredColorScheme(.dark)
            .toolbar{
                Button(){
                    showingListView.toggle()
                }label: {
                    Image(systemName:showingListView ? "list.bullet" : "square.grid.2x2")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
