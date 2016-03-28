
import java.awt.Dimension;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.SwingUtilities;

/**
 * @author Vikas Vellanki
 * Tic Tac Toe - AI Player
 * 
 * Class - GameBoard
 */

public class GameBoard {
	Position pos=new Position();
	public static void main(String[] args) {
		
		SwingUtilities.invokeLater(new Runnable() {
			public void run() {
				JFrame frame=new JFrame("TICTAC-AI");
				frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
				frame.setLayout(new GridLayout(3,3));
				final GameBoard gb=new GameBoard();
				final JButton[] buttons=new JButton[9];
				for(int i=0;i<9;i++){
					final int index=i;
					final JButton button=new JButton();
					buttons[i]=button;
					button.setPreferredSize(new Dimension(90,90));
					button.setFont(new Font(null,Font.PLAIN,60));
					button.setOpaque(true);
					
					button.addMouseListener(new MouseListener() {
						
						@Override
						public void mouseReleased(MouseEvent e) {}
						
						@Override
						public void mousePressed(MouseEvent e) {}
						
						@Override
						public void mouseExited(MouseEvent e) {}
						
						@Override
						public void mouseEntered(MouseEvent e) {}
						
						@Override
						/**
						 * On click of a button, Users symbol is displayed and Based on that move,
						 * all possible moves for the AI player are determined and best one is taken
						 *
						 * @param Mouse Event e
						 */
						public void mouseClicked(MouseEvent e) {
							button.setText(""+ gb.pos.getTurn());
							gb.move(index);
							if(!gb.pos.gameEnd())
							{
								int best = gb.pos.bestMove();
								buttons[best].setText(""+gb.pos.getTurn());
								gb.move(best);
							}
							
							if(gb.pos.gameEnd()){
								String str="";
								if(gb.pos.win('X'))
									str="You Won";
								else if(gb.pos.win('O'))
									str="Computer Won! Try Again!";	
								else
									str="Its a Draw! Try Again!";
								JOptionPane.showMessageDialog(null, str);
							}
							
						}
					});
					frame.add(button);
				}
				frame.pack();
				frame.setVisible(true);
			}
		});
	}
	/**
	 * Executes the move at index x and updates the Position object
	 *
	 * @param index x where the move is to be executed
	 */
	protected void move (int x)
	{
		pos=pos.move(x);
	}
}
