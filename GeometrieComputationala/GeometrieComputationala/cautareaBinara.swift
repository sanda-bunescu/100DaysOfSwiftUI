import Foundation

struct cautareaBinara{
    
    func search(array: [Int] , nr: Int) -> Int{
        var position = -1
        var s = 0
        var d = array.count - 1
        while(s <= d){
            position = s + (d - s) / 2
            if array[position] == nr{
                return position
            }
            if array[position] > nr{
                d = position - 1
            }
            if array[position] < nr{
                s = position + 1
            }
        }
        return -1
    }
    
}
