// Range Sum Query – Immutable
//
// Given an integer array `nums`, design a data structure that supports
// repeatedly answering the sum of elements from index `left` to `right`
// (inclusive).
//
// Examples:
//   nums = [-2, 0, 3, -5, 2, -1]
//
//   sumRange(0, 2) →  1
//   sumRange(2, 5) → -1
//   sumRange(0, 5) → -3
//
// Constraints:
//   • 1 ≤ nums.count ≤ 10⁴
//   • Each `sumRange` query will be called up to 10⁴ times.
//   • -10⁵ ≤ nums[i] ≤ 10⁵
//
// -----------------------------------------------------------------------------

class NumArray {
    private var prefix: [Int] = [0]

    init(_ nums: [Int]) {
        var sum = 0
        for num in nums {
            sum += num
            prefix.append(sum)
        }
    }

    func sumRange(_ left: Int, _ right: Int) -> Int {
        return prefix[right+1] - prefix[left]
    }
}

// ─────────────── TEST CASES ───────────────

let cases: [([Int], [(Int, Int, Int)])] = [
    (
        [-2, 0, 3, -5, 2, -1],
        [
            (0, 2,  1),
            (2, 5, -1),
            (0, 5, -3),
            (3, 3, -5)
        ]
    ),
    (
        [1, 2, 3, 4, 5],
        [
            (0, 4, 15),
            (1, 3,  9),
            (2, 2,  3)
        ]
    )
]

var passed: [String] = []
var failed: [String] = []

for (i, (nums, queries)) in cases.enumerated() {
    let obj = NumArray(nums)
    for (j, (l, r, expected)) in queries.enumerated() {
        let result = obj.sumRange(l, r)
        let line = "Case \(i).\(j): nums=\(nums), range=(\(l),\(r)) → result \(result) (expected \(expected))"
        if result == expected {
            passed.append(line)
        } else {
            failed.append(line)
        }
    }
}

print("✅ Correct (\(passed.count))")
passed.forEach { print($0) }

print("\n❌ Incorrect (\(failed.count))")
failed.forEach { print($0) }
