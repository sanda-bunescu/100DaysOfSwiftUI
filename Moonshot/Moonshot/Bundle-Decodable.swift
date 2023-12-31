
import Foundation

extension Bundle{
    func decode<T: Codable>(file: String) -> T{
        guard let url = self.url(forResource: file, withExtension: nil)else{
            fatalError("Error finding \(file) in app bundle.")
        }
        guard let data = try? Data(contentsOf: url)else{
            fatalError("Error loading \(file)")
        }
        
        let decoder = JSONDecoder()
        let formater = DateFormatter()
        formater.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formater)
        
        guard let loaded = try? decoder.decode(T.self, from: data)else{
            fatalError("Error decoding \(file)")
        }
        return loaded
    }
}
