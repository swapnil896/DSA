//: [Previous](@previous)

import Foundation

// MARK: Given N elements & Q queries, for each query, calculate sum of all elements from L to R

// Brute force
func querySumBrute(_ arr: [Int], _ Q: [[Int]]) {
    let N = arr.count
    for query in Q {
        let L = query[0]
        let R = query[1]
        var sum = 0
        for j in L...R {
            sum += arr[j]
        }
        print(sum)
    }
}

let arrQS = [2, 3, -1, 5, 4, -2, 0, 10, 8]
let queryArr = [
    [2, 4],
    [3, 6],
    [2, 6],
    [5, 7]
]
querySumBrute(arrQS, queryArr)

// TC : O(Q*N)
// SC : O(1)

// Optimized

print("==================")
func querySumOptimized(_ arr: [Int], Q: [[Int]]) {
    let N = arr.count
    var prefixArr: [Int] = Array(repeating: 0, count: N)
    prefixArr[0] = arr[0]
    for i in 1...N - 1 {
        prefixArr[i] = prefixArr[i - 1] + arr[i]
    }
    
    for query in Q {
        let L = query[0]
        let R = query[1]
        if L == 0 {
            print(prefixArr[R])
        } else {
            print(prefixArr[R] - prefixArr[L - 1])
        }
    }
}

querySumOptimized(arrQS, Q: queryArr)

// TC : O(N+Q)
// SC : O(N)    // Extra space used for prefixArr

// MARK: Given N elements & Q queries, for each query, calculate sum of all EVEN indexed elements from L to R
print("==================")
func evenIndexed(_ arr: [Int], Q: [[Int]]) {
    let N = arr.count
    var pfArr: [Int] = Array(repeating: 0, count: N)
    pfArr[0] = arr[0]
    for i in 1...N-1 {
        if i % 2 == 0 {
            pfArr[i] = pfArr[i - 1] + arr[i]
        } else {
            pfArr[i] = pfArr[i - 1]
        }
    }
    
    for query in Q {
        let L = query[0]
        let R = query[1]
        if L == 0 {
            print(pfArr[R])
        } else {
            print(pfArr[R] - pfArr[L - 1])
        }
    }
}

let arrEI = [2, 3, -1, 4, 8, 7, 10, 1]
let queryArrEI = [[2, 6]]

evenIndexed(arrEI, Q: queryArrEI)

// TC : O(N+Q)
// SC : O(N)

// MARK: Given N elements & Q queries, for each query, calculate sum of all ODD indexed elements from L to R
print("==================")
func oddIndexed(_ arr: [Int], Q: [[Int]]) {
    let N = arr.count
    var pfArr: [Int] = Array(repeating: 0, count: N)
    pfArr[0] = 0
    for i in 1...N-1 {
        if i % 2 == 1 {
            pfArr[i] = pfArr[i - 1] + arr[i]
        } else {
            pfArr[i] = pfArr[i - 1]
        }
    }
    
    for query in Q {
        let L = query[0]
        let R = query[1]
        if L == 0 {
            print(pfArr[R])
        } else {
            print(pfArr[R] - pfArr[L - 1])
        }
    }
}

oddIndexed(arrEI, Q: queryArrEI)

// TC : O(N+Q)
// SC : O(N)


// MARK: Special Index problem
/*
 Given an array, arr[] of size N, the task is to find the count of array indices such that removing an element from these indices makes the sum of even-indexed and odd-indexed array elements equal.
 */
print("======= specialIndexCount ===========")
func specialIndexCount(_ arr: [Int]) -> Int {
    let N = arr.count
    // Create prefix-even arr
    var pfEven: [Int] = Array(repeating: 0, count: N)
    pfEven[0] = arr[0]
    for i in 1...N-1 {
        if i % 2 == 0 {
            pfEven[i] = pfEven[i - 1] + arr[i]
        } else {
            pfEven[i] = pfEven[i - 1]
        }
    }
    
    // Create prefix-odd arr
    var pfOdd: [Int] = Array(repeating: 0, count: N)
    pfOdd[0] = 0
    for i in 1...N-1 {
        if i % 2 == 1 {
            pfOdd[i] = pfOdd[i - 1] + arr[i]
        } else {
            pfOdd[i] = pfOdd[i - 1]
        }
    }
    
    var count = 0
    for i in 0...N-1 {
        var sumOdd = 0
        var sumEven = 0
        if i == 0 {
            sumOdd = pfEven[N - 1] - pfEven[i]
            sumEven = pfOdd[N - 1] - pfOdd[i]
        } else {
            sumOdd = pfOdd[i - 1] + (pfEven[N - 1] + pfEven[i])
            sumEven = pfEven[i - 1] + (pfOdd[N - 1] + pfOdd[i])
        }
        
        if sumOdd == sumEven {
            count += 1
        }
    }
    return count
}

let arrSIdx = [2, 3, 1, 4, 0, -1, 2, -2, 10, 8]
print(specialIndexCount(arrSIdx))

// TC : O(N+N+N) = O(3N) = O(N)
// SC : O(N)


// MARK: In-place Prefix Sum
/*
 Given an array A of N integers. Construct prefix sum of the array in the given array itself.
 */
print("======= inPlacePrefixSum ===========")
func inPlacePrefixSum(_ arr: inout [Int]) -> [Int] {
    let N = arr.count
    for i in 1..<N {
        arr[i] = arr[i - 1] + arr[i]
    }
    return arr
}

var arrIPPS = [1, 2, 3, 4, 5]
print(inPlacePrefixSum(&arrIPPS))
