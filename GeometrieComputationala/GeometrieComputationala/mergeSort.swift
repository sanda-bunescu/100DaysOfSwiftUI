
import Foundation

struct mergeSort{
    func sorteaza(array: [Int]) -> [Int]{
        guard array.count > 1 else { return array }
        
        let mid = array.count / 2
        let leftArray = sorteaza(array: Array(array[0..<mid]))
        let rightArray = sorteaza(array: Array(array[mid..<array.count]))
        
        return merge(leftArray: leftArray, rightArray: rightArray)
    }
    func merge(leftArray: [Int] , rightArray: [Int]) -> [Int]{
        var newSortedArray = [Int]()
        var leftArrayIndex = 0
        var rightArrayIndex = 0
        
        while(leftArrayIndex < leftArray.count && rightArrayIndex < rightArray.count){
            if leftArray[leftArrayIndex] < rightArray[rightArrayIndex]{
                newSortedArray.append(leftArray[leftArrayIndex])
                leftArrayIndex += 1
            }else{
                newSortedArray.append(rightArray[rightArrayIndex])
                rightArrayIndex += 1
            }
        }
        while(leftArrayIndex < leftArray.count){
            newSortedArray.append(leftArray[leftArrayIndex])
            leftArrayIndex += 1
        }
        while(rightArrayIndex < rightArray.count){
            newSortedArray.append(rightArray[rightArrayIndex])
            rightArrayIndex += 1
        }
        return newSortedArray
    }
}
