# x86-Number-Guessing-Game
This program is a simple number guessing game written in x86 Assembly for a DOS environment. The game involves two users: User 1 and User 2. The main objective of the game is for User 2 to guess a secret two-digit number chosen by User 1.

At the start of the game, User 1 is prompted to input a secret number. The number is split into two parts: the tens digit and the units digit, and the program stores these as individual values. The program then combines these two digits to form the complete secret number.

Once the secret number is entered, User 2 begins the guessing process. The program repeatedly prompts User 2 to input their guess, which is also split into tens and units digits, similar to how User 1 entered their number. The program calculates the complete guessed number by combining the digits.

After each guess, the program compares the guessed number to the secret number. If the guessed number is too high or too low, the program provides feedback to User 2 with messages such as “Too big!” or “Too small!” This feedback helps User 2 adjust their next guess. The game loop continues until User 2 successfully guesses the correct number.

Once the correct guess is made, the game ends, and the program displays the message “Game over, User 2 wins!” signaling that User 2 has won the game. The program then exits.

This game demonstrates basic principles of low-level programming using x86 Assembly. The program utilizes DOS interrupts for input and output operations, performing simple arithmetic to calculate and compare the numbers. It highlights how Assembly language can be used to manage user interactions and implement control flow in a minimalistic, efficient manner.
