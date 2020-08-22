// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

    @SCREEN
    D = A
    @KBD
    D = A - D
    @LENGTH
    M = D   //Initialization: register the length between start and end of screen address
    @i
    M = 0   // i = 0, i is the index of SCREEN buffer array

(LOOP)
    @KBD
    D = M
    @BLACK
    D;JGT   //if the keyboard is not pressed, go to BLACK
    @WHITE  //else go to WHITE
    0;JMP

(BLACK)
    @LENGTH
    D = M
    @i
    D = D - M   //LENGTH - i
    @LOOP
    D;JLT

    //start blackening the screen
    @SCREEN
    D = A
    @i
    D = D + M //Addr(i + STARTADDR)
    A = D   //change to RAM[A]
    M = -1

    @i
    M = M + 1   //i++

    @LOOP
    0;JMP

(WHITE)
    @i
    D = M   
    @LOOP
    D;JLT   //if i < 0， goto LOOP

    //start cleaning the screen
    @SCREEN
    D = A
    @i
    D = D + M //Addr(i + STARTADDR)
    A = D   //change to RAM[A],let M represent RAM[A]
    M = 0

    @i
    M = M - 1   //i--

    @LOOP
    0;JMP