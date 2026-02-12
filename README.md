# Module 1: Matrix Transformations — transform_points.m

**Course:** ENG 1112 — Mini Projects: Coding and Linear Algebra  
**Module:** 1 (Weeks 1–2)  
**Weight:** 12% of course grade  
**Due:** Sunday 11:59 PM (end of Week 3)  

## Your Mission

Build a MATLAB function `transform_points.m` that applies geometric transformations (rotation, scaling, translation) to 2D points represented as column vectors.

## Repository Contents

| File | Description |
|------|-------------|
| `transform_points.m` | **Your main deliverable** — fill in the TODO sections |
| `test_transform.m` | Test suite — run frequently to check progress |
| `README.md` | This file |
| `.gitignore` | Git configuration (do not modify) |

## Function Specification

```matlab
new_points = transform_points(points, type, T)
```

**Inputs:**
- `points` — 2×N matrix where each column is a 2D point [x; y]
- `type` — string specifying the transformation: `'rotation'`, `'scaling'`, or `'translation'`
- `T` — transformation parameter:
  - **Rotation:** scalar angle in degrees (counterclockwise)
  - **Scaling:** `[sx, sy]` vector of scale factors
  - **Translation:** `[tx, ty]` vector of translation amounts

**Output:**
- `new_points` — 2×N matrix of transformed points

## Getting Started

1. Open MATLAB and set your **Current Folder** to this repository
2. Open `transform_points.m` in the MATLAB Editor
3. Implement **rotation** first (it has the most test coverage)
4. Run `test_transform` after each implementation
5. **Commit and push** after each working transformation type

## Testing Your Code

```matlab
>> test_transform
```

Target: **6/6 tests passing** before submission.

## Submission Checklist

- [ ] `transform_points.m` handles rotation correctly
- [ ] `transform_points.m` handles scaling correctly
- [ ] `transform_points.m` handles translation correctly
- [ ] All 6 tests pass when running `test_transform`
- [ ] Code has proper comments and documentation
- [ ] Changes committed and **pushed** to GitHub

## Grading (40 points)

| Component | Points |
|-----------|--------|
| Correctness (rotation, scaling, translation) | 25 |
| Code Quality (readability, structure, MATLAB style) | 10 |
| Documentation (function header, inline comments) | 5 |

## Additional Deliverables (Submit on e-Class)

- **Test Cases** (20 pts): Your own test script + results screenshot
- **Visualization** (20 pts): Before/after transformation plot(s) as PNG/JPG + the .m script
- **Reflection Report** (10 pts): 1–2 page PDF reflection on your development process

## Tips

- Use `deg2rad()` to convert degrees to radians
- The 2D rotation matrix is: `R = [cos(θ) -sin(θ); sin(θ) cos(θ)]`
- The scaling matrix is: `S = [sx 0; 0 sy]`
- For translation, use `repmat([tx; ty], 1, N)` to add offset to each column
- **Push early and often!** Your last push before the deadline is what counts
- A single giant commit at the deadline with no prior history may be flagged for review

## Need Help?

- **Friday Lab:** Your TA will guide you through each transformation type
- **e-Class Discussion Board:** Post questions (include error messages!)
- **Office Hours:** Check e-Class for schedule
- **MATLAB Documentation:** `help transform_points` (once you add the header!)
