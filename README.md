INFORMATICS 2C COMPUTER SYSTEMS - LAB 1

  MIPS PROGRAMMING AND THE MARS IDE

    The objective of this lab is to introduce you to the basics of MIPS assembly programming using MARS, an IDE (Integrated Development     Environment) for MIPS assembly language programming.

  BACKGROUND MATERIAL ON MIPS

    Beyond the lecture slides and notes, you should refer to the appendix of the Patterson and Hennessy course textbook on MIPS. This is     Appendix A in 2/e, 3/e, and 5/e, and Appendix B in 4/e. Appendix A from 3/e is also available online. Sections 1-6 of this appendix     provide useful background material, while Sections 10 and 9 (the part on System Calls) serve as a valuable reference on the MIPS         assembly language assembler syntax.

    Note that various parts of the appendix, particularly Section 9, refer to the SPIM software simulator for MIPS. MARS is designed as     an extension of SPIM, so all discussions of SPIM are fully relevant to MARS.

  INSTALLING AND RUNNING MARS

    MARS is a Java application and therefore should run on any platform supporting Java. The latest version (currently V4.5) can be         downloaded from the Download page on on the MARS web-site. This version of MARS requires Java 1.5 or later.

    The download page gives various options for running the downloaded JAR (Java ARchive) file. Option A does not work on DICE machines.     Option B does. While the descriptions of Options B and C refer to a DOS shell, they work equally well when using a Unix-flavour         shell on Linux or Mac OS X.

  ALTERNATIVE MIPS SIMULATORS

    The SPIM simulators referred to in the book are installed on all DICE computers and are available as the command-line commands spim     and xspim. MARS is a much nicer tool, and its use is strongly encouraged for this class.

  WHAT TO DO

    Download the file hello.s. Start-up MARS and open the file using the Open command on the File menu. Read it carefully and try to         understand the basic structure of a MIPS assembly program.

    All that hello.s does is to print "hello world!" and then exit. The program uses MIPS assembly pseudo-instruction la $a0, msg, which     loads register $a0 with the memory address where msg is held. Printing (and exiting) is done by the special instruction syscall. For     now, think of syscall as providing a mechanism for making calls to special procedures built-in to MARS. You will get a more complete     picture when exceptions and interrupts are discussed later in this course.

    The exact task that syscall performs depends on the value stored into register $v0. To find out what other syscall options are           available, see page A-44 of Appendix A of the Patterson and Hennessy book (3rd Ed). . We will be using some of these for                 input/output. We will not be using the syscall options provided in MARS that are not also provided in SPIM.

    Assemble the program (translate the assembly language program into machine code) by selecting the Assemble option from the Run menu.     The Run menu also shows the icon for the Assemble button, and alternatively you can assemble a program simply by clicking this           Assemble button in the top row of buttons.

    Note how the Text Segment pane shows both the pseudo instructions from the assembly language code and the raw MIPS instructions.         Also tick the ASCII check-box in the Data Segment pane to see the Hello World\n string stored in memory.

    Step through the program one instruction at a time using the Step button, observing the changes to the registers and the currently       executed instruction. The program output appears in the Run I/O pane at the foot of the MARS window.

    Use the hello.s program to familiarise yourselves with the buttons and menus available in MARS.

    Open hexOut.s in MARS and try to understand what it does. The first two syscalls prompt the user for a number and get the number         from the keyboard. Then a message is printed. The remaining of the program extracts each hexadecimal digit from the provided number,     converts it into the corresponding ASCII character and prints it (using yet another syscall). This is done eight times, as there are     8 hex digits in a 32-bit word.

    Assemble and step through the program to find out exactly what each instruction is doing. Try setting a breakpoint at the at the         instruction labelled loop, so that you can let the program run through quickly the part where it asks for input and focus on what       happens in the loop. A breakpoint is set at an instruction by checking the corresponding tickbox in the leftmost Bkpt column of the     Text Segment pane.

    You can now practise writing your own assembly programs. Here are some suggestions:
    
    Based on hexOut.s write a program, binOut.s that asks for a number and prints it in binary format, digit by digit.
    Modify hexOut.s so that when a negative number is entered, it is printed as '-', followed by the two's complement of the number (in     hex again).
    
    Modify hexOut.s so that leading zeros are not printed.
