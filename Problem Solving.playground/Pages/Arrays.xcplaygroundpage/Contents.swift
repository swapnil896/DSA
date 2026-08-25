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

// MARK: ========== Good Pair ==========
/*
 Given an array A and an integer B. A pair(i, j) in the array is a good pair if i != j and (A[i] + A[j] == B). Check if any good pair exist or not.
 
 Return 1 if good pair exist otherwise return 0.
 
 Ex :
 1:
 A = [1,2,3,4]
 B = 7
 Output : 1
 
 2:
 A = [1,2,4]
 B = 4
 Output : 0
 */

func goodPair(_ A: inout [Int], _ B: Int) -> Int {
    let N = A.count
    for i in 0..<N {
        for j in 0..<N {
            if i == j { continue }
            if (A[i] + A[j] == B) {
                return 1
            }
        }
    }
    return 0
}

// TC : O(N*N) = O(N^2)
// SC : O(1), no extra space used here

var arrGP = [1, 2, 3, 4]
var arrGP2 = [1, 2, 4]
print("Contains good pair = \(goodPair(&arrGP, 7))")
print("Contains good pair = \(goodPair(&arrGP2, 4))")

// MARK: ========== Reverse in a range ==========
/*
 Given an array A of N integers and also given two integers B and C. Reverse the elements of the array A within the given inclusive range [B, C].
 */

func reverseInRange(_ A: inout [Int], _ B: Int, _ C: Int) -> [Int] {
    var i = B
    var j = C
    while i < j {
        var temp = A[i]
        A[i] = A[j]
        A[j] = temp
        i += 1
        j -= 1
    }
    return A
}

var arrRIR = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
print("Reversed arr in range(2,5) = \(reverseInRange(&arrRIR, 2, 5))")

// TC : O(N/2) = O(N)
// SC : O(1), no extra space used here

// MARK: ========== Max Min of an Array ==========
/*
 Given an array A of size N. You need to find the sum of Maximum and Minimum element in the given array.
 */

func findMaxMinOfArray(_ A: inout [Int]) -> Int {
    let N = A.count
    var min = A[0]
    var max = A[0]
    for i in 1..<N {
        if A[i] > max {
            max = A[i]
        }
        if A[i] < min {
            min = A[i]
        }
    }
    return max + min
}

// TC : O(N)
// SC : O(1)

var arrMM = [-2, 1, -4, 5, 3]
print("Sum of Max & Min from [-2, 1, -4, 5, 3] = \(findMaxMinOfArray(&arrMM))")

var arrMM2 = [1, 3, 4, 1]
print("Sum of Max & Min from [1, 3, 4, 1] = \(findMaxMinOfArray(&arrMM2))")


// MARK: ========== Linear Search - Multiple Occurences ==========
/*
 Given an array A and an integer B, find the number of occurrences of B in A.
 */

func linearSearch(_ A: inout [Int], _ B: Int) -> Int {
    var count = 0
    var N = A.count
    for i in 0..<N {
        if A[i] == B {
            count += 1
        }
    }
    return count
}

// TC : O(N)
// SC : O(1)

var arrLS = [1, 2, 2]
print("Linear Search O/P = \(linearSearch(&arrLS, 2))")

var arrLS2 = [1, 2, 1]
print("Linear Search O/P = \(linearSearch(&arrLS2, 3))")


// MARK: ========== Time to equality ==========
/*
 Given an integer array A of size N. In one second, you can increase the value of one element by 1.
 Find the minimum time in seconds to make all elements of the array equal.
 Ex:
 A = [2, 4, 1, 3, 2]
 O/P: 8 // We can change the array A = [4, 4, 4, 4, 4]. The time required will be 8 seconds.
*/

func timeToEquality(_ A: [Int]) -> Int {
    let N = A.count
    var max = getMax(A)
    var sum = 0
    
    for i in 0..<N {
        sum += max - A[i]
    }
    return sum
}

func getMax(_ A: [Int]) -> Int {
    var max = A[0]
    for i in 1..<A.count {
        if A[i] > max {
            max = A[i]
        }
    }
    return max
}

var arrTTE = [2, 4, 1, 3, 2]
print("Time to Equality = \(timeToEquality(arrTTE))")

// TC : O(N+N) = O(N)
// SC : O(1)


// MARK: ========== Count of elements ==========
/*
 Given an array A of N integers.
 Count the number of elements that have at least 1 elements greater than itself.
 
 Example Input

 Input 1:
 A = [3, 1, 2]
 Output 1: 2
 
 Input 2:
 A = [5, 5, 3]
 Output 2: 1
 
 So, here we need to find number of maximum elements in array, and then from arr length deduct those no.of max elements. So, when you deduct max elements, you get elements which have atleast 1 element greater than itself
 */

func countOfElements(_ A: [Int]) -> Int {
    var maxCount = 0
    var maxValue = 0
    
    for value in A {
        if value > maxValue {
            maxValue = value
            maxCount = 1
        } else if value == maxValue {
            maxCount += 1
        }
    }
    return A.count - maxCount
}

// TC : O(N)
// SC : O(1)

let arrCOE = [3, 1, 2]
print("Count Of Elements = \(countOfElements(arrCOE))")

let arrCOE2 = [5, 5, 3]
print("Count Of Elements = \(countOfElements(arrCOE2))")
