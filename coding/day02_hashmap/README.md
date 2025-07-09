# Hash Map Pattern - Complete Summary

## What is a Hash Map?
- A data structure that stores **key-value pairs**.
- Provides **average O(1)** time complexity for lookup, insertion, and deletion.
- Used to quickly find if an element or its complement exists.

---
  
## When to Use Hash Map?

- You need **fast lookup** of elements or their complements.
- Problems involving **frequency counts** (e.g., duplicates, anagrams).
- Mapping elements to their **indices or other values**.
- When you want to **avoid nested loops** by replacing with O(1) lookups.
- To detect **pairs or groups** that satisfy a condition (e.g., sums, differences).

---

## How to Identify a Hash Map Problem?

- Problem asks for **pairs, triplets, or groups** with specific sum/difference.
- Need to **check for duplicates or repeated elements**.
- Want to answer **queries about frequencies or existence** efficiently.
- Input is **unsorted**, and sorting would lose required info.
- You must track **elements and their indices or counts**.

---

## Common Patterns Using Hash Map

| Pattern                   | Description                                   |
|---------------------------|-----------------------------------------------|
| Two Sum                   | Find pairs adding up to target                  |
| Contains Duplicate         | Detect if duplicates exist                       |
| Group Anagrams            | Group strings that are anagrams                  |
| First Unique Character     | Find first non-repeating character               |
| Subarray Sum Equals K      | Count or find subarrays with given sum          |
| Longest Consecutive Sequence | Track sequences using presence map            |

---

## Popular LeetCode Problems

- [1. Two Sum](https://leetcode.com/problems/two-sum/)
- [217. Contains Duplicate](https://leetcode.com/problems/contains-duplicate/)
- [49. Group Anagrams](https://leetcode.com/problems/group-anagrams/)
- [387. First Unique Character in a String](https://leetcode.com/problems/first-unique-character-in-a-string/)
- [560. Subarray Sum Equals K](https://leetcode.com/problems/subarray-sum-equals-k/)
- [128. Longest Consecutive Sequence](https://leetcode.com/problems/longest-consecutive-sequence/)

---

## Skeleton Code

```python
def example_function(arr, target):
    hash_map = {}
    for i, val in enumerate(arr):
        # Example: check if complement exists
        complement = target - val
        if complement in hash_map:
            # Return indices or do something
            return [hash_map[complement], i]
        # Store current val with its index
        hash_map[val] = i
    return None
```

---

## Tips

- Decide **what to use as key and what as value** carefully.
- Often keys are the array elements; values can be indices or counts.
- Use hash map to **reduce O(n²) brute force to O(n)**.
- Remember to handle edge cases like **no solution found**.
- Use Python dict methods like `.get()` and `in` for clean code.

---

Mastering hash maps unlocks solutions to a wide range of coding problems efficiently!
