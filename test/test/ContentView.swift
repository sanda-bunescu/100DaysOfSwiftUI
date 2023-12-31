
import SwiftUI
struct Response: Codable {
    var results: [Song]
}

struct Song : Codable{
    var trackId: Int
    var trackName: String
    var collectionName: String
}
struct ContentView: View {
    @State private var songResults = [Song]()

    var body: some View {
        List(songResults , id: \.trackId){item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }

        }
        .task {
            await loadData()
        }
    }
    func loadData() async{
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            print(data)
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                songResults = decodedResponse.results
            }else{
                print("decoding error")
            }

        } catch {
            print("Something went wrong")
        }

    }
}

#Preview {
    ContentView()
}
