// Maximum Product Subarray
//
// Given an integer array `nums`, find the contiguous subarray (containing at least one number)
// which has the largest product, and return that product.
//
// Examples:
// ---------
// Input: [2,3,-2,4]         → Output: 6        // subarray [2,3]
// Input: [-2,0,-1]          → Output: 0        // subarray [0]
// Input: [-2,3,-4]          → Output: 24       // subarray [3,-4]
// Input: [-1,-2,-3]         → Output: 6        // subarray [-1,-2,-3]
// Input: [0, 2, -5, -2, 3]  → Output: 60       // subarray [2, -5, -2, 3]
//
// Constraints:
// -----------
// • 1 ≤ nums.count ≤ 10⁴
// • -10⁴ ≤ nums[i] ≤ 10⁴
//
// Notes:
// ------
// This problem is similar to Maximum Subarray Sum, but the presence of
// negative numbers makes it trickier. Multiplying two negatives gives
// a positive, so you must track both the max and the min product up to each index.
//
// -----------------------------------------------------------------------------

func maxProduct(_ nums: [Int]) -> Int {
    guard let first = nums.first else { return 0 }
    var maxProduct = first
    var currentMaxProduct = first
    var currentMinProduct = first

    for num in nums.dropFirst() {
        let tempMin = currentMinProduct * num
        let tempMax = currentMaxProduct * num
        currentMaxProduct = max(num, tempMin, tempMax)
        currentMinProduct = min(num, tempMin, tempMax)
        maxProduct = max(maxProduct,currentMaxProduct)
    }
    
    return maxProduct
    
}

// ─────────────── TEST CASES ───────────────

let cases: [([Int], Int)] = [
    ([2, 3, -2, 4],         6),
    ([-2, 0, -1],           0),
    ([-2, 3, -4],          24),
    ([-1, -2, -3],          6),
    ([0, 2, -5, -2, 3],    60),
    ([2, -5, -2, -4, 3],  24),
    ([1],                   1),
    ([0],                   0),
    ([-3],                 -3),
    ([2, -1, 1, 1],         2)
]

var passed: [String] = []
var failed: [String] = []

for (i, (input, expected)) in cases.enumerated() {
    let result = maxProduct(input)
    let line = "Case \(i): nums=\(input) → result \(result) (expected \(expected))"
    if result == expected {
        passed.append(line)
    } else {
        failed.append(line)
    }
}

print("✅ Correct (\(passed.count))")
passed.forEach { print($0) }

print("\n❌ Incorrect (\(failed.count))")
failed.forEach { print($0) }
