// Subarray Sum Equals K
//
// Given an integer array `nums` and an integer `k`, return the total number
// of continuous subarrays whose sum is equal to `k`.
//
// Examples:
// ---------
// Input: nums = [1, 1, 1], k = 2       → Output: 2
// Input: nums = [1, 2, 3], k = 3       → Output: 2
// Input: nums = [3, 4, 7, 2, -3, 1, 4, 2], k = 7 → Output: 4
//
// Constraints:
// ------------
// • 1 ≤ nums.count ≤ 20,000
// • -1e3 ≤ nums[i] ≤ 1e3
// • -1e7 ≤ k ≤ 1e7
//
// -----------------------------------------------------------------------------

func subarraySum(_ nums: [Int], _ k: Int) -> Int {
    var seen : [Int:Int] = [0:1]
    var prefix = 0
    var count = 0
    for num in nums {
        prefix += num
        let temp = prefix-k
        if let seenTimes = seen[temp] {
            count += seenTimes
        }
        seen[prefix, default: 0] += 1
    }
    
    return count
}

// ─────────────── TEST CASES ───────────────

let cases: [([Int], Int, Int)] = [
    ([1, 1, 1], 2, 2),
    ([1, 2, 3], 3, 2),
    ([3, 4, 7, 2, -3, 1, 4, 2], 7, 4),
    ([1], 0, 0),
    ([1], 1, 1),
    ([0, 0, 0, 0, 0], 0, 15),
    ([1, -1, 0], 0, 3)
]

var passed: [String] = []
var failed: [String] = []

for (i, (input, k, expected)) in cases.enumerated() {
    let result = subarraySum(input, k)
    let line = "Case \(i): nums=\(input), k=\(k) → result \(result) (expected \(expected))"
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
