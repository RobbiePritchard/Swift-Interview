// Longest Substring Without Repeating Characters
// Pattern: Sliding Window  ───────────────────────────────────────────────
//
// Problem
// -------
// Given a string `s`, return the length of the longest substring that
// contains no repeating characters.
//
// Examples
// --------
// Input:  "abcabcbb"       Output: 3     // "abc"
// Input:  "bbbbb"          Output: 1     // "b"
// Input:  "pwwkew"         Output: 3     // "wke"
//
// Constraints
// -----------
// • 0 ≤ |s| ≤ 5·10⁴
// • `s` may contain ASCII letters, digits, symbols, and spaces.
// ----------------------

func lengthOfLongestSubstring(_ s: String) -> Int {
    var seen: [Character: String.Index] = [:]
    var start = s.startIndex
    var maxLen = 0
    
    for index in s.indices {
        let char = s[index]
        if let pos = seen[char],  pos >= start {
            start = s.index(after: pos)
        }
        let length = s.distance(from: start, to: s.index(after: index))
        maxLen = max(maxLen, length)
        seen[char] = index
    }
    
    return maxLen
}

// ─────────────── TEST EXAMPLES ───────────────

let cases: [(input: String, expected: Int)] = [
    ("",                 0),
    ("a",                1),
    ("aa",               1),
    ("abcabcbb",         3),
    ("bbbbb",            1),
    ("pwwkew",           3),
    ("dvdf",             3),
    ("au",               2),
    ("abba",             2),
    ("abcdeafbdgcbb",    7)   // "cdeafb"
]
var passed: [String] = []
var failed: [String] = []

for (i, test) in cases.enumerated() {
    let result = lengthOfLongestSubstring(test.input)
    let line = "Case \(i): input=\"\(test.input)\" → result \(result) (expected \(test.expected))"
    
    if result == test.expected {
        passed.append(line)
    } else {
        failed.append(line)
    }
}

// Display the outcome
print("✅ Correct (\(passed.count))")
passed.forEach { print($0) }

print("\n❌ Incorrect (\(failed.count))")
failed.forEach { print($0) }
