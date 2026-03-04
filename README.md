 College Club Membership – Database Normalization

  
**Assignment:** Investigation and Analysis of Computing Data for Data Management  
**Task:** Task 3 – College Club Membership Management  

---

##  What This Project Is About

A college stores student club membership data in one messy table — with repeated information, missing structure, and data problems. This project fixes that by **normalizing the database step by step** (1NF → 2NF → 3NF), creating an ER diagram, and writing SQL queries to manage the data properly.

---

##  Files in This Repository

| File | What it does |
|------|--------------|
| `original_table.sql` | The raw, unnormalized table with all the data problems |
| `1nf.sql` | First Normal Form – removes repeating groups, adds a primary key |
| `2nf.sql` | Second Normal Form – splits into Student, Club, and Membership tables |
| `3nf.sql` | Third Normal Form – removes transitive dependencies, final clean structure |
| `join_query.sql` | SQL JOIN query to display Student Name, Club Name, and Join Date |

---

## How to Run the SQL Files

You can run these files in any SQL environment. These were tested using the **Command Prompt with MySQL**.

### Step 1 – Start MySQL in Command Prompt

```bash
mysql -u root -p
```
Enter your password when asked.

### Step 2 – Create and select a database

```sql
CREATE DATABASE college_clubs;
USE college_clubs;
```

### Step 3 – Run the files in order

```bash
source original_table.sql
source 1nf.sql
source 2nf.sql
source 3nf.sql
source join_query.sql
```

> 💡 Make sure you run them **in this order** — each step builds on the previous one.

---

## 🗃️ The Original Problem Table

This is the messy table we started with:

| StudentID | StudentName | Email | ClubName | ClubRoom | ClubMentor | JoinDate |
|-----------|-------------|-------|----------|----------|------------|----------|
| 1 | Asha | asha@email.com | Music Club | R101 | Mr. Raman | 1/10/2024 |
| 2 | Bikash | bikash@email.com | Sports Club | R202 | Ms. Sita | 1/12/2024 |
| 1 | Asha | asha@email.com | Sports Club | R202 | Ms. Sita | 1/15/2024 |
| ... | ... | ... | ... | ... | ... | ... |

**Problems with this table:**
- Student details (name, email) are repeated every time they join a new club
- Club details (room, mentor) are repeated for every member
- If you delete the last member of a club, the club info is lost too

---

##  Normalization Steps

### 1NF – First Normal Form
- Each cell has only one value (atomic)
- Added a composite primary key: `(StudentID, ClubName)`

### 2NF – Second Normal Form
- Split into three separate tables:
  - **Student** (StudentID, StudentName, Email)
  - **Club** (ClubID, ClubName, ClubRoom, ClubMentor)
  - **Membership** (StudentID, ClubID, JoinDate)

### 3NF – Third Normal Form
- Student details depend only on `StudentID`
- Club details depend only on `ClubID`
- No column depends on another non-key column

---

##  Results / Screenshots

### Original Table Output
<img width="1713" height="508" alt="image" src="https://github.com/user-attachments/assets/ebb59712-0d65-45ca-becb-52825c4e1951" />
### After Normalization (3NF Tables)
<img width="1467" height="710" alt="image" src="https://github.com/user-attachments/assets/17d4e874-ead1-466e-bb55-5f14c983360f" />
<img width="1379" height="482" alt="image" src="https://github.com/user-attachments/assets/41c2c175-d768-4308-a371-966053963bd0" />
<img width="1413" height="810" alt="image" src="https://github.com/user-attachments/assets/8fd5c9fd-2449-4c67-a26d-9c519deaf961" />

### JOIN Query Result

<img width="831" height="520" alt="image" src="https://github.com/user-attachments/assets/4255205e-c0db-406f-9711-e9782da4e47a" />


## 🔗 JOIN Query (Quick Look)

This query brings together Student Name, Club Name, and Join Date from all three tables:

```sql
SELECT s.StudentName, c.ClubName, m.JoinDate
FROM Membership m
JOIN Student s ON m.StudentID = s.StudentID
JOIN Club c ON m.ClubID = c.ClubID;
```

---


**Anwesh Singh**  
Softwarica College of IT & E-Commerce | In collaboration with Coventry University
