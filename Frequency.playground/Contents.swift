import Foundation


//func groupSort(arr: [Int]) -> [[Int]] {
//    var map = [Int:Int]()
//    var frequencyArray = [[Int]]()
//    for number in arr{
//        if !map.contains(where: {$0.key == number}){
//            map[number] = 1
//        }else{
//            var frequency = map[number] ?? -1
//            frequency = frequency + 1
//            map[number] = frequency
//        }
//    }
//    for processedNumber in map{
//        let array = [processedNumber.key , processedNumber.value]
//        frequencyArray.append(array)
//    }
//    return sortDescending(frequencyArray: frequencyArray)
//}
//
//func sortDescending(frequencyArray: [[Int]]) -> [[Int]]{
//    var sortedArray = frequencyArray
//    let sort = sortedArray.sorted(by: {ar1,ar2 in
//        ar1[1] > ar2[1] || (ar1[1] == ar2[1] && ar1[0] < ar2[0])
//    })
//    return sort
//}


//print(groupSort(arr: [2,3,3,2,1,1,6,7,4,6]))


//positive,zero,negative

//func plusMinus(arr: [Int]) -> Void {
//    var positive = 0
//    var zero = 0
//    var negative = 0
//    for number in arr{
//        if number > 0{
//            positive = positive + 1
//        }
//        if number == 0{
//            zero = zero + 1
//        }
//        if number < 0{
//            negative = negative + 1
//        }
//    }
//    printRatio(nr: positive, arrCount: arr.count)
//    printRatio(nr: negative, arrCount: arr.count)
//    printRatio(nr: zero, arrCount: arr.count)
//
//}
//func printRatio(nr: Int, arrCount: Int){
//    print(String(format: "%.6f", Double(nr) / Double(arrCount)))
//}

//plusMinus(arr: [-1,-1,1,0,1])


//func miniMaxSum(arr: [Int]) -> Void {
//    var sumArr = [Int]()
//    sumArr.append(arr[1] + arr[2] + arr[3] + arr[4])
//    sumArr.append(arr[0] + arr[2] + arr[3] + arr[4])
//    sumArr.append(arr[0] + arr[1] + arr[3] + arr[4])
//    sumArr.append(arr[0] + arr[1] + arr[2] + arr[4])
//    sumArr.append(arr[0] + arr[1] + arr[2] + arr[3])
//    
//    var minSum = sumArr[0]
//    var maxSum = sumArr[0]
//    for sum in sumArr{
//        minSum = minSum > sum ? sum : minSum
//        maxSum = maxSum < sum ? sum : maxSum
//    }
//    print("\(minSum) \(maxSum)")
//}

//miniMaxSum(arr: [1,2,3,4,5])





//func timeConversion(s: String) -> String {
//    let timeInterval = s[s.index(s.startIndex, offsetBy: 8)..<s.endIndex]
//    var hour = Int(s[s.index(s.startIndex, offsetBy: 0)..<s.index(s.startIndex, offsetBy: 2)]) ?? 0
//    print(hour)
//    if timeInterval.elementsEqual("PM") && hour >= 1 && hour <= 11{
//        hour = hour + 12
//    }
//    if timeInterval.elementsEqual("AM") && hour == 12{
//        hour = 0
//    }
//    var finalTime = hour < 10 ? "0\(hour):" : "\(hour):"
//    finalTime.append(contentsOf: s[s.index(s.startIndex, offsetBy: 3)..<s.index(s.startIndex, offsetBy: 8)])
//    return finalTime
//    
//}

//print(timeConversion(s: "12:00:00PM"))

//func findMedian(arr: [Int]) -> Int {
//    let sorted = arr.sorted()
//    
//    return sorted[sorted.count/2]
//}

//print(findMedian(arr: [0,1,6,1,7]))


//regEx

//first and last element matches
//func verifyString(s: String) -> Bool{
//    let range = NSRange(location: 0, length: s.utf16.count)
//    let regex = try? NSRegularExpression(pattern: "(([ab])[ab]*\\1)|a|b")
//    if regex?.firstMatch(in: s, range: range) != nil{
//        return true
//    }
//    return false
//}
//
//print(verifyString(s: "a"))


//


//


//func diagonalDifference(arr: [[Int]]) -> Int {
//    var sum1 = 0
//    var sum2 = 0
//    for index in 0..<arr.count{
//        sum1 = sum1 + arr[index][index]
//        sum2 = sum2 + arr[index][arr.count - index - 1]
//    }
//    return abs(sum1-sum2)
//}

//print(diagonalDifference(arr: [[11,2,4],[4,5,6],[10,8,-12]] ))


//func countingSort(arr: [Int]) -> [Int] {
//    var frequencyArray = Array(repeating: 0, count: 100)
//    print(frequencyArray.count)
//    for number in arr{
//        frequencyArray[number] += 1
//    }
//    return frequencyArray
//}

//print(countingSort(arr: [2,3,4,5,6,3,4,2,1,5,4,7,6,5,9,20]))


//flipping matrix solution
//func flippingMatrix(matrix: [[Int]]) -> Int {
//   let n = matrix.count / 2
//   var sum = 0
//   
//   for i in 0..<n {
//       for j in 0..<n {
//           let a = matrix[i][j]
//           let b = matrix[i][matrix.count - j - 1]
//           let c = matrix[matrix.count - i - 1][matrix.count - j - 1]
//           let d = matrix[matrix.count - i - 1][j]
//           
//           sum += max(a, b, c, d)
//       }
//   }
//   
//   return sum
//}

//print(flippingMatrix(matrix: [[112,42,83,119],[56,125,56,49],[15,78,101,43],[62,98,114,108]]))



//reverse array query
//func performOperations(arr: [Int], operations: [[Int]]) -> [Int] {
//    var reversedArray = arr
//    var subArray = [Int]()
//    for operation in operations{
//        var subArray = [Int]()
//        for index in operation[0]...operation[1]{
//            subArray.append(reversedArray[index])
//        }
//        subArray.reverse()
//        
//        reversedArray.removeSubrange(operation[0]...operation[1])
//        reversedArray.insert(contentsOf: subArray, at: operation[0])
//    }
//    return reversedArray
//}
//
//print(performOperations(arr: [5,2,5,1], operations: [[1,2],[1,1]]))

//5 2 5 1
//5 1 5 2

//Caesar cypher

//func caesarCipher(s: String, k: Int) -> String {
//    var result = ""
//    for character in s{
//        
//        if character.isLetter{
//            var asciiValue = UInt8(0)
//            if character.isLowercase{
//                asciiValue = ( (character.asciiValue ?? 0) + UInt8(k) - 97) % 26 + 97
//                
//            }else{
//                asciiValue = ((character.asciiValue ?? 0) + UInt8(k) - 65) % 26 + 65
//            }
//            let unicodeSymbol = UnicodeScalar(asciiValue)
//            result.append(Character(unicodeSymbol))
//        }else{
//            result.append(character)
//        }
//    }
//    return result
//}
//
//print(caesarCipher(s: "ana_batewerqzx", k: 2))

//func palindromeIndex(s: String) -> Int {
//    var copy = s
//    if copy.elementsEqual(copy.reversed()){
//        return -1
//    }
//    for index in 0..<copy.count{
//        let character = copy[copy.index(copy.startIndex, offsetBy: index)]
//        let stringIndex = copy.index(copy.startIndex, offsetBy: index)
//        copy.remove(at: stringIndex)
//        if copy.elementsEqual(copy.reversed()){
//            return index
//        }
//        copy.insert(character, at: stringIndex)
//        
//    }
//    return -1
//}



//O(n^2)

//func palindromeIndex(s: String) -> Int{
//    var copy = s
//    var removeCount = 0
//    if !copy.elementsEqual(copy.reversed()){
//        
//        while copy.startIndex != copy.endIndex{
//            var firstString = ""
//            let withoutFirst = copy[copy.index(copy.startIndex, offsetBy: 1)..<copy.endIndex]
//            firstString.append(String(withoutFirst))
//            if firstString.elementsEqual(firstString.reversed()){
//                if let firstIndex = copy.firstIndex(of: copy.first ?? "z") {
//                    return copy.distance(from: copy.startIndex, to: firstIndex) + removeCount
//                }
//            }
//            
//            var secondString = ""
//            let withoutLast = copy[..<copy.index(copy.startIndex, offsetBy: copy.count - 1)]
//            secondString.append(String(withoutLast))
//            if secondString.elementsEqual(secondString.reversed()){
//                if let lastIndex = copy.lastIndex(of: copy.last ?? "z") {
//                    return copy.distance(from: copy.startIndex, to: lastIndex) + removeCount
//                }
//            }
//            copy.removeFirst()
//            copy.removeLast()
//            removeCount += 1
//        }
//    }
//    return -1
//}
//
//
//
//print(palindromeIndex(s: "aprrmdeykhorwsalkysinbvylgcgiaokrifgolfytvsqqufctxkjbijnonvaptqxxhdxutogxuxhntjulvbmuvwfftfanwyogemcxekxyifmcqjqmldkjcpqwuqmrpbbvqdtwnrvvwkbqvtdjynucdlbbdpuurvrkbnhoifnhrqxnmcalrupxjsyojtjdsdnttwlceylvrkleolrgj"))



//O(n)

//func palindromeIndex(s: String) -> Int {
//   let chars = Array(s)
//   var i = 0
//   var j = chars.count - 1
//   while i < j {
//       if chars[i] != chars[j] {
//           // Try removing char at index i
//           if isPalindrome(chars, i + 1, j) {
//               return i
//           }
//           // Try removing char at index j
//           if isPalindrome(chars, i, j - 1) {
//               return j
//           }
//           // No solution found
//           return -1
//       }
//       i += 1
//       j -= 1
//   }
//   // String is already a palindrome
//   return -1
//}
//
//func isPalindrome(_ chars: [Character], _ start: Int, _ end: Int) -> Bool {
//   var i = start
//   var j = end
//   while i < j {
//       if chars[i] != chars[j] {
//           return false
//       }
//       i += 1
//       j -= 1
//   }
//   return true
//}




//testing string index (how to retrieve a char having the int index

//let test = "Ana are mere"
//let character = test[test.index(test.startIndex, offsetBy: 2)]
//print(character)
//
//let name = "Marie Curie"
//let firstSpace = name.firstIndex(of: " ") ?? name.endIndex
//let firstName = name[..<firstSpace]
//print(firstName)


//Grid challange

//func gridChallenge(grid: [String]) -> String {
//    var sortedGrid  = [String]()
//    for row in grid{
//        sortedGrid.append(String(row.sorted()))
//    }
//    var sorted = 1
//    for i in 0..<grid.count - 1{
//        for j in 0..<sortedGrid[i].count{
//            if sortedGrid[i][sortedGrid[i].index(sortedGrid[i].startIndex, offsetBy: j)] > sortedGrid[i+1][sortedGrid[i].index(sortedGrid[i].startIndex, offsetBy: j)]{
//                print(sortedGrid[i][sortedGrid[i].index(sortedGrid[i].startIndex, offsetBy: j)])
//                print(sortedGrid[i+1][sortedGrid[i].index(sortedGrid[i].startIndex, offsetBy: j)])
//                print(" ")
//                sorted = 0
//            }
//        }
//    }
//    if sorted == 1{
//        return "YES"
//    }else{
//        return "NO"
//    }
//    
//}
//print(gridChallenge(grid: ["abc", "hjk", "mpq", "rtv"]))


//func superDigit(n: String, k: Int) -> Int {
//    var copy = n
//    var sum = 0
//    for character in copy{
//        sum += Int(character.description)! * k
//    }
//    copy = String(sum)
//    
//    while copy.count >= 2{
//        var sum = 0
//        for character in copy{
//            sum += Int(character.description)!
//        }
//        copy = String(sum)
//    }
//    return Int(copy) ?? -1
//}
//
//print(superDigit(n: "148", k: 3))

//minimulBribes

//3!=5 -> 3<2F-> 0       1 2 5 3 7 8 6 4
//4!=3 -> 7<3F -> 0      1 2 5 3 7 8 6 4
//5!=7 -> 2<4A -> 2      1 2 3 7 5 8 6 4  pentru nr: 4
//6!=8 -> 6<5 -> 2       1 2 3 7 5 8 6 4  nr 5
//6!=7 -> 4<6 -> 4       1 2 3 5 8 6 7 4  nr 6
//8!=4 -> 5<7 -> 6       1 2 3 5 6 7 4 8  nt 7


//1 2 3 7 5 8 6 4
//1 2 3 5 8 6 7 4
//1 2 3 8 5 6 7 4
//1 2 3 5 6 7 4 8
//1 2 3 6 5 7 4 8
//1 2 3 5 7 6 4 8
//1 2 3 7 5 6 4 8
//1 2 3 5 6 4 7 8
//1 2 3 6 5 4 7 8
//1 2 3 5 4 6 7 8
//1 2 3 4 5 6 7 8

//func minimumBribes(q: [Int]) -> Void {
//   var bCount = 0
//   var isChaotic = false
//    for (key,value) in q.enumerated() {
//        print("Iteration")
//        print(key)
//        print(value)
//        print((value-1)-key)
//       if (value - 1) - key > 2 {
//           isChaotic = true
//           break
//       }
//       for index in stride(from: max(0, value - 2), to: key, by: 1){
//           if q[index] > value {
//               bCount += 1
//           }
//       }
//   }
//    isChaotic ? print("Too chaotic") : print("\(bCount)")
//}
//
//
//minimumBribes(q: [1,2,5,3,7,8,6,4])

//
//func truckTour(petrolpumps: [[Int]]) -> Int {
//    for i in 0..<petrolpumps.count{
//        var fuel = 0
//        var tmp = petrolpumps[i]
//        while fuel >= 0{
//            fuel += tmp[0] - tmp[1]
//            tmp = petrolpumps.firstIndex(of: tmp)! != petrolpumps.count - 1 ? petrolpumps[petrolpumps.firstIndex(of: tmp)! + 1] : petrolpumps[0]
//            
//            if petrolpumps.firstIndex(of: tmp)! == i && fuel >= 0{
//                print(petrolpumps[i])
//                return i
//            }
//            
//        }
//    }
//    
//    return -1
//}



//func truckTour(petrolpumps: [[Int]]) -> Int {
//    var fuel = 0 //curr
//    var current = 0 //ress
//    for i in 0..<petrolpumps.count{
//        fuel += petrolpumps[i][0] - petrolpumps[i][1]
//        if fuel < 0{
//            fuel = 0
//            current = i + 1
//        }
//    }
//    return current
//}
//
//print(truckTour(petrolpumps: [[1,5] , [10,3] , [3,4]]))


//merge 2 linked lists


//public class ListNode {
//    public var val: Int
//    public var next: ListNode?
//    public init() { self.val = 0; self.next = nil; }
//    public init(_ val: Int) { self.val = val; self.next = nil; }
//    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
//}
//
//func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
//    var list1Copy = list1
//    var list2Copy = list2
//    var mergedList = ListNode()//head
//    var currentNode = mergedList
//    if list1Copy == nil{
//        return list2Copy
//    }
//    if list2Copy == nil{
//        return list1Copy
//    }
//    while(list1Copy != nil && list2Copy != nil){
//        if list1Copy!.val <= list2Copy!.val{
//            currentNode.next = list1Copy
//            list1Copy = list1Copy!.next
//            print("from list1")
//            print(currentNode.val)
//            print(currentNode.next!.val)
//        }else{
//            currentNode.next = list2Copy
//            list2Copy = list2Copy!.next
//            print("from list2")
//            print(currentNode.val)
//            print(currentNode.next!.val)
//            
//        }
//        currentNode = currentNode.next!
//    }
//    if list1Copy != nil{
//        currentNode.next = list1Copy
//        //list1Copy = list1Copy!.next
//        print("from list1")
//        print(currentNode.val)
//        print(currentNode.next!.val)
//    }
//    if list2Copy != nil{
//        currentNode.next = list2Copy
//        //list2Copy = list2Copy!.next
//        print("from list2")
//        print(currentNode.val)
//        print(currentNode.next!.val)
//    }
//    return mergedList.next
//}
//
//
//var list1 = ListNode(3)
//list1 = ListNode(-9, list1)
//
//var list2 = ListNode(7)
//list2 = ListNode(5, list2)
//
//var output = mergeTwoLists(list1,list2)!
//
//while output.next != nil || (output.next == nil && output.val != 0){
//        print("Result: \(output.val)")
//    output = output.next ?? ListNode()
//    }


//efficient janitor


//func efficientJanitor(weights: [Double]) -> Int{
//    let sortedArray = weights.sorted()
//    var fIndex = 0
//    var lIndex = sortedArray.count - 1
//    var trips = 0
//    while lIndex >= 0{
//        if sortedArray[lIndex] > 1.99{
//            trips += 1
//        }else{
//            if sortedArray[lIndex] + sortedArray[fIndex] <= 3.00{
//                fIndex += 1
//            }
//            trips += 1
//        }
//        lIndex -= 1
//        if fIndex > lIndex{
//            break
//        }
//    }
//    
//    return trips
//}
//
//print(efficientJanitor(weights: [1.01 , 1.02 , 1.99 , 1.96 , 1.20 , 2.07]))

//managing a queue fifo

//class MyQueue {
//    var enqueue: [Int]
//    var dequeue: [Int]
//    init() {
//        enqueue = []
//        dequeue = []
//    }
//    
//    func push(_ x: Int) {
//        enqueue.append(x)
//    }
//    
//    func pop() -> Int {
//        var first = 0
//        if dequeue.isEmpty{
//            if !enqueue.isEmpty{
//                first = enqueue.first ?? -1
//                enqueue.removeFirst()
//            }
//        }else{
//            first = dequeue.first ?? -1
//            dequeue.removeFirst()
//        }
//        return first
//    }
//    
//    func peek() -> Int {
//        if dequeue.isEmpty{
//            return enqueue.first ?? -2
//        }
//        return dequeue.first ?? -2
//    }
//    
//    func empty() -> Bool {
//        enqueue.isEmpty && dequeue.isEmpty
//    }
//}

//let obj = MyQueue()
//obj.push(10)
//obj.push(1)
//obj.push(4)
//let ret_2: Int = obj.pop()
//let ret_3: Int = obj.peek()
//let ret_4: Bool = obj.empty()
//print(obj.enqueue)

//

//func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
//    var index1 = 0
//    var index2 = 0
//    var mCopy = m
//    nums1.removeSubrange(mCopy..<nums1.count)
//    
//    while index1 < mCopy && index2 < n{
//        if nums1[index1] > nums2[index2]{
//            nums1.insert(nums2[index2], at: index1)
//            index2 += 1
//            index1 += 1
//            mCopy += 1
//         }else{
//            index1 += 1
//        }
//    }
//    if index2 < n{
//        nums1.insert(contentsOf: nums2[index2..<nums2.count], at: index1)
//    }
//    
//    print(nums1)
//}
//func mergeOneLine(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int){
//    nums1 = (nums2 + nums1).dropLast(n).sorted()
//    print(nums1)
//}
//
//var nums1 = [1,2,3,0,0,0]
//var m = 3
//var nums2 = [2,5,6]
//var n = 3
//merge(&nums1, m, nums2, n)
//mergeOneLine(&nums1, m, nums2, n)

// 1 2 3  nums1
// 2 5 6 nums2
// index1 = 1
// index1 = 2
// 1 2 2 3 index1 = 3 index2 = 1

//
//let text = "Unimaginable"
//if text.hasPrefix("Un"){
//    print(text.lowercased())
//}
//
//func performOperations(arr: [Int], operations: [[Int]]) -> [Int] {
//    var output = arr
//    for operation in operations{
//        let index1 = operation[0]
//        let index2 = operation[1]
//        var subArr = output[index1...index2]
//        subArr.reverse()
//        output.replaceSubrange(index1...index2, with: subArr)
//        print(output)
//    }
//    
//    return output
//}
//
//print(performOperations(arr: [1,2,3], operations: [[0,2],[1,2],[0,2]]))

//1 2 3    321
//


func regex(s: String) -> Bool{
    let range = NSRange(location: 0, length: s.utf16.count)
    let regex = try? NSRegularExpression(pattern: "^([ab])[ab]*\\1$|^a$|^b$")
    if regex?.firstMatch(in: s, range: range) != nil{
        return true
    }
    return false
}

print(regex(s: "a"))

func matchStrings(text: [String], pat: [String]) -> [String] {
    var textCopy = text
    var output = [String]()
    for index in 0..<textCopy.count{
        let starIndex = pat[index].firstIndex(of: "*")!
        let prefixSequence = pat[index].prefix(upTo: starIndex)
        let tmpSuffixSequence = pat[index].suffix(from: starIndex)
        let suffixSequence = tmpSuffixSequence.suffix(tmpSuffixSequence.count - 1)
        
        if textCopy[index].hasPrefix(prefixSequence){
            textCopy[index].removeFirst(prefixSequence.count)
            if textCopy[index].hasSuffix(suffixSequence){
                output.append("YES")
            }else{
                output.append("NO")
            }
        }else{
            output.append("NO")
        }
    }
    return output
}

print(matchStrings(text: ["test" , "aba"], pat: ["*" , "ab*ba"]))


//func countGamesWonByGroup1(group1: [Int], group2: [Int]) -> Int {
//    var winnings = 0
//    
//    for i in 0..<group1.count{
//        var toAdd = 1
//        if group1[i] + group1[i + toAdd] > group2[i] + group2[i + toAdd]{
//            winnings += 1
//        }
//        toAdd += 1
//    }
//    return winnings % (10^9 + 7)
//}

//print(countGamesWonByGroup1(group1: [1,2,3], group2: [2,3,1]))

//3 5
//4 3 -
//5 4 -
