## ------------------------------------------------------------
## Student Assessment Analytics — CSV Workflow (Base R only)
## ------------------------------------------------------------

## 0) File names
input_csv          <- "students_input.csv"
students_rank_csv  <- "students_by_rank.csv"
assess_avg_csv     <- "assessment_wise_averages.csv"
spec_avg_csv       <- "specialization_wise_averages.csv"

## 1) Create column vectors from the given table
RegNo <- c("24BCE1001","24BCE1002","24BCE1003","24BCE1004","24BCE1005",
           "24BCE1006","24BCE1007","24BCE1008","24BCE1009","24BCE1010")

Name <- c("Aadesh Kumar","Bhavya Reddy","Charan Iyer","Divya Sharma","Esha Nair",
          "Farhan Khan","Gayathri Raj","Harish Kumar","Ishita Menon","Jai Verma")

Programme <- rep("B.Tech", 10)

Specialization <- c("CSE","AI","DS","IT","CSE","ECE","Cyber","AI","DS","IT")

Assess1 <- c(18,15,20,14,20,12,17,16,19,18)
Assess2 <- c(17,16,19,15,20,14,18,17,18,17)
Assess3 <- c(19,14,18,15,19,13,17,16,19,16)
Assess4 <- c(18,18,20,16,20,16,19,15,18,19)

## 2) Create data frame
students <- data.frame(
  RegNo, Name, Programme, Specialization,
  Assess1, Assess2, Assess3, Assess4,
  stringsAsFactors = FALSE
)

## Show structure and preview
str(students)
head(students)

## 3) Write input CSV
write.csv(students, file = input_csv, row.names = FALSE, na = "")
cat("Input CSV written:", input_csv, "\n")

## 4) Read CSV for analytics
students_in <- read.csv(input_csv, stringsAsFactors = FALSE)

## Validate columns
assess_cols <- c("Assess1","Assess2","Assess3","Assess4")
required_cols <- c("RegNo","Name","Programme","Specialization", assess_cols)

missing <- setdiff(required_cols, names(students_in))
if(length(missing) > 0){
  stop("Missing columns: ", paste(missing, collapse=", "))
}

## Ensure numeric assessment columns
for(col in assess_cols){
  if(!is.numeric(students_in[[col]])){
    students_in[[col]] <- as.numeric(students_in[[col]])
  }
}

## 5) Per student analytics
students_in$Total <- rowSums(students_in[, assess_cols], na.rm = TRUE)
students_in$Average <- students_in$Total / length(assess_cols)
students_in$Rank <- rank(-students_in$Total, ties.method = "min")

## Sort by Rank then RegNo
students_by_rank <- students_in[order(students_in$Rank, students_in$RegNo),]

## Save ranked results
write.csv(students_by_rank, file = students_rank_csv, row.names = FALSE, na = "")
cat("Students ranked CSV:", students_rank_csv, "\n")

## 6) Assessment-wise averages
assessment_avg <- colMeans(students_in[, assess_cols], na.rm = TRUE)

assessment_avg_df <- data.frame(
  Assessment = names(assessment_avg),
  Average = as.numeric(assessment_avg),
  stringsAsFactors = FALSE
)

write.csv(assessment_avg_df, file = assess_avg_csv, row.names = FALSE, na = "")
cat("Assessment-wise averages CSV:", assess_avg_csv, "\n")

## 7) Specialization-wise averages
spec_avg <- aggregate(
  students_in[, assess_cols],
  by = list(Specialization = students_in$Specialization),
  FUN = function(x) mean(x, na.rm = TRUE)
)

## Overall specialization average
spec_avg$Overall_Average <- rowMeans(spec_avg[, assess_cols], na.rm = TRUE)

## Sort by overall average descending
spec_avg <- spec_avg[order(-spec_avg$Overall_Average, spec_avg$Specialization),]

write.csv(spec_avg, file = spec_avg_csv, row.names = FALSE, na = "")
cat("Specialization-wise averages CSV:", spec_avg_csv, "\n")
