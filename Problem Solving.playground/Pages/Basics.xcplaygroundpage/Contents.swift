import UIKit

// MARK: Q1

// Count the factors of N
/*
 Factor of a number is the number which divides it perfectly leaving no remainder.
 Example : 1, 2, 3, 6 are factors of 6
 */

// Brute force
func countFactorsBruteForce(_ N: Int) -> Int {
    var count = 0
    for i in 1...N {
        if N % i == 0 {
            count += 1
        }
    }
    return count
}

let factorsOf24 = countFactorsBruteForce(24)

/*
 Assume system does 10^8 iterations per sec
 10^8 iter => 1 sec
 1 iter    => 1/10^8 secs
 N iter    => N/10^8 secs
 
 Above code takes N iterations
 Suppose N = 10^8
 Then, code will take 10^8 / 10^8 secs => 10 secs.
 But if N = 10^18
 Then, code will take 10^18 / 10^8 secs => 10^10 secs => Billions of years
 */


// Optimized Approach
/*
 If ixj = N // N=24, 2x12 = 24
    j = N/i // 12 = 24/2
    We can say, if i is a factor of N, then N/i is also a factor of N
 
 Eg: N=100
 i  N/i count
 1  100 c+=2
 2  50  c+=2
 4  25  c+=2
 5  20  c+=2
 10 10  c+=1
 */

// Optimized code
func countFactorsOptimized(_ N: Int) -> Int {
    guard N > 0 else { return 0 }
    var count = 0
    var i = 1
    while i * i <= N {
        if N % i == 0 {
            count += (i == N / i) ? 1 : 2
        }
        i += 1
    }
    return count
}

// Above code will take sqrt(N) iterations

let factosOf100 = countFactorsOptimized(100)

// MARK: Q2

// Check if a number is Prime number or not
/*
 A prime number is a number which has exactly 2 factors
 */

func isPrime(_ number: Int) -> Bool {
    guard number > 0 else { return false }
    if countFactorsOptimized(number) == 2 {
        return true
    }
    return false
}

print("1 is prime? \(isPrime(1))")
print("2 is prime? \(isPrime(2))")
print("3 is prime? \(isPrime(3))")
print("4 is prime? \(isPrime(4))")
print("5 is prime? \(isPrime(5))")
print("6 is prime? \(isPrime(6))")
print("7 is prime? \(isPrime(7))")
print("8 is prime? \(isPrime(8))")
print("9 is prime? \(isPrime(9))")
print("10 is prime? \(isPrime(10))")
print("11 is prime? \(isPrime(11))")


// MARK: Q3

// Find the sum of all natural numbers till N
/*
 N = 100
 s =         1+2+3+...+99+100
 reverse s = 100+99+...+3+2+1
 so,    2s = 101+101+...+101
        s  = 101*100 / 2    // 100 times 100+1 divided by 2
 
 so, formula is, Sum of N = N(N+1)/2
 */

func sumOfNaturalNumbers(_ N: Int) -> Int {
    guard N > 0 else { return 0 }
    return N * (N + 1) / 2
}

print(sumOfNaturalNumbers(100))

// Time complexity - O(1)

