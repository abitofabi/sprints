# LeetCode Patterns Cheat Sheet

## 1. Hash Map / Hash Set  
**Use When:** Need quick lookup, frequency counting, or complements  
**Examples:** Two Sum, Contains Duplicate, Anagrams  
**Skeleton:**
```python
def function(arr, target):
    hashmap = {}
    for i, val in enumerate(arr):
        complement = target - val
        if complement in hashmap:
            return [hashmap[complement], i]
        hashmap[val] = i
```

---

## 2. Sliding Window  
**Use When:** Find max/min substring or subarray with some property  
**Examples:** Longest Substring Without Repeating Characters, Max Sum Subarray  
**Skeleton:**
```python
left = 0
window_data = {}
max_len = 0

for right in range(len(arr)):
    # Add arr[right] to window_data
    while window invalid:
        # Remove arr[left] from window_data
        left += 1
    max_len = max(max_len, right - left + 1)
```

---

## 3. Two Pointers  
**Use When:** Sorted arrays or partitioning problems  
**Examples:** Two Sum (sorted), Reverse String, Container With Most Water  
**Skeleton:**
```python
left, right = 0, len(arr) - 1

while left < right:
    current_sum = arr[left] + arr[right]
    if current_sum == target:
        return [left, right]
    elif current_sum < target:
        left += 1
    else:
        right -= 1
```

---

## 4. Stack  
**Use When:** Need to track previous elements, match pairs, or find next greater/smaller  
**Examples:** Valid Parentheses, Next Greater Element, Largest Rectangle in Histogram  
**Skeleton:**
```python
stack = []

for i, val in enumerate(arr):
    while stack and condition(stack[-1], val):
        stack.pop()
    stack.append(val)
```

---

## 5. Prefix Sum  
**Use When:** Fast range sum or difference queries  
**Examples:** Subarray Sum Equals K, Range Sum Query  
**Skeleton:**
```python
prefix = [0] * (len(arr) + 1)
for i in range(len(arr)):
    prefix[i+1] = prefix[i] + arr[i]

# sum of arr[l:r] = prefix[r] - prefix[l]
```

---

## 6. Binary Search  
**Use When:** Search/optimize over sorted or monotonic data  
**Examples:** Search in Rotated Array, First Bad Version  
**Skeleton:**
```python
left, right = 0, len(arr) - 1
while left <= right:
    mid = (left + right) // 2
    if condition(mid):
        right = mid - 1
    else:
        left = mid + 1
```

---

## 7. Backtracking / DFS  
**Use When:** Generate all combinations/permutations or solve constraint problems  
**Examples:** Subsets, N-Queens, Sudoku Solver  
**Skeleton:**
```python
def backtrack(path, choices):
    if done(path):
        result.append(path[:])
        return
    for choice in choices:
        path.append(choice)
        backtrack(path, choices)
        path.pop()
```

---

## 8. Greedy  
**Use When:** Local optimal choices lead to global optimal solution  
**Examples:** Jump Game, Merge Intervals, Best Time to Buy/Sell Stock  
**Skeleton:**
```python
for item in sorted(data):
    if condition(item):
        take_action(item)
```

---

## 9. Heap / Priority Queue  
**Use When:** Fast min/max retrieval and merging sorted data  
**Examples:** Kth Largest Element, Merge K Sorted Lists  
**Skeleton:**
```python
import heapq
heap = []
for num in nums:
    heapq.heappush(heap, num)
min_val = heapq.heappop(heap)
```

---

## 10. Union-Find / Disjoint Set  
**Use When:** Group elements, detect cycles, or check connectivity  
**Examples:** Number of Islands, Accounts Merge  
**Skeleton:**
```python
parent = list(range(n))

def find(x):
    if parent[x] != x:
        parent[x] = find(parent[x])
    return parent[x]

def union(x, y):
    parent[find(x)] = find(y)
```
