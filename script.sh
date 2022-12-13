empty="-"
player1="X"
player2="O"

echo "Welcome to the tic tac toe game!"

declare -a board
board=( $empty $empty $empty $empty $empty $empty $empty $empty $empty )

echo "   ${board[0]} | ${board[1]} | ${board[2]}"
echo "   ${board[3]} | ${board[4]} | ${board[5]}"
echo "   ${board[6]} | ${board[7]} | ${board[8]}"
echo

checkWin(){
	if [ ${board[0]} == $1 ] && [ ${board[1]} == $1 ] && [ ${board[2]} == $1 ]; then
		echo "$1 wins! Congratulations!"
		exit 0
	elif [ ${board[3]} == $1 ] && [ ${board[4]} == $1 ] && [ ${board[5]} == $1 ]; then
		echo "$1 wins! Congratulations!"
		exit 0
	elif [ ${board[6]} == $1 ] && [ ${board[7]} == $1 ] && [ ${board[8]} == $1 ]; then
		echo "$1 wins! Congratulations!"
		exit 0
	
	elif [ ${board[0]} == $1 ] && [ ${board[3]} == $1 ] && [ ${board[6]} == $1 ]; then
		echo "$1 wins! Congratulations!"
		exit 0
	elif [ ${board[1]} == $1 ] && [ ${board[4]} == $1 ] && [ ${board[7]} == $1 ]; then
		echo "$1 wins! Congratulations!"
		exit 0
	elif [ ${board[2]} == $1 ] && [ ${board[5]} == $1 ] && [ ${board[8]} == $1 ]; then
		echo "$1 wins! Congratulations!"
		exit 0
	
	elif [ ${board[0]} == $1 ] && [ ${board[4]} == $1 ] && [ ${board[8]} == $1 ]; then
		echo "$1 wins! Congratulations!"
		exit 0
	elif [ ${board[2]} == $1 ] && [ ${board[4]} == $1 ] && [ ${board[6]} == $1 ]; then
		echo "$1 wins! Congratulations!"
		exit 0
	fi
}

players=("$player1" "$player2")
for (( i=0; i<9; i++ )); do
	player=${players[$i%2]}
	echo "Player $player turn"
	
	read -p "Choose a field (1-9): " field
	if [ ${board[$field-1]} == $empty ]; then
		board[$field-1]=$player
	else
		echo "This field is already taken! Try again."
		i=$((i-1))
		continue
	fi
	
	echo "   ${board[0]} | ${board[1]} | ${board[2]}"
	echo "   ${board[3]} | ${board[4]} | ${board[5]}"
	echo "   ${board[6]} | ${board[7]} | ${board[8]}"
	echo
	
	checkWin $player
done

echo "It's a draw!"