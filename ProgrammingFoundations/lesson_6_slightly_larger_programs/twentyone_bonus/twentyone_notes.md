## Twenty One Notes

1. Initialize deck
2. Deal cards to player and dealer
	1. Dealer gets two cards
	2. Player gets two cards
	3. One dealer card visible one card not visible
3. Player turn: hit or stay
 	1. Player may either hit or stay
 	2. If player hit
 		1. Deal card to player
 		2. Calculate new player score
 		3. Check if player busts
 		4. If player busts, set the bust flag
 		5. Dispaly dealer and player hand, along with a bust
 		message if player busts
 	3. If player stay
 		1. Display dealer and player cards
 		2. Along with a message indicating player stays 
	4. Check the bust flag, if busted exit the player turn loop
	and move to the next round of play
4. Dealer turn: hit or stay
	1. Draw a third card and then display all cards   
	2. Strict rule repeat hit until total >= 17
	3. If dealer bust, player wins add to player score
5. Compare cards and declare winner
	1. If a tie, add nothing to the score
	2. Otherwise add 1 to greater score of the two 