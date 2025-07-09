# Hash Map vs Hash Set - Quick Guide

## What is a Hash Set?
- A **Hash Set** stores only **keys** (unique elements), no associated values.
- It is used to quickly check if an element **exists** in a collection.
- Useful for **duplicate detection**, membership testing, or removing duplicates.

## What is a Hash Map?
- A **Hash Map** stores **key-value pairs**.
- Used when you want to **map** keys to values, like counting frequencies or storing indices.

---

## When to Use Hash Set?
- Detect if duplicates exist.
- Check if an element is present.
- Track visited elements in graph or sequence problems.
- Remove duplicates from a list.

### Hash Set Skeleton

```python
hash_set = set()
for val in arr:
    if val in hash_set:
        # Duplicate found or element exists
        return True
    hash_set.add(val)
return False
```

---

## When to Use Hash Map?
- Store frequencies of elements.
- Map elements to indices or other data.
- Store complements or counts for logic.
  
### Hash Map Skeleton

```python
hash_map = {}
for i, val in enumerate(arr):
    if val in hash_map:
        # Use stored info, e.g., index or count
        pass
    else:
        hash_map[val] = i  # or count = 1 etc.
```

---

## Summary
- Use **Hash Set** when you only care about **existence** or **uniqueness**.
- Use **Hash Map** when you need to store and retrieve **associated data** for each key.
