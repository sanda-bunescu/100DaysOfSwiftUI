import Foundation



func groupSort(arr: [Int]) -> [[Int]] {
    var map = [Int:Int]()
    for number in arr{
        if !map.contains(where: {$0.key == number}){
            map[number] = 1
        }else{
            var frequency = map[number] ?? -1
            frequency = frequency + 1
            map[number] = frequency
        }
    }
    var frequencyArray = [[Int]]()
    for processedNumber in map{
        let array = [processedNumber.key , processedNumber.value]
        frequencyArray.append(array)
    }
    return sortDescending(frequencyArray: frequencyArray)
}
func sortDescending(frequencyArray: [[Int]]) -> [[Int]]{
    var sortedArray = frequencyArray
    let sort = sortedArray.sorted(by: {ar1,ar2 in
        ar1[1] > ar2[1] || (ar1[1] == ar2[1] && ar1[0] < ar2[0])
    })
    return sort
}

