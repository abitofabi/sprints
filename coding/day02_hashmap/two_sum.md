# 🧠 Leetcode 1: Two Sum – Interview-Style Explanation with All Approaches

## ❓ Problem Statement

> Given an array of integers `nums` and an integer `target`, return **indices** of the two numbers such that they add up to the target.  
> You may assume that each input would have **exactly one solution**, and you may not use the same element twice.

**Example:**

~~~python
Input: nums = [2, 7, 11, 15], target = 9  
Output: [0, 1]  # because 2 + 7 = 9
~~~

---

## 👩‍💼 Interviewer: *"How would you solve this problem?"*

---

## 🔁 Approach 1: Brute Force (O(n²))

### 🔹 Idea:
Try every possible pair of elements and check if their sum equals the target.

~~~python
def twoSum(nums, target):
    for i in range(len(nums)):
        for j in range(i + 1, len(nums)):
            if nums[i] + nums[j] == target:
                return [i, j]
~~~

### 🔹 Time & Space:
- Time: O(n²)
- Space: O(1)

### 🔹 Why It's Suboptimal:
- Nested loops make it slow for large arrays.
- Doesn't leverage any structure or optimization.

---

## 🔄 Approach 2: Sort + Two Pointers (O(n log n))

### 🔹 Idea:
Sort the array, then use the two-pointer technique to find the pair.  
However, since we need to return **original indices**, we must **track indices before sorting**.

~~~python
def twoSum(nums, target):
    nums_with_index = [(val, idx) for idx, val in enumerate(nums)]
    nums_with_index.sort()

    left, right = 0, len(nums) - 1

    while left < right:
        curr_sum = nums_with_index[left][0] + nums_with_index[right][0]
        if curr_sum == target:
            return [nums_with_index[left][1], nums_with_index[right][1]]
        elif curr_sum < target:
            left += 1
        else:
            right -= 1
~~~

### 🔹 Time & Space:
- Time: O(n log n) due to sorting
- Space: O(n) for storing index-value pairs

### 🔹 Tradeoffs:
- Faster than brute force.
- Slightly complex due to sorting and index tracking.

---

## ⚡ Approach 3: Hash Map (O(n)) ✅ Optimal

### 🔹 Idea:
Use a hash map to store previously seen numbers.  
For each number, check if its complement (target - num) exists in the map.

~~~python
def twoSum(nums, target):
    num_to_index = {}  # key = number, value = index

    for i, num in enumerate(nums):
        complement = target - num
        if complement in num_to_index:
            return [num_to_index[complement], i]
        num_to_index[num] = i
~~~

### 🔹 Time & Space:
- Time: O(n)
- Space: O(n)

### 🔹 Why It's Optimal:
- Single-pass, linear-time solution
- No sorting, preserves original indices naturally

---

## 🧠 How It Works (Walkthrough)

Given:
~~~python
nums = [2, 7, 11, 15]
target = 9
~~~

- i = 0 → num = 2 → complement = 7 → not in map → store `{2: 0}`
- i = 1 → num = 7 → complement = 2 → 2 **is** in map → return `[0, 1]`

---

## 🧮 Time and Space Complexity Summary

| Approach              | Time Complexity | Space Complexity |
|-----------------------|------------------|------------------|
| Brute Force           | O(n²)            | O(1)             |
| Sort + Two Pointers   | O(n log n)       | O(n)             |
| Hash Map (Optimal)    | O(n)             | O(n)             |

---

## ⚠️ Edge Cases Considered

- Negative numbers and zero
- Target is the sum of same number twice → Problem says “don’t reuse elements”
- Only one solution is guaranteed

---

## 📌 Interview Summary

> I explained three solutions:  
> - **Brute force** for baseline understanding  
> - **Sorting with two pointers** for a balanced option  
> - **Hash map** for optimal performance  
> I’d use the hash map approach in real-world scenarios due to its linear time and direct use of original indices.
