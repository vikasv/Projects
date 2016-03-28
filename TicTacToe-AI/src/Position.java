
import java.util.LinkedList;


/**
 * @author Vikas Vellanki
 * Tic Tac Toe - AI Player
 * 
 * Class - Position
 */

public class Position {
	//A char array which represents the state of the game. 
	//The 3x3 array is taken as a 1-D char Array
	private char[] board;
	//A char value to represent the current player. ('O'/'X')
	private char turn;
	
	public char[] getBoard() {
		return board;
	}

	public void setBoard(char[] board) {
		this.board = board;
	}

	public char getTurn() {
		return turn;
	}

	public void setTurn(char turn) {
		this.turn = turn;
	}
	
	private final static int MAX_SCORE=100;
	
	/*Constructors*/
	//Initializing the game, First player - 'X', Empty board
	public Position()
	{
		this.board="         ".toCharArray();
		this.turn='X';
	}
	
	//Initializing the game with the given board and turn
	public Position(char[] board, char turn)
	{
		this.board=board;
		this.turn=turn;
	}
	public Position(String str, char turn)
	{
		this.board=str.toCharArray();
		this.turn=turn;
	}
	public Position(String str)
	{
		this.board=str.toCharArray();
		this.turn='X';
	}
	
	
	/*Helper Methods*/
	/**
	 * Function to execute a move and the index i. 
	 * Calculates the next player and returns the new Position of the board
	 *
	 * @return New Position after executing the move at i
	 */
	public Position move(int i)
	{
		char[] nextBoard=board.clone();
		nextBoard[i]=turn;
		return new Position(nextBoard, turn=='X' ? 'O' : 'X');
	}
	
	
	/**
	 * Returns all the possible moves as an Integer array at any given time
	 * Checks for the empty space in the 'board' string
	 *
	 * @return Integer array with all the indexes which has an empty char
	 */
	public Integer[] possibleMoves()
	{
		LinkedList<Integer> list=new LinkedList<Integer>();
		for(int i=0;i<board.length;i++){
			if(board[i]==' ')
				list.add(i);
		}
		Integer[] arr=new Integer[list.size()];
		list.toArray(arr);
		return arr;
	}

	/**
	 * A function to determine if the current state of the game has a winner.
	 * Checks all possible winning lines(straight, diagonal)
	 *
	 * @param Current players turn
	 * @return True if the game has a winner
	 */
	public boolean win(char turn)
	{
		for(int i=0;i<3;i++)
		{
			if(winHelper(turn,i*3,1) || winHelper(turn,i,3))
				return true;
		}
		
		if(winHelper(turn,0,4) || winHelper(turn,2,2))
			return true;
		
		return false;
	}
	
	/**
	 * A helper method to check if a given line has all same values - 'X' or 'O'
	 *
	 * @param Current players turn, start, step
	 * @return True if the board has same values in the given line
	 */
	public boolean winHelper(char turn, int start, int step)
	{
		for(int i=0;i<3;i++){
			if(board[start+step*i]!=turn)
				return false;
		}
		return true;
	}

	/**
	 * Runs the Minimax algorithm recursively to calculate the utility scores of all the possible moves
	 *
	 * @return Utility score from the Minimax algorithm for the bext move
	 */
	public int miniMax()
	{
		if(win('X'))
			return MAX_SCORE;
		if(win('O'))
			return -MAX_SCORE;
		if(possibleMoves().length==0)
			return 0;
		Integer mmVal=null;
		for (int i : possibleMoves()) {
			Integer val=move(i).miniMax();
			if(mmVal==null || turn=='X' && mmVal < val || turn=='O' && mmVal > val)
				mmVal=val;
		}
		
		if(turn=='X')
			return mmVal-1;
		else
			return mmVal+1;
	
	}
	
	/**
	 * Returns the best move at the given point of time.
	 * Checks all the possible at that time and 
	 * calculates which move maximizes the score using MiniMax algorithm
	 * 
	 * @return Utility score from the Minimax algorithm for the bext move
	 */
	public int bestMove()
	{
		Integer mmVal=null;
		int best=-1;
		for (int i : possibleMoves()) {
			Integer val=move(i).miniMax();
			if(mmVal==null || turn=='X' && mmVal < val || turn=='O' && mmVal > val)
			{
				mmVal=val;
				best=i;
			}
		}
		return best;	
	}	
	
	/**
	 * Returns true if the game has ended
	 * Checks for the possible moves left or winning player
	 * 
	 * @return Utility score from the Minimax algorithm for the bext move
	 */
	public boolean gameEnd()
	{
		return (possibleMoves().length==0 || win('X')|| win('O'));
	}
}
