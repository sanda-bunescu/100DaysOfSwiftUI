import Cocoa

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "dd.MM.yyyy"
let date = dateFormatter.date(from: "10.07.2002") ?? Date()
print(date)
