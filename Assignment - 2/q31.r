teams <- list() 
 
add_team <- function(team, scores) { 
  teams[[team]] <<- scores 
} 
 
remove_team <- function(team) { 
  if (!is.null(teams[[team]])) { 
    teams[[team]] <<- NULL 
  } 
} 
 
view_teams <- function() { 
  print(teams) 
} 
 
average_scores <- function() { 
  sapply(teams, mean) 
} 
 
rank_teams <- function() { 
  averages <- average_scores() 
  sort(averages, decreasing = TRUE) 
} 
 
add_team("Team A", c(90, 85, 88)) 
add_team("Team B", c(78, 82, 79)) 
add_team("Team C", c(88, 92, 90)) 
 
view_teams() 
remove_team("Team A") 
view_teams() 
avg <- average_scores() 
teams <- list() 
 
add_team <- function(team, scores) { 
  teams[[team]] <<- scores 
} 
 
remove_team <- function(team) { 
  if (!is.null(teams[[team]])) { 
    teams[[team]] <<- NULL 
  } 
} 
 
view_teams <- function() { 
  print(teams) 
} 
 
average_scores <- function() { 
  sapply(teams, mean) 
} 
 
rank_teams <- function() { 
  averages <- average_scores() 
  sort(averages, decreasing = TRUE) 
} 
 
add_team("Team A", c(90, 85, 88)) 
add_team("Team B", c(78, 82, 79)) 
add_team("Team C", c(88, 92, 90)) 
 
view_teams() 
remove_team("Team A") 
view_teams() 
avg <- average_scores() 
ranking <- rank_teams() 
 
print(avg) 
print(ranking)