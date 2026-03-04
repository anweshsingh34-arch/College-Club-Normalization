CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Email VARCHAR(100)
);

CREATE TABLE Club (
    ClubID INT AUTO_INCREMENT PRIMARY KEY,
    ClubName VARCHAR(100),
    ClubRoom VARCHAR(50),
    ClubMentor VARCHAR(100)
);

CREATE TABLE Membership (
    MembershipID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    ClubID INT,
    JoinDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (ClubID) REFERENCES Club(ClubID)
); 
