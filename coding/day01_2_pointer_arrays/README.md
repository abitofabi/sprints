# 🧠 Two Pointers: The Ultimate Guide

The **Two Pointers** technique is a powerful and efficient strategy used to solve array and string problems, especially when the input is sorted or when you're working with subarrays, substrings, or partitions.

---

## ✨ What is Two Pointers?

Two Pointers involves **using two variables (pointers)** to traverse data structures like arrays or strings.  
These pointers may:

- Start at opposite ends  
- Start at the same end  
- Move toward each other or in the same direction  

---

## 📦 Common Use Cases

| Category                          | Description                                                |
|----------------------------------|------------------------------------------------------------|
| ✅ Searching in sorted arrays     | Find pairs that meet a target sum                          |
| 🔁 Reversing or checking symmetry | Palindromes, reverse arrays/strings                        |
| 🧹 In-place operations            | Removing elements, duplicates, merging arrays              |
| 📐 Window sizing / Shrinking      | Sliding window variants                                    |
| 🧠 Advanced math tricks           | Trapping rain water, 3Sum/4Sum logic                       |

---

## 🛠️ Common Patterns

### 1. 🔁 **Start-End Convergence**  
Used when array is **sorted**  
Pointers start at both ends and move inward

```python
left = 0
right = len(arr) - 1
while left < right:
    # do something
    if condition:
        left += 1
    else:
        right -= 1
```

---

### 2. 🔄 **Two Pointers Moving Forward**  
Used to filter, copy, or reassign values

```python
i = 0
for j in range(len(arr)):
    if condition_on_arr[j]:
        arr[i] = arr[j]
        i += 1
```

---

### 3. 📐 **Sliding Window**  
Used to maintain a range (window) with a certain property

```python
left = 0
for right in range(len(arr)):
    while invalid_condition:
        left += 1
    # update result here
```

---

## 🧪 Popular Problem Examples

| Problem | Description | Pattern |
|--------|-------------|---------|
| Two Sum II (LC 167) | Find two numbers that add to a target | Start-end |
| Valid Palindrome (LC 125) | Check if string is a palindrome | Start-end |
| Merge Sorted Array (LC 88) | Merge two sorted arrays in-place | Reverse-fill |
| Remove Duplicates (LC 26) | In-place deduplication | Two moving forward |
| Container With Most Water (LC 11) | Maximize area between two heights | Start-end |

---

## 🔍 How to Identify Two Pointers Problems

Ask yourself:

- ✅ Is the input **sorted**?  
- ✅ Am I working with **pairs**, **windows**, or **palindromes**?  
- ✅ Do I need to **minimize/maximize** a certain value?  
- ✅ Can I do it **without extra space**?  

If yes — consider Two Pointers!

---

## 💡 Time & Space Complexity

| Operation Type       | Time Complexity | Space Complexity |
|----------------------|-----------------|------------------|
| Brute-force (2 loops) | O(n²)           | O(1)             |
| Two Pointers          | O(n)            | O(1)             |

✅ Often used to **optimize brute-force** solutions to linear time.

---

## 🧱 Visual Example

### 🎯 Problem: Two Sum II  
**Input**: `[2, 3, 5, 8, 11, 15]`, target = `10`

```plaintext
left →  2   3   5   8   11   15  ← right
                ↑       ↑
            5 + 8 = 13 → too big, move right inward

left →  2   3   5   8   11   15  ← right
                ↑   ↑
            5 + 5 = 10 → match found!
```

---

## 🧼 Clean Implementation Template

```python
def two_pointers(arr):
    left = 0
    right = len(arr) - 1
    while left < right:
        # Custom logic here
        if arr[left] + arr[right] == target:
            return [left, right]
        elif arr[left] + arr[right] < target:
            left += 1
        else:
            right -= 1
    return []
```

---

## 📌 Best Practices

- 🧠 Sort the array if needed before applying Two Pointers  
- ⚠️ Don’t go out of bounds (`left < right`)  
- 🛑 Always have clear exit conditions  
- 🧹 Use `i` to write and `j` to read when modifying arrays in-place  
- 🧪 Dry run with a sample input to visualize movement  

---

## 🧰 Related Techniques

- 🔄 Sliding Window  
- 🧮 Prefix Sums + Two Pointers  
- 📏 Binary Search + Two Pointers  
- 🧊 HashMap + Two Pointers (for variants like 3Sum)  

---

## 📓 Interview Tip

> "When brute force is O(n²), ask:  
> Can I use sorting + two pointers to reduce this to O(n)?"

---

## 🏁 Summary

Two Pointers is a foundational technique that comes up in:  
- Arrays  
- Strings  
- Subarray/substring problems  
- In-place transformations  
- Search/optimization problems  

If you **master this technique**, you'll unlock the ability to solve a wide class of problems *without extra space and in linear time*. 💪

---

📂 Save this file as `two_pointers_guide.md` for future reference!
