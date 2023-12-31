
import Foundation
struct coliniaritate{
    let sortare = mergeSort()
    func verificaColiniaritateaMultimilor(a: [Int] , b: [Int] , c: [Int]) {
        let bSortat = sortare.sorteaza(array: b)
        let cSortat = sortare.sorteaza(array: c)
        var d = [Int]()
        for i in bSortat{
            d.append(bSortat[i] * 2)
        }
        for i in a{
            var e = [Int]()
            for j in cSortat{
                e.append(a[i] + c[j])
            }
            var k = 0
            var p = 0
            while k < d.count && p < e.count{
                if d[k] == e[p]{
                    print( a[i])
                    print(d[k]/2)
                    print(e[p] - a[i])
                    continue
                }
                if d[k] < e[p]{
                    k += 1
                }
                if d[k] > e[p]{
                    p += 1
                }
                
            }
        }
    }
}
