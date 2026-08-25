//: [Previous](@previous)

import Foundation

// MARK: ========== Reverse Array ==========

func reverseArray(_ arr: inout [Int]) -> [Int] {
    var i = 0
    var j = arr.count - 1
    
    while i < j {
        var temp = arr[i]
        arr[i] = arr[j]
        arr[j] = temp
        
        i += 1
        j -= 1
    }
    return arr
}

var numArr = [1, 2, 3, 4, 5]
print("Actual Array = \(numArr)")
print("Reversed Array \(reverseArray(&numArr))")

// TC : O(N/2) = O(N)
// SC : O(1), no extra space used here

// MARK: ========== Rotate array (1 time) L to R (Clockwise) ==========
// Brute force

func rotateArray_brute(_ arr: inout [Int]) -> [Int] {
    let lastIndex = arr.count - 1
    // First, take the last element in some temp variable
    let temp = arr[lastIndex]
    
    // Loop the array in reverse order, and replace element with the element before it
    for i in (1...lastIndex).reversed() {
        arr[i] = arr[i - 1]
    }
    
    // Using while loop, but here we need to take extra i variable just for looping purpose
    //    var i = lastIndex
    //    while i > 0 {
    //        arr[i] = arr[i - 1]
    //        i -= 1
    //    }
    
    // Lastly, assign the last element to first
    arr[0] = temp
    return arr
}

var numArr2 = [1, 2, 3, 4, 5]
print("Rotated 1 time = \(rotateArray_brute(&numArr2))")

// TC : O(N)
// SC : O(1)

// MARK: ========== Rotate array (k times) ==========

func rotateArr_k_times_brute(_ arr: inout [Int], _ k: Int) -> [Int] {
    for i in 0..<k {
        rotateArray_brute(&arr)
    }
    return arr
}

var numArr3 = [1, 2, 3, 4, 5]
print("Rotated k(3) times = \(rotateArr_k_times_brute(&numArr3, 3))")

// TC : O(k*N) // 10^5 * 10^5 will give TLE
// SC : O(1)

// MARK: ========== Rotate array (k times) Optimized ==========

func rotateArray_optimized(_ arr: inout [Int], _ k: inout Int) -> [Int] {
    // Reverse array (0, n-1)
    // Reverse array (0, k-1)
    // Reverse array (k, n-1)
    var n = arr.count
    
    // If k is bigger than total elements count, do k % n
    if k >= n {
        k = k % n
    }
    arr = reverseArray(&arr, i: 0, j: n - 1)
    arr = reverseArray(&arr, i: 0, j: k - 1)
    arr = reverseArray(&arr, i: k, j: n - 1)
    return arr
}

func reverseArray(_ arr: inout [Int], i: Int, j: Int) -> [Int] {
    var a = i
    var b = j
    while a < b {
        var temp = arr[a]
        arr[a] = arr[b]
        arr[b] = temp
        a += 1
        b -= 1
    }
    return arr
}

var k = 6
var arr2 = [1, 2, 3, 4, 5]
print("Rotated array optimised = \(rotateArray_optimized(&arr2, &k))")
