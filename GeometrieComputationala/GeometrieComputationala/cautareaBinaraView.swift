
import SwiftUI
struct generateRandomArray{
    func generateArray(with elements: Int) -> [Int]{
        var i = 0
        var array = [Int]()
        while( i != elements){
            array.append(Int.random(in: 0...100))
            i += 1
        }
        return array
    }
}
struct arrayView: View {
    let array: [Int]
    var body: some View {
        HStack{
            ForEach(array , id: \.self){nr in
                Text("\(nr)")
            }
        }
    }
}
struct coloredArrayView: View {
    let array: [Int]
    let searchedNumber: Int
    var body: some View {
        if array.firstIndex(of: searchedNumber) != nil{
            HStack{
                ForEach(array , id: \.self){nr in
                    Text("\(nr)")
                        .foregroundStyle(nr == searchedNumber ? .green : .black)
                }
            }
            
        }else{
            Text("Not found")
        }
    }
}

struct cautareaBinaraView: View {
    
    @State private var nrOfElements = 3
    @State private var elementsArray = [3 , 5 , 7 , 10 ]
    @State private var searchedNumer = ""
    @State private var position = -1
    
    @State private var array = [Int]()
    @State private var sortedArray = [Int]()
    
    @State private var showArrayView = false
    @State private var showSortedArrayView = false
    @State private var showNumber = false
    
    let generator = generateRandomArray()
    let sortare = mergeSort()
    let cautare = cautareaBinara()

    var body: some View {
        NavigationStack{
            Form{
                Section{
                    Picker("Nr of elements", selection: $nrOfElements){
                        ForEach(elementsArray , id: \.self){element in
                            Text("\(element)")
                        }
                    }
                    .pickerStyle(.menu)
                    Button("Generate"){
                        array = generator.generateArray(with: nrOfElements)
                        showArrayView = true
                    }
                    
                }header: {
                    Text("Generate random array")
                }
                Section{
                    if showArrayView {
                        arrayView(array: array)
                    }
                }header: {
                    Text("Generated array")
                }
                Section{
                    Button{
                        sortedArray = sortare.sorteaza(array: array)
                        showSortedArrayView = true
                    }label: {
                        HStack{
                            Image(systemName: "arrowshape.right.circle")
                            Text("Sort array")
                        }
                    }
                }
                Section{
                    if showSortedArrayView {
                        arrayView(array: sortedArray)
                    }
                }header: {
                    Text("Sorted array")
                }
                Section{
                    TextField("Numar cautat", text: $searchedNumer)
                    Button{
                        position = cautare.search(array: sortedArray, nr: 9)
                        showNumber = true
                    }label: {
                        HStack{
                            Image(systemName: "magnifyingglass")
                            Text("Find number")
                        }
                    }
                    if showNumber {
                        coloredArrayView(array: sortedArray , searchedNumber: Int(searchedNumer) ?? 0)
                        
                    }
                }
                
            }
            .navigationTitle("Sortarea si Cautarea")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    cautareaBinaraView()
}
