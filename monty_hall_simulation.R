#monty hall problem simulation

sim <- function(switch=0){
  winning_door = sample(1:3, 1)
  picked_door = sample(1:3, 1)
  if (winning_door == picked_door){
    monty_shows = sample(setdiff(1:3, c(winning_door)), 1)
  }
  else {
    monty_shows = setdiff(1:3, c(winning_door, picked_door))[1]
  }
  if (switch){
    picked_door = setdiff(1:3, c(monty_shows, picked_door))
  }
  return(picked_door == winning_door)
}

n_sims = 50000
not_switching = sapply(rep(0, n_sims), sim)
p_not_switching = mean(not_switching)
cat("Win probability when not switching doors", p_not_switching)

switching = sapply(rep(1, n_sims), sim)
p_switching = mean(switching)
cat("Win probability when switching doors", p_switching)
