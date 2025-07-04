// Maximum Subarray Sum (Any Length)
//
// Given an integer array `nums`, return the largest possible sum of any
// contiguous subarray.
//
// Examples:
//   nums = [-2, 1, -3, 4, -1, 2, 1, -5, 4]  →  6   // subarray [4, -1, 2, 1]
//   nums = [1]                               →  1
//   nums = [5, 4, -1, 7, 8]                  →  23  // [5, 4, -1, 7, 8]
//
// Constraints:
//   • 1 ≤ nums.count ≤ 10⁵
//   • -10⁴ ≤ nums[i] ≤ 10⁴
//
// -----------------------------------------------------------------------------

func maxSubarraySum(_ nums: [Int]) -> Int {
    var maxSum = Int.min
    var currentSum = 0
    for num in nums{
        currentSum += num
        maxSum = max(maxSum,currentSum)
        if currentSum < 0 {
            currentSum = 0
        }
    }
    return maxSum
}

// ─────────────── TEST EXAMPLES ───────────────

let cases: [([Int], Int)] = [
    ([-2, 1, -3, 4, -1, 2, 1, -5, 4], 6),
    ([1, 4, 2, 10, 23, 3, 1, 0, 20],   64),
    ([2, 3, 4, 1, 5],                  15),
    ([-3, -2, -5, -1],                -1),
    ([5],                               5),
    ([7, 5, 4, -1, 9, 2, 5, 6],        37),
    ([8, 8, 8, 8],                     32),
    ([0, 0, 0, 0],                      0)
]

var passed: [String] = []
var failed: [String] = []

for (i, (input, expected)) in cases.enumerated() {
    let result = maxSubarraySum(input)
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
