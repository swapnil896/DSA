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
