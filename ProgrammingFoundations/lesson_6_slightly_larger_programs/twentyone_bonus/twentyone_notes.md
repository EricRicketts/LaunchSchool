## Twenty One Notes

1. Game Loop
	1. Initialize and shuffle deck
	2. Initialize game tally
	3. Initialize continue to play variable
	4. Initialize player response variable
	5. Round Loop
		1. Dealer gets two cards
		2. Player gets two cards
		3. Display one dealer card visible one card not visible
		4. Display both player cards
		5. Player Loop
 			1. Ask the player to (h)it, (s)tay, or (q)uit 
 			2. If player hit
 				1. Deal card to player
 				2. Calculate new player score
 				3. Check if player busts
 				4. If player busts, set :player_busts
 				5. Send a message if the player busts, indicating the dealer wins
 			3. If player stay
 				1. set :player_stays
 				2. store the player_score
 			4. If player quits, set :quit
 			5. Exit player loop upon :quit, :stay, or :player_busts
 		6. Dealer Loop
 			1. Bypass dealer loop if :player_bust || :quit
 			2. Display all dealer cards
 			3. Display all player cards
 			4. If dealer score < 17, add card to dealer's hand
 			5. Calculate dealer score
 				1. If score > 21 set :dealer_busts
 				2. If score >= 17 and < 21 set :dealer_stay
 			6. Exit dealer loop upon :dealer_busts or :dealer_stay
		7. If :quit then exit the Round Loop
		8. Determine Round Winner
			1. If :player_busts, dealer wins
			2. If :dealer_busts, player wins
			3. If dealer_score > player_score, dealer wins
			4. If player_score > dealer_score, player wins
			5. Otherwise a tie
		9. Update the game tally
		10. Check the round results
			1. If player has 5 wins he is the winner
			2. If dealer has 5 wins he is the winner
			4. If neither has 5 wins then there is no winner
		11. If no winner then play another round
		12. If there is a winner
			1. Display the game winner
			2. Ask the player if he wants to play another game
			3. If yes, then set :play_again
			4. If no, then set :quit
