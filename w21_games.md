# Atari Breakout

1. What is the purpose of the game?
The purpose is to hit every block on screen with the ball while keeping the ball moving on screen by bouncing off the platform at the bottom. 
2. What element(s) are controlled by the player?
The platform at the bottom is controlled by the player.
3. What element(s) are controlled by the computer?
The setup of the screen, the reactions of the blocks and ball, and the ball movement are controlled by the computer.
4. How does the player control their element?
They control the platform by moving the mouse, and the platform moves horizontally along with it.
5. How do the non-player controlled elements behave (movement, positions, randomness, etc)?
The blocks disappear when the ball hits it, the ball bounces back every time it hits a block or the platform, and the ball also stops/dies when it hits the bottom edge of the screen (it bounces when it hits the top or sides). The setup is the blocks on the top portion of the screen, the platform on the bottom, the ball spawning on the platform.
6. If you were to program this, what classes would you write?
I would write the ball class, block class, and could write the platform class but not sure if it is necessary since there's only one and it stays the same, just moves horizontally.
7. If you were to program this, would you use an array for some parts? What kind of array? What would you be storing in it?
Yes I would use an array to make the blocks since there are many and they disappear individually. I could also use an array for the ball if I am doing multiple on screen, like if there is a powerup. I'd use 2d array for the blocks and 1d for balls. I'd be storing the blocks and balls.
