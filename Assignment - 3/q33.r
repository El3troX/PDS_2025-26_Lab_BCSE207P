# ---- 1) Create column vectors ----
PatientID <- c("HOS1001","HOS1002","HOS1003","HOS1004","HOS1005",
               "HOS1006","HOS1007","HOS1008","HOS1009","HOS1010")

Name <- c("Arjun Menon","Bhavana Iyer","Chirag Gupta","Devika Nair","Eshwar Rao",
          "Farida Sheikh","Gaurav Kumar","Harini Krishnan","Ishita S","Jatin Verma")

Department <- c("Cardiology","Neurology","Endocrinology","Pulmonology","Cardiology",
                "Endocrinology","Neurology","Pulmonology","Cardiology","Endocrinology")

Diagnosis <- c("Hypertension","Migraine","Type-2 Diabetes","Asthma","Hypertension",
               "Thyroid Disorder","Epilepsy","COPD","Arrhythmia","Type-1 Diabetes")

Test1 <- c(82,71,90,64,95,60,78,68,87,83)
Test2 <- c(76,69,92,70,94,63,82,72,85,79)
Test3 <- c(88,73,86,67,93,61,79,70,90,77)
Test4 <- c(84,75,91,72,96,66,81,69,88,85)

# duplicate column as required
Test3_Score <- Test3

# ---- 2) Create the data frame ----
patients <- data.frame(
  PatientID = PatientID,
  Name = Name,
  Department = Department,
  Diagnosis = Diagnosis,
  Test1 = Test1,
  Test2 = Test2,
  Test3 = Test3,
  Test4 = Test4,
  Test3_Score = Test3_Score,
  stringsAsFactors = FALSE
)

# display structure and first rows
str(patients)
head(patients)

# ---- 3) Compute Sum, Average, Rank ----
patients$Sum <- rowSums(patients[, c("Test1","Test2","Test3","Test4")])
patients$Average <- round(patients$Sum / 4, 2)

# highest Sum gets rank 1
patients$Rank <- rank(-patients$Sum, ties.method = "min")

# print full data frame
print(patients)

# sorted by rank
patients_by_rank <- patients[order(patients$Rank), ]
print(patients_by_rank)

# ---- 4) Test-wise averages ----
test_cols <- c("Test1","Test2","Test3","Test4")

test_wise_avg <- colMeans(patients[, test_cols], na.rm = TRUE)

cat("Test-wise Average Scores:\n")
print(round(test_wise_avg, 2))

# ---- 5) Department-wise averages ----
dept_test_avg <- aggregate(
  patients[, test_cols],
  by = list(Department = patients$Department),
  FUN = function(x) mean(x, na.rm = TRUE)
)

# overall average per department
dept_test_avg$Overall_Average <- rowMeans(dept_test_avg[, test_cols], na.rm = TRUE)

# sort by overall average (descending)
dept_test_avg <- dept_test_avg[order(-dept_test_avg$Overall_Average), ]

# round only numeric columns
dept_test_avg[, test_cols] <- round(dept_test_avg[, test_cols], 2)
dept_test_avg$Overall_Average <- round(dept_test_avg$Overall_Average, 2)

cat("Department-wise Average Scores:\n")
print(dept_test_avg)
