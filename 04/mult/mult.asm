// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

    @R2
    M = 0   //set R[2] = 0
    @i
    M = 0   //set i = 0 for the next loop

(LOOP)
    @R1
    D = M
    @i
    D = M - D   //i - R[1]
    @END
    D;JGE   //if i >= R[1] go to END

    @R0
    D = M
    @R2
    M = M + D   //R[0] + R[2]

    @i
    M = M + 1   //i++

    @LOOP
    0;JMP

(END)
    @END
    0;JMP