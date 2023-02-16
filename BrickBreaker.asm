.model small
.stack 100h
.data

    ball_x_coordinate dw 100
    ball_y_coordinate dw 120

    x_org dw 100
    y_org dw 120

    colorball db 0Eh
    colorbg db 10010100b
    sizee dw 4h

    speed_x dw 3
    speed_y dw 3

    striker_speed dw 10

    striker_x dw 160
    striker_y dw 185

    window_right dw 260
    window_left  dw 0

    height_of_striker dw 8h
    width_of_striker dw 35h
    color_of_striker db 00h





    temp db ?


    height_of_box dw 15h
    width_of_box dw 30h

    box1_x_cor dw 20
    box1_y_cor dw 30
    box1_color db 1h
    box_1_temp db 0

    box2_x_cor dw 80
    box2_y_cor dw 30
    box2_color db 2h
    box_2_temp db 0

    box3_x_cor dw 140
    box3_y_cor dw 30
    box3_color db 3h
    box_3_temp db 0

    box4_x_cor dw 200
    box4_y_cor dw 30
    box4_color db 4h
    box_4_temp db 0

    box5_x_cor dw 260
    box5_y_cor dw 30
    box5_color db 5h
    box_5_temp db 0


    box6_x_cor dw 20
    box6_y_cor dw 60
    box6_color db 6h
    box_6_temp db 0

    box7_x_cor dw 80
    box7_y_cor dw 60
    box7_color db 7h
    box_7_temp db 0

    box8_x_cor dw 140
    box8_y_cor dw 60
    box8_color db 8h
    box_8_temp db 0


    box9_x_cor dw 200
    box9_y_cor dw 60
    box9_color db 9h
    box_9_temp db 0


    box10_x_cor dw 260
    box10_y_cor dw 60
    box10_color db 0Ah
    box_10_temp db 0



    box11_x_cor dw 20
    box11_y_cor dw 90
    box11_color db 0Bh
    box_11_temp db 0
    box_11_temp2 db 0

    box12_x_cor dw 80
    box12_y_cor dw 90
    box12_color db 0Ch
    box_12_temp db 0
    box_12_temp2 db 0

    box13_x_cor dw 140
    box13_y_cor dw 90
    box13_color db 0Dh
    box_13_temp db 0
    box_13_temp2 db 0

    box14_x_cor dw 200
    box14_y_cor dw 90
    box14_color db 0Eh
    box_14_temp db 0
    box_14_temp2 db 0

    box15_x_cor dw 260
    box15_y_cor dw 90
    box15_color db 0Fh
    box_15_temp db 0
    box_15_temp2 db 0

    p1 db "Points: $"
    p2 db "Lives: $"

    game_over_str db "GAME OVER", '$'

	finalscore_str db "YOUR FINAL SCORE: ", '$'

	pressenter_str db "PRESS ENTER TO RETURN", '$'

    win_str db "YOU WON", '$'

    score db ?

    life db 3

    volume dw 700

    box_temp db ?

    level_num db 1

    level_temp db ?

    level_temp2 db ?

    ;MENU AND TITLE PAGE DECLARATIONS

    Xaxis dw ?

	Yaxis dw ?
	
    Yvar dw ?
	
    str1 db "BRICKBREAKER",'$'
	
    name1 db "ENTER YOUR NAME: ", '$'
	
    inputname db 100 dup('?')

	tempbuffer db '?'
	
    color db 0
	
    menu1 db "NEW GAME", '$'
	
    menu2 db "INSTRUCTIONS", '$'
	
    menu3 db "CONTINUE", '$'
	
    menu4 db "LEADERBOARDS", '$'
	
    menu5 db "EXIT", '$'
	
    welcome db "WELCOME TO BRICK BREAKER!", '$'
	
    instruction1 db "-> HIT THE BRICKS TO EARN POINTS.", '$'
	
    instruction2 db "-> LIVES ARE REPRESENTED BY HEARTS.", '$'
	
    instruction3 db "-> A PLAYER HAS 3 LIVES.", '$'
	
    instruction4 db "-> USE THE SLIDER TO MOVE THE BALL.", '$'
	
    instruction5 db "-> KEEP THE BALL ABOVE THE SLIDER TO", '$'
	
    instruction6 db "NOT LOOSE ANY LIVES.", '$'
	
    instruction7 db "---PRESS SPACE FOR THE MAIN MENU---", '$'
	
    highscores db "SCORES", '$'
	
    goodbye1 db "THANK YOU FOR PLAYING BRICK BREAKER", '$'
	
    goodbye2 db "GOOD BYE! :)", '$'
	
    FileN db "TESTFILE.txt"
    
    FIleH dw 0

	delay db 0


.code


TitlePage macro

		    MOV AH, 06h
			    MOV AL, 12 ;ScrollLine (i.e from where the half color splits)
			    MOV CX, 0
			    MOV DH, 80
			    MOV DL, 80
			    MOV BH, 12h ;this is color
			    INT 10h

		    call Border

		    ;brick									;printing the word brick
		    mov ah,02h
		    mov bh,0
		    mov dh,37 ;ROW
		    mov dl,5 ;COL
		    int 10h

		    mov ah,0Ah
		    mov bl,14 ;color
		    mov cx,1
		    mov al,str1[0]
		    int 10h

		    mov ah,02h
		    mov bh,0
		    mov dh,37
		    mov dl,6
		    int 10h

		    mov ah,0Ah
		    mov bl,14
		    mov cx,1
		    mov al,str1[1]
		    int 10h

		    mov ah,02h
		    mov bh,0
		    mov dh,37
		    mov dl,7
		    int 10h

		    mov ah,0Ah
		    mov bl,14
		    mov cx,1
		    mov al,str1[2]
		    int 10h

		    mov ah,02h
		    mov bh,0
		    mov dh,37
		    mov dl,8
		    int 10h

		    mov ah,0Ah
		    mov bl,14
		    mov cx,1
		    mov al,str1[3]
		    int 10h
	
		    mov ah,02h
		    mov bh,0
		    mov dh,37
		    mov dl,9
		    int 10h

		    mov ah,0Ah
		    mov bl,14
		    mov cx,1
		    mov al,str1[4]
		    int 10h

		    ;breaker									;printing the word breaker

		    mov ah,02h
		    mov bh,0
		    mov dh,39 ;ROW
		    mov dl,8 ;COL
		    int 10h

		    mov ah,0Ah
		    mov bl,6 ;color
		    mov cx,1
		    mov al,str1[5]
		    int 10h

		    mov ah,02h
		    mov bh,0
		    mov dh,39 ;ROW
		    mov dl,9 ;COL
		    int 10h

		    mov ah,0Ah
		    mov bl,6 ;color
		    mov cx,1
		    mov al,str1[6]
		    int 10h

		    mov ah,02h
		    mov bh,0
		    mov dh,39 ;ROW
		    mov dl,10 ;COL
		    int 10h

		    mov ah,0Ah
		    mov bl,6 ;color
		    mov cx,1
		    mov al,str1[7]
		    int 10h

		    mov ah,02h
		    mov bh,0
		    mov dh,39 ;ROW
		    mov dl,11 ;COL
		    int 10h

		    mov ah,0Ah
		    mov bl,6 ;color
		    mov cx,1
		    mov al,str1[8]
		    int 10h

		    mov ah,02h
		    mov bh,0
		    mov dh,39 ;ROW
		    mov dl,12 ;COL
		    int 10h

		    mov ah,0Ah
		    mov bl,6 ;color
		    mov cx,1
		    mov al,str1[9]
		    int 10h

		    mov ah,02h
		    mov bh,0
		    mov dh,39 ;ROW
		    mov dl,13 ;COL
		    int 10h

		    mov ah,0Ah
		    mov bl,6 ;color
		    mov cx,1
		    mov al,str1[10]
		    int 10h

		    mov ah,02h
		    mov bh,0
		    mov dh,39 ;ROW
		    mov dl,14 ;COL
		    int 10h

		    mov ah,0Ah
		    mov bl,6 ;color
		    mov cx,1
		    mov al,str1[11]
		    int 10h

		    ;ENTER									;printing the word enter

		    mov ah,02h
		    mov bh,0
		    mov dh,45 ;ROW
		    mov dl,0 ;COL
		    int 10h

		    mov ah,0Ah
		    mov bl,4 ;color
		    mov cx,1
		    mov al,name1[0]
		    int 10h

		    mov ah,02h
		    mov bh,0
		    mov dh,45 ;ROW
		    mov dl,1 ;COL
		    int 10h

		    mov ah,0Ah
		    mov bl,4 ;color
		    mov cx,1
		    mov al,name1[1]
		    int 10h

		    mov ah,02h
		    mov bh,0
		    mov dh,45 ;ROW
		    mov dl,2 ;COL
		    int 10h

		    mov ah,0Ah
		    mov bl,4 ;color
		    mov cx,1
		    mov al,name1[2]
		    int 10h

		    mov ah,02h
		    mov bh,0
		    mov dh,45 ;ROW
		    mov dl,3 ;COL
		    int 10h

		    mov ah,0Ah
		    mov bl,4 ;color
		    mov cx,1
		    mov al,name1[3]
		    int 10h

		    mov ah,02h
		    mov bh,0
		    mov dh,45 ;ROW
		    mov dl,4 ;COL
		    int 10h

		    mov ah,0Ah
		    mov bl,4 ;color
		    mov cx,1
		    mov al,name1[4]
		    int 10h

		    ;YOUR									;printing the word your

		    mov ah,02h
		    mov bh,0
		    mov dh,45 ;ROW
		    mov dl,5 ;COL
		    int 10h

		    mov ah,0Ah
		    mov bl,4 ;color
		    mov cx,1
		    mov al,name1[5]
		    int 10h

		    mov ah,02h
		    mov bh,0
		    mov dh,45 ;ROW
		    mov dl,6 ;COL
		    int 10h

		    mov ah,0Ah
		    mov bl,4 ;color
		    mov cx,1
		    mov al,name1[6]
		    int 10h

		    mov ah,02h
		    mov bh,0
		    mov dh,45 ;ROW
		    mov dl,7 ;COL
		    int 10h

		    mov ah,0Ah
		    mov bl,4 ;color
		    mov cx,1
		    mov al,name1[7]
		    int 10h

		    mov ah,02h
		    mov bh,0
		    mov dh,45 ;ROW
		    mov dl,8 ;COL
		    int 10h

		    mov ah,0Ah
		    mov bl,4 ;color
		    mov cx,1
		    mov al,name1[8]
		    int 10h

		    mov ah,02h
		    mov bh,0
		    mov dh,45 ;ROW
		    mov dl,9 ;COL
		    int 10h

		    mov ah,0Ah
		    mov bl,4 ;color
		    mov cx,1
		    mov al,name1[9]
		    int 10h

		    ;NAME									;printing the word name

		    mov ah,02h
		    mov bh,0
		    mov dh,45 ;ROW
		    mov dl,10 ;COL
		    int 10h

		    mov ah,0Ah
		    mov bl,4 ;color
		    mov cx,1
		    mov al,name1[10]
		    int 10h

		    mov ah,02h
		    mov bh,0
		    mov dh,45 ;ROW
		    mov dl,11 ;COL
		    int 10h

		    mov ah,0Ah
		    mov bl,4 ;color
		    mov cx,1
		    mov al,name1[11]
		    int 10h

		    mov ah,02h
		    mov bh,0
		    mov dh,45 ;ROW
		    mov dl,12 ;COL
		    int 10h

		    mov ah,0Ah
		    mov bl,4 ;color
		    mov cx,1
		    mov al,name1[12]
		    int 10h

		    mov ah,02h
		    mov bh,0
		    mov dh,45 ;ROW
		    mov dl,13 ;COL
		    int 10h

		    mov ah,0Ah
		    mov bl,4 ;color
		    mov cx,1
		    mov al,name1[13]
		    int 10h

		    mov ah,02h
		    mov bh,0
		    mov dh,45 ;ROW
		    mov dl,14 ;COL
		    int 10h

		    mov ah,0Ah
		    mov bl,4 ;color
		    mov cx,1
		    mov al,name1[14]
		    int 10h

		    mov ah,02h
		    mov bh,0
		    mov dh,45 ;ROW
		    mov dl,15 ;COL
		    int 10h

		    mov ah,0Ah
		    mov bl,4 ;color
		    mov cx,1
		    mov al,name1[15]
		    int 10h

		    mov ah,02h
		    mov bh,0
		    mov dh,45 ;ROW
		    mov dl,16 ;COL
		    int 10h

		    mov ah,0Ah
		    mov bl,4 ;color
		    mov cx,1
		    mov al,name1[16]
		    int 10h



		    mov si,offset inputname								;Entering name and displaying on screen

		    .while cx != 1000			;Big While loop

			    mov ah, 0				;interupt for key press, a.k.a which one is pressed
    		    int 16h

			    .if al == 13
				    jmp getoutt
			    .endif

			    mov [si], al            ;store the key pressed

			    mov dl,al				;For outputting key pressed on screen
			    mov ah,02h
			    int 21h
			    inc si

		     .endw
	
		     getoutt:

		endm

        MainMenu macro

			repeatmenu:												;for checking when the user presses space, then return them back to the menu

																	;for clearing the screen smoothly
				mov bx,0
				mov cx,0
				mov dx,0
				.while cx!=360
					mov dx,0
					mov Yaxis,200
					mov color,12h
					call verticalline
					inc cx
				.endw

				call Border
				mov ax, 0
				mov bx, 0
				mov cx, 0
				mov dx, 0


				;NEW GAME
				mov ah,02h
				mov bh,0
				mov dh,30 ;ROW
				mov dl,7 ;COL
				int 10h

				mov ah,0Ah
				mov bl,4 ;color
				mov cx,1
				mov al,menu1[0]
				int 10h

				mov ah,02h
				mov bh,0
				mov dh,30
				mov dl,8
				int 10h

				mov ah,0Ah
				mov bl,4
				mov cx,1
				mov al,menu1[1]
				int 10h

				mov ah,02h
				mov bh,0
				mov dh,30
				mov dl,9
				int 10h

				mov ah,0Ah
				mov bl,4
				mov cx,1
				mov al,menu1[2]
				int 10h

				mov ah,02h
				mov bh,0
				mov dh,30
				mov dl,10
				int 10h

				mov ah,0Ah
				mov bl,4
				mov cx,1
				mov al,menu1[3]
				int 10h
	
				mov ah,02h
				mov bh,0
				mov dh,30
				mov dl,11
				int 10h

				mov ah,0Ah
				mov bl,4
				mov cx,1
				mov al,menu1[4]
				int 10h

				mov ah,02h
				mov bh,0
				mov dh,30 ;ROW
				mov dl,12 ;COL
				int 10h

				mov ah,0Ah
				mov bl,4 ;color
				mov cx,1
				mov al,menu1[5]
				int 10h

				mov ah,02h
				mov bh,0
				mov dh,30 ;ROW
				mov dl,13 ;COL
				int 10h

				mov ah,0Ah
				mov bl,4 ;color
				mov cx,1
				mov al,menu1[6]
				int 10h

				mov ah,02h
				mov bh,0
				mov dh,30 ;ROW
				mov dl,14 ;COL
				int 10h

				mov ah,0Ah
				mov bl,4 ;color
				mov cx,1
				mov al,menu1[7]
				int 10h

				;CONTINUE
				mov ah,02h
				mov bh,0
				mov dh,34 ;ROW
				mov dl,7 ;COL
				int 10h

				mov ah,0Ah
				mov bl,4 ;color
				mov cx,1
				mov al,menu3[0]
				int 10h

				mov ah,02h
				mov bh,0
				mov dh,34
				mov dl,8
				int 10h

				mov ah,0Ah
				mov bl,4
				mov cx,1
				mov al,menu3[1]
				int 10h

				mov ah,02h
				mov bh,0
				mov dh,34
				mov dl,9
				int 10h

				mov ah,0Ah
				mov bl,4
				mov cx,1
				mov al,menu3[2]
				int 10h

				mov ah,02h
				mov bh,0
				mov dh,34
				mov dl,10
				int 10h

				mov ah,0Ah
				mov bl,4
				mov cx,1
				mov al,menu3[3]
				int 10h
	
				mov ah,02h
				mov bh,0
				mov dh,34
				mov dl,11
				int 10h

				mov ah,0Ah
				mov bl,4
				mov cx,1
				mov al,menu3[4]
				int 10h

				mov ah,02h
				mov bh,0
				mov dh,34 ;ROW
				mov dl,12 ;COL
				int 10h

				mov ah,0Ah
				mov bl,4 ;color
				mov cx,1
				mov al,menu3[5]
				int 10h

				mov ah,02h
				mov bh,0
				mov dh,34 ;ROW
				mov dl,13 ;COL
				int 10h

				mov ah,0Ah
				mov bl,4 ;color
				mov cx,1
				mov al,menu3[6]
				int 10h

				mov ah,02h
				mov bh,0
				mov dh,34 ;ROW
				mov dl,14 ;COL
				int 10h

				mov ah,0Ah
				mov bl,4 ;color
				mov cx,1
				mov al,menu3[7]
				int 10h

				;INSTRUCTIONS
				mov ah,02h
				mov bh,0
				mov dh,38 ;ROW
				mov dl,5 ;COL
				int 10h

				mov ah,0Ah
				mov bl,4 ;color
				mov cx,1
				mov al,menu2[0]
				int 10h

				mov ah,02h
				mov bh,0
				mov dh,38
				mov dl,6
				int 10h

				mov ah,0Ah
				mov bl,4
				mov cx,1
				mov al,menu2[1]
				int 10h

				mov ah,02h
				mov bh,0
				mov dh,38
				mov dl,7
				int 10h

				mov ah,0Ah
				mov bl,4
				mov cx,1
				mov al,menu2[2]
				int 10h

				mov ah,02h
				mov bh,0
				mov dh,38
				mov dl,8
				int 10h

				mov ah,0Ah
				mov bl,4
				mov cx,1
				mov al,menu2[3]
				int 10h
	
				mov ah,02h
				mov bh,0
				mov dh,38
				mov dl,9
				int 10h

				mov ah,0Ah
				mov bl,4
				mov cx,1
				mov al,menu2[4]
				int 10h

				mov ah,02h
				mov bh,0
				mov dh,38 ;ROW
				mov dl,10 ;COL
				int 10h

				mov ah,0Ah
				mov bl,4 ;color
				mov cx,1
				mov al,menu2[5]
				int 10h

				mov ah,02h
				mov bh,0
				mov dh,38 ;ROW
				mov dl,11 ;COL
				int 10h

				mov ah,0Ah
				mov bl,4 ;color
				mov cx,1
				mov al,menu2[6]
				int 10h

				mov ah,02h
				mov bh,0
				mov dh,38 ;ROW
				mov dl,12 ;COL
				int 10h

				mov ah,0Ah
				mov bl,4 ;color
				mov cx,1
				mov al,menu2[7]
				int 10h

				mov ah,02h
				mov bh,0
				mov dh,38 ;ROW
				mov dl,13 ;COL
				int 10h

				mov ah,0Ah
				mov bl,4 ;color
				mov cx,1
				mov al,menu2[8]
				int 10h

				mov ah,02h
				mov bh,0
				mov dh,38 ;ROW
				mov dl,14 ;COL
				int 10h

				mov ah,0Ah
				mov bl,4 ;color
				mov cx,1
				mov al,menu2[9]
				int 10h

				mov ah,02h
				mov bh,0
				mov dh,38 ;ROW
				mov dl,15 ;COL
				int 10h

				mov ah,0Ah
				mov bl,4 ;color
				mov cx,1
				mov al,menu2[10]
				int 10h

				mov ah,02h
				mov bh,0
				mov dh,38 ;ROW
				mov dl,16 ;COL
				int 10h

				mov ah,0Ah
				mov bl,4 ;color
				mov cx,1
				mov al,menu2[11]
				int 10h

				;LEADERBOARDS
				mov ah,02h
				mov bh,0
				mov dh,42 ;ROW
				mov dl,5 ;COL
				int 10h

				mov ah,0Ah
				mov bl,4 ;color
				mov cx,1
				mov al,menu4[0]
				int 10h

				mov ah,02h
				mov bh,0
				mov dh,42
				mov dl,6
				int 10h

				mov ah,0Ah
				mov bl,4
				mov cx,1
				mov al,menu4[1]
				int 10h

				mov ah,02h
				mov bh,0
				mov dh,42
				mov dl,7
				int 10h

				mov ah,0Ah
				mov bl,4
				mov cx,1
				mov al,menu4[2]
				int 10h

				mov ah,02h
				mov bh,0
				mov dh,42
				mov dl,8
				int 10h

				mov ah,0Ah
				mov bl,4
				mov cx,1
				mov al,menu4[3]
				int 10h
	
				mov ah,02h
				mov bh,0
				mov dh,42
				mov dl,9
				int 10h

				mov ah,0Ah
				mov bl,4
				mov cx,1
				mov al,menu4[4]
				int 10h

				mov ah,02h
				mov bh,0
				mov dh,42 ;ROW
				mov dl,10 ;COL
				int 10h

				mov ah,0Ah
				mov bl,4 ;color
				mov cx,1
				mov al,menu4[5]
				int 10h

				mov ah,02h
				mov bh,0
				mov dh,42 ;ROW
				mov dl,11 ;COL
				int 10h

				mov ah,0Ah
				mov bl,4 ;color
				mov cx,1
				mov al,menu4[6]
				int 10h

				mov ah,02h
				mov bh,0
				mov dh,42 ;ROW
				mov dl,12 ;COL
				int 10h

				mov ah,0Ah
				mov bl,4 ;color
				mov cx,1
				mov al,menu4[7]
				int 10h

				mov ah,02h
				mov bh,0
				mov dh,42 ;ROW
				mov dl,13 ;COL
				int 10h

				mov ah,0Ah
				mov bl,4 ;color
				mov cx,1
				mov al,menu4[8]
				int 10h

				mov ah,02h
				mov bh,0
				mov dh,42 ;ROW
				mov dl,14 ;COL
				int 10h

				mov ah,0Ah
				mov bl,4 ;color
				mov cx,1
				mov al,menu4[9]
				int 10h

				mov ah,02h
				mov bh,0
				mov dh,42 ;ROW
				mov dl,15 ;COL
				int 10h

				mov ah,0Ah
				mov bl,4 ;color
				mov cx,1
				mov al,menu4[10]
				int 10h

				mov ah,02h
				mov bh,0
				mov dh,42 ;ROW
				mov dl,16 ;COL
				int 10h

				mov ah,0Ah
				mov bl,4 ;color
				mov cx,1
				mov al,menu4[11]
				int 10h

				;EXIT
				mov ah,02h
				mov bh,0
				mov dh,46
				mov dl,9
				int 10h

				mov ah,0Ah
				mov bl,4
				mov cx,1
				mov al,menu5[0]
				int 10h

				mov ah,02h
				mov bh,0
				mov dh,46
				mov dl,10
				int 10h

				mov ah,0Ah
				mov bl,4
				mov cx,1
				mov al,menu5[1]
				int 10h

				mov ah,02h
				mov bh,0
				mov dh,46
				mov dl,11
				int 10h

				mov ah,0Ah
				mov bl,4
				mov cx,1
				mov al,menu5[2]
				int 10h

				mov ah,02h
				mov bh,0
				mov dh,46
				mov dl,12
				int 10h

				mov ah,0Ah
				mov bl,4
				mov cx,1
				mov al,menu5[3]
				int 10h

				mov cx, 30					;initial coordinate of printing box
				mov Yvar, cx
				call makebox
				mov cx, 8

		
					.while cx!=0				;While enter is not pressed
		
						mov ah, 0				;interupt for key press, which one
						int 16h
			
						.if al == 13			;enter pressed scan code is checked
							jmp getout
						.endif
						.if ah == 50h			;down arrow pressed ascii is checked
							.if Yvar < 158
								call destroybox
								mov bx,Yvar
								add bx,32
								mov Yvar,bx
								call makebox
								sub cx, 1 
							.endif
						.endif
						.if ah == 48h				;up arrow pressed ascii is checked
							.if Yvar > 30
								call destroybox
								mov bx,Yvar
								sub bx,32
								mov Yvar,bx
								call makebox
								sub cx, 1		
							.endif
						.endif
			
					.endw

				getout:
			
					.if Yvar == 30									;New Game
						
					    mov dl, 3			; New game so lives are 3
						mov life, dl
						mov dl, 0			; New game so score is 0
						mov score, dl
						
						call bgc             ; background color proc
						balll colorball      ; macro of drawing a ball

						call make_box        ; box building

						call ballmov         ; ball moving function calling
				
					.elseif Yvar == 62								;Continue


					.elseif Yvar == 94								;Instructions

						call instructions					;instructions page displayed
						mov cx, 2

						.while cx > 1						;infinite loop till space is pressed

							mov ah, 0						;interupt for key press, a.k.a which key it is
							int 16h

							.if al == 32					;space pressed scan code is checked
								jmp comeoutofloop
							.endif

						.endw

						comeoutofloop:
							jmp repeatmenu					;go back to the menu because space was pressed

					.elseif Yvar == 126								;HighScores



					.elseif Yvar == 158								;Exit

						call goodbyee
						jmp exitgame

					.endif
				jmp repeatmenu								;for repeating menu after game ends
			
				exitgame:

		endm





; Collision macro which uses the Axis Alligned Bounding Boxes Condition for collision with the striker
    collision macro x_of_ball, y_of_ball, ball_size, strikerx, strikery, striker_height, striker_width

            mov ax, x_of_ball
            add ax, ball_size

            .if ax < strikerx
            jmp conditionfalse
            .endif

            mov ax, strikerx
            add ax, striker_width

            .if ax < x_of_ball
            jmp conditionfalse
            .endif

            mov ax, y_of_ball
            add ax, ball_size

            .if ax < strikery
            jmp conditionfalse
            .endif

            mov ax, strikery
            add ax, striker_height

            .if ax < y_of_ball
            jmp conditionfalse
            .endif

            neg speed_y


            call sound

            conditionfalse:
    endm




;  Collision of box with ball
collision_of_box macro xball, yball, ballsize, boxx, boxy, boxheight, boxwidth

    mov ax, xball
    add ax, ballsize

    .if ax < boxx
    jmp conditionfalse2
    .endif

    mov ax, boxx
    add ax, boxwidth

    .if ax < xball
    jmp conditionfalse2
    .endif

    mov ax, yball
    add ax, ballsize

    .if ax < boxy
    jmp conditionfalse2
    .endif

    mov ax, boxy
    add ax, boxheight

    .if ax < yball
    jmp conditionfalse2
    .endif


    .if level_num == 1
    build_box colorbg, boxx, boxy
    neg speed_y
    mov box_temp, 1

    inc score
    .endif

    .if level_num == 2

    mov box_temp, 1
    neg speed_y

    inc score
    .endif



    .if level_num == 3

    mov box_temp, 1

    neg speed_y

    inc score
    .endif

    call sound

    conditionfalse2:
endm


build_box_for_level_2 macro colorr , xcor, ycor


    mov cx, xcor
    mov dx, ycor

    drawbox_l2:
    mov ah, 0ch        ; 0ch is for draw pixel in int 10h
    mov al, colorr     ; giving color to the box
    mov bh, 00h
    int 10h

    inc cx
    mov ax, cx
    sub ax, xcor
    cmp ax, width_of_box
    jng drawbox_l2

    mov cx, xcor
    inc dx

    mov ax, dx
    sub ax, ycor
    cmp ax, height_of_box
    jng drawbox_l2
    mov box_15_temp2, 1

endm




balll macro color

    mov cx,  ball_x_coordinate          ; drawing balll
    mov dx, ball_y_coordinate           ; drawing balll

    game_ball:
    mov ah, 0ch     ; 0ch is for draw pixel in int10h
    mov al, color     ; giving color to the balll
    mov bh, 00h
    int 10h

    inc cx
    mov ax, cx
    sub ax, ball_x_coordinate
    cmp ax, sizee
    jbe game_ball

    mov cx, ball_x_coordinate
    inc dx
    mov ax, dx
    sub ax, ball_y_coordinate
    cmp ax, sizee
    jbe game_ball

endm


build_box macro colorr , xcor, ycor

    mov cx, xcor
    mov dx, ycor

    drawbox:
    mov ah, 0ch        ; 0ch is for draw pixel in int 10h
    mov al, colorr     ; giving color to the box
    mov bh, 00h
    int 10h

    inc cx
    mov ax, cx
    sub ax, xcor
    cmp ax, width_of_box
    jng drawbox

    mov cx, xcor
    inc dx

    mov ax, dx
    sub ax, ycor
    cmp ax, height_of_box
    jng drawbox

endm



striker_mac macro color

    mov cx, striker_x
    mov dx, striker_y

    drawst:
    mov ah, 0ch     ; 0ch is for draw pixel in int 10h
    mov al, color     ; giving color to the striker
    mov bh, 00h
    int 10h

    inc cx
    mov ax, cx
    sub ax, striker_x
    cmp ax, width_of_striker
    jng drawst

    mov cx, striker_x
    inc dx

    mov ax, dx
    sub ax, striker_y
    cmp ax, height_of_striker
    jng drawst

endm

    ;***************************************;
    ;                                       ;
    ;                                       ;
    ;               MAIN PROC               ;
    ;                                       ;
    ;                                       ;
    ;***************************************;

mov bx, 0
repeeatmenu:

    main proc

        mov ax, @data
        mov ds, ax

		.if bx == 1								;GAME IS WON OR LOST WHICH MEANS ITS NOT THE FIRST TIME FOR MENU CALL
			jmp repeeeatmenu
		.endif

        ;setting video mode

        mov ax, 0
        mov ah, 00h ;vid mode
        mov al, 13h ;screen mode
        int 10h

		;Starting with title page

		TitlePage

		
		repeeeatmenu:

        MainMenu

		call goodbyee
		jmp exitgame

    main endp


    ballmov proc 

        movment:

        mov ah, 2ch
        int 21h

        cmp dl, temp
        je movment

        mov temp, dl

        .if score == 66                ; 66 score is because after level 2.... 3 bricks are fixed and 5 are special so remaining are 7 bricks which have 3 score each
        jmp winn                        ; so 3*7 = 21 ..... + 45 of previous score: 66 score for winning condition
        .endif

        .if score == 15
        mov level_num, 2
        .endif

        .if score == 45
        mov level_num, 3
        .endif


        .if level_num == 2

        .if level_temp == 0

        inc speed_x
        inc speed_y

        inc striker_speed
        inc striker_speed

        mov ax, width_of_striker
        sub ax, 10

        mov width_of_striker, ax


        mov ax, window_right
        mov bx, window_left

        add ax, 7
        add bx, 10

        mov window_right, ax
        mov window_left, bx


        call ball_reset_for_level

        mov ax, x_org
        mov bx, y_org

        mov ball_x_coordinate, ax
        mov ball_y_coordinate, bx

        call make_box


        call box_temp_reset


        mov level_temp, 1
        .endif
        .endif



        .if level_num == 3

        .if level_temp2 == 0

        inc speed_x
        inc speed_y

        inc striker_speed
        inc striker_speed


        inc striker_speed
        inc striker_speed


        mov ax, width_of_striker
        sub ax, 10

        mov width_of_striker, ax


        mov ax, window_right
        mov bx, window_left

        add ax, 0
        add bx, 10

        mov window_right, ax
        mov window_left, bx


        call ball_reset_for_level

        mov ax, x_org
        mov bx, y_org

        mov ball_x_coordinate, ax
        mov ball_y_coordinate, bx

        call make_box


        call box_temp_reset


        mov level_temp2, 1
        .endif
        .endif






        call draw_point
        call draw_heart
        balll colorbg
        striker_mac colorbg


                                        ; Boundry Conditions
        .if ball_x_coordinate > 312
        neg speed_x
        call sound
        .endif

        .if ball_x_coordinate < 4
        neg speed_x
        call sound
        .endif

        .if ball_y_coordinate < 20
        neg speed_y
        call sound
        .endif

        .if ball_y_coordinate > 195
        call sound
        call resett                        ; reset func when ball goes below 
        .endif





                            ; collision with striker or brick
                            ; calling a macro for checking collision

        collision ball_x_coordinate, ball_y_coordinate, sizee, striker_x, striker_y, height_of_striker, width_of_striker


        ; COLLISION OF BALL: 


        .if level_num == 1

        .if box_1_temp == 0
        call check_b1_coll
        .endif

        .if box_2_temp == 0
        call check_b2_coll
        .endif

        .if box_3_temp == 0
        call check_b3_coll
        .endif

        .if box_4_temp == 0
        call check_b4_coll
        .endif

        .if box_5_temp == 0
        call check_b5_coll
        .endif

        .if box_6_temp == 0
        call check_b6_coll
        .endif

        .if box_7_temp == 0
        call check_b7_coll
        .endif

        .if box_8_temp == 0
        call check_b8_coll
        .endif

        .if box_9_temp == 0
        call check_b9_coll
        .endif

        .if box_10_temp == 0
        call check_b10_coll
        .endif

        .if box_11_temp == 0
        call check_b11_coll
        .endif

        .if box_12_temp == 0
        call check_b12_coll
        .endif

        .if box_13_temp == 0
        call check_b13_coll
        .endif

        .if box_14_temp == 0
        call check_b14_coll
        .endif

        .if box_15_temp == 0
        call check_b15_coll
        .endif

        .endif          ; End of if for 1st level collision of box




        ; COLLISION OF BALL: 


        .if level_num == 2

        .if box_1_temp < 2
        call check_b1_coll
        .endif

        .if box_2_temp < 2
        call check_b2_coll
        .endif

        .if box_3_temp < 2
        call check_b3_coll
        .endif

        .if box_4_temp < 2
        call check_b4_coll
        .endif

        .if box_5_temp < 2
        call check_b5_coll
        .endif

        .if box_6_temp < 2
        call check_b6_coll
        .endif

        .if box_7_temp < 2
        call check_b7_coll
        .endif

        .if box_8_temp < 2
        call check_b8_coll
        .endif

        .if box_9_temp < 2
        call check_b9_coll
        .endif

        .if box_10_temp < 2
        call check_b10_coll
        .endif

        .if box_11_temp < 2
        call check_b11_coll
        .endif

        .if box_12_temp < 2
        call check_b12_coll
        .endif

        .if box_13_temp < 2
        call check_b13_coll
        .endif

        .if box_14_temp < 2
        call check_b14_coll
        .endif

        .if box_15_temp < 2
        call check_b15_coll
        .endif


        .endif          ; End of if for 2nd level collision of box




        .if level_num == 3

        .if box_1_temp < 3
        call check_b1_coll
        .endif

        .if box_2_temp < 3
        call check_b2_coll
        .endif

        .if box_3_temp < 3
        call check_b3_coll
        .endif

        .if box_4_temp < 3
        call check_b4_coll
        .endif

        .if box_5_temp < 3
        call check_b5_coll
        .endif

        .if box_6_temp < 3
        call check_b6_coll
        .endif

        .if box_7_temp < 3
        call check_b7_coll
        .endif

        .if box_8_temp < 3
        call check_b8_coll
        .endif

        .if box_9_temp < 3
        call check_b9_coll
        .endif

        .if box_10_temp < 3
        call check_b10_coll
        .endif

        .if box_11_temp < 3
        call check_b11_coll
        .endif

        .if box_12_temp < 3
        call check_b12_coll
        .endif

        .if box_13_temp < 3
        call check_b13_coll
        .endif

        .if box_14_temp < 3
        call check_b14_coll
        .endif

        .if box_15_temp < 3
        call check_b15_coll
        .endif


        .endif          ; End of if for 3rd level collision of box




        mov ax, speed_x
        add ball_x_coordinate, ax

        mov ax, speed_y
        add ball_y_coordinate, ax


        call ball_drawing
        call mov_striker
        call striker_drawing


        jmp movment

        ret
    ballmov endp




    ball_reset_for_level proc

        balll 10010100b

        ret
    ball_reset_for_level endp


    mov_striker proc

        mov ah, 01h
        int 16h
        jz returnn

        mov ah, 00h
        int 16h

        .if ah == 4Dh
            mov bx, window_right
            .if striker_x < bx
                mov ax, striker_speed
                add striker_x, ax
            .endif
        .endif


        .if ah == 4Bh
            mov bx, window_left
            .if striker_x > bx
                mov ax, striker_speed
                sub striker_x, ax
            .endif
        .endif

        .if al == 32

			jmp game_win_or_lose

		.endif

        returnn:

        ret 
    mov_striker endp

    striker_drawing proc

        striker_mac color_of_striker

        ret
    striker_drawing endp



    resett proc

        call sound
        dec life

        .if life == 0

        jmp game_over

        .endif


        mov ax, x_org
        mov ball_x_coordinate , ax
        mov ax, y_org
        mov ball_y_coordinate , ax

        ret
    resett endp

    ;WIN PROCDURE

    winn proc

        mov ah, 06h
        mov al, 0
        mov ch, 0
        mov cl, 0
        mov dl, 200
        mov dh, 200
        mov bh, 0h
        int 10h

        mov ah, 02h
        mov bh, 00h
        mov dh, 38
        mov dl, 06
        int 10h

         mov ah, 09h
        lea dx, win_str
        int 21h

		mov ah, 02h
        mov bh, 00h
        mov dh, 41
        mov dl, 02
        int 10h

        mov ah, 09h
        lea dx, finalscore_str
        int 21h

		mov ah, 02h
        mov bh, 00h
        mov dh, 46
        mov dl, 1
        int 10h

        mov ah, 09h
        lea dx, pressenter_str
        int 21h

		.while al != 13				;Don't move forward until enter is pressed

			mov ah, 0				;interupt for key press, which one
			int 16h

		.endw

		call WritetoFile			;Write score and name to file

		jmp game_win_or_lose
        ret
    winn endp



    ball_drawing proc

        balll colorball

        ret
    ball_drawing endp



    make_box proc

        build_box box1_color, box1_x_cor, box1_y_cor
        call box2
        call box3
        call box4
        call box5
        call box6
        call box7
        call box8
        call box9
        call box10
        call box11
        call box12
        call box13
        call box14
        call box15
        ret

    make_box endp





    sound proc

        mov al, 182         
        out     43h, al     
        mov     ax, volume  
        out     42h, al     
        mov     al, ah      
        out     42h, al 
        in      al, 61h     
        or      al, 00000011b 
        out     61h, al
        mov     bx, 2          
        p11:
        mov     cx, 65535
        p22:
        dec     cx
        jne     p22
        dec     bx
        jne     p11
        in      al, 61h         
        and     al, 11111100b   
        out     61h, al

        ret

    sound endp




    draw_point proc

        mov ah, 02h
        mov bh, 00h
        mov dh, 01h
        mov dl, 19h
        int 10h

        mov ah, 09h
        lea dx, p1
        int 21h


        mov ax, 0
        mov al, score
        mov bl,10
        div bl
        mov ch,ah
        mov cl,al

        mov ax, 0
        mov ah,02h
        mov dl,cl         
        add dl,"0"
        int 21h

        mov ah,02h
        mov dl,ch
        add dl,"0"
        int 21h


        ret
    draw_point endp



    draw_heart proc

        mov ah, 06h
        mov al, 0
        mov ch, 0
        mov cl, 0
        mov dl, 10
        mov dh, 1
        mov bh, 4h
        int 10h

        mov ah, 02h
        mov bh, 00h
        mov dh, 01h
        mov dl, 01h
        int 10h

        mov ah, 09h
        lea dx, p2
        int 21h


        .if life == 3

        mov ah, 02h
        mov bh, 00h
        mov dh, 01h
        mov dl, 08h
        int 10h

        mov ah,02h
        mov dl,3
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 01h
        mov dl, 09h
        int 10h

        mov ah,02h
        mov dl,3
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 01h
        mov dl, 10
        int 10h

        mov ah,02h
        mov dl,3
        int 21h

        .endif


        .if life == 2

        mov ah, 02h
        mov bh, 00h
        mov dh, 01h
        mov dl, 08h
        int 10h

        mov ah,02h
        mov dl,3
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 01h
        mov dl, 09h
        int 10h

        mov ah,02h
        mov dl,3
        int 21h

        .endif


        .if life == 1

        mov ah, 02h
        mov bh, 00h
        mov dh, 01h
        mov dl, 08h
        int 10h

        mov ah,02h
        mov dl,3
        int 21h

        .endif


        ret
    draw_heart endp



    game_over proc

        mov ah, 06h
        mov al, 0
        mov ch, 0
        mov cl, 0
        mov dl, 200
        mov dh, 200
        mov bh, 0h
        int 10h


        mov ah, 02h
        mov bh, 00h
        mov dh, 38
        mov dl, 06
        int 10h

         mov ah, 09h
        lea dx, game_over_str
        int 21h

		mov ah, 02h
        mov bh, 00h
        mov dh, 41
        mov dl, 01
        int 10h

        mov ah, 09h
        lea dx, finalscore_str
        int 21h

		mov ax, 0
		mov al, score
		mov bl,10
		div bl
		mov ch,ah
		mov cl,al

		mov ax, 0
		mov ah,02h
		mov dl,cl         
		add dl,"0"
		int 21h

		mov ah,02h
		mov dl,ch
		add dl,"0"
		int 21h


		mov ah, 02h
        mov bh, 00h
        mov dh, 46
        mov dl, 1
        int 10h

        mov ah, 09h
        lea dx, pressenter_str
        int 21h

		.while al != 13				;Don't move forward until enter is pressed

			mov ah, 0				;interupt for key press, which one
			int 16h

		.endw

		call WritetoFile			;Write score and name to file


		jmp game_win_or_lose
        ret
    game_over endp




    box_temp_reset proc

        mov box_temp, 0
        mov box_1_temp, 0
        mov box_2_temp, 0
        mov box_3_temp, 0
        mov box_4_temp, 0
        mov box_5_temp, 0
        mov box_6_temp, 0
        mov box_7_temp, 0
        mov box_8_temp, 0
        mov box_9_temp, 0
        mov box_10_temp, 0
        mov box_11_temp, 0
        mov box_12_temp, 0
        mov box_13_temp, 0
        mov box_14_temp, 0
        mov box_15_temp, 0


        ret
    box_temp_reset endp





    bgc proc

        ; bg color

        mov ah, 06h
        mov al, 0

        ; starting row and col
        mov ch, 0
        mov cl, 0

        ; ending row and col
        mov dl, 80
        mov dh, 80

        ; color code for teal
        ;mov bh, 10010100b
        mov bh, 10010100b
        int 10h



        mov ah, 06h
        mov al, 0

        ; starting row and col
        mov ch, 0
        mov cl, 0

        ; ending row and col
        mov dl, 80
        mov dh, 1

        ; color code for red
        mov bh, 4h
        int 10h

        ret

    bgc endp





    check_b1_coll proc
    
        .if box_11_temp == 3

        mov box_1_temp, 3
        call box_1_l2

        .endif


        collision_of_box ball_x_coordinate, ball_y_coordinate, sizee, box1_x_cor, box1_y_cor, height_of_box, width_of_box

        .if level_num == 1
        .if box_temp == 1

        mov box_1_temp, 1
        mov box_temp, 0

        .endif
        .endif

        .if level_num == 2

        .if box_temp == 1

        inc box_1_temp
        mov box_temp, 0

        .endif
        .endif

        .if box_1_temp == 2

        call box_1_l2
        neg speed_y

        .endif


        .if level_num == 3

        .if box_temp == 1

        inc box_1_temp
        mov box_temp, 0

        .endif
        .endif

        .if box_1_temp == 3

        call box_1_l2
        neg speed_y

        .endif



        ret
    check_b1_coll endp






    check_b2_coll proc

        collision_of_box ball_x_coordinate, ball_y_coordinate, sizee, box2_x_cor, box2_y_cor, height_of_box, width_of_box

        .if level_num == 1
        .if box_temp == 1

        mov box_2_temp, 1
        mov box_temp, 0

        .endif
        .endif

        .if level_num == 2

        .if box_temp == 1

        inc box_2_temp
        mov box_temp, 0

        .endif
        .endif

        .if box_2_temp == 2

        call box_2_l2
        neg speed_y

        .endif

        .if level_num == 3

        .if box_temp == 1

        mov box_temp, 0

        neg speed_x

        .endif
        .endif



        ret
    check_b2_coll endp





    check_b3_coll proc              ; fixed box for level 3

        collision_of_box ball_x_coordinate, ball_y_coordinate, sizee, box3_x_cor, box3_y_cor, height_of_box, width_of_box

        .if level_num == 1
        .if box_temp == 1

        mov box_3_temp, 1
        mov box_temp, 0

        .endif
        .endif

        .if level_num == 2

        .if box_temp == 1

        inc box_3_temp
        mov box_temp, 0

        .endif
        .endif

        .if box_3_temp == 2

        call box_3_l2
        neg speed_y

        .endif


        .if level_num == 3

        .if box_temp == 1

        inc box_3_temp
        mov box_temp, 0

        .endif
        .endif

        .if box_3_temp == 3

        call box_3_l2
        neg speed_y

        .endif


        ret
    check_b3_coll endp








    check_b4_coll proc

        collision_of_box ball_x_coordinate, ball_y_coordinate, sizee, box4_x_cor, box4_y_cor, height_of_box, width_of_box

        .if level_num == 1
        .if box_temp == 1

        mov box_4_temp, 1
        mov box_temp, 0

        .endif
        .endif


        .if level_num == 2

        .if box_temp == 1

        inc box_4_temp
        mov box_temp, 0

        .endif
        .endif

        .if box_4_temp == 2

        call box_4_l2
        neg speed_y

        .endif



        .if level_num == 3

        .if box_temp == 1

        inc box_4_temp
        mov box_temp, 0

        .endif
        .endif

        .if box_4_temp == 3

        call box_4_l2
        neg speed_y

        .endif


        ret
    check_b4_coll endp





    check_b5_coll proc

        .if box_11_temp == 3

            mov box_5_temp, 3
            call box_5_l2

        .endif


        collision_of_box ball_x_coordinate, ball_y_coordinate, sizee, box5_x_cor, box5_y_cor, height_of_box, width_of_box

        .if level_num == 1
            .if box_temp == 1

                mov box_5_temp, 1
                mov box_temp, 0

            .endif
        .endif


        .if level_num == 2

            .if box_temp == 1

                inc box_5_temp
                mov box_temp, 0

            .endif
        .endif

        .if box_5_temp == 2

            call box_5_l2
            neg speed_y

        .endif




        .if level_num == 3

            .if box_temp == 1

                inc box_5_temp
                mov box_temp, 0

            .endif
        .endif

        .if box_5_temp == 3

            call box_5_l2
            neg speed_y

        .endif


        ret
    check_b5_coll endp


    check_b6_coll proc


        .if box_11_temp == 3

        mov box_6_temp, 3
        call box_6_l2

        .endif

    

        collision_of_box ball_x_coordinate, ball_y_coordinate, sizee, box6_x_cor, box6_y_cor, height_of_box, width_of_box

        .if level_num == 1
        .if box_temp == 1

        mov box_6_temp, 1
        mov box_temp, 0

        .endif
        .endif


        .if level_num == 2

        .if box_temp == 1

        inc box_6_temp
        mov box_temp, 0

        .endif
        .endif

        .if box_6_temp == 2

        call box_6_l2
        neg speed_y

        .endif


        .if level_num == 3

        .if box_temp == 1

        inc box_6_temp
        mov box_temp, 0

        .endif
        .endif

        .if box_6_temp == 3

        call box_6_l2
        neg speed_y

        .endif


        ret
    check_b6_coll endp



    check_b7_coll proc              ; fixed box for level 3

        collision_of_box ball_x_coordinate, ball_y_coordinate, sizee, box7_x_cor, box7_y_cor, height_of_box, width_of_box

        .if level_num == 1
        .if box_temp == 1

        mov box_7_temp, 1
        mov box_temp, 0

        .endif
        .endif



        .if level_num == 2

        .if box_temp == 1

        inc box_7_temp
        mov box_temp, 0

        .endif
        .endif

        .if box_7_temp == 2

        call box_7_l2
        neg speed_y

        .endif



        .if level_num == 3

        .if box_temp == 1

        mov box_temp, 0

        neg speed_x

        .endif
        .endif




        ret
    check_b7_coll endp



    check_b8_coll proc

    
        .if box_11_temp == 3

        mov box_8_temp, 3
        call box_8_l2

        .endif

        collision_of_box ball_x_coordinate, ball_y_coordinate, sizee, box8_x_cor, box8_y_cor, height_of_box, width_of_box

        .if level_num == 1
        .if box_temp == 1

        mov box_8_temp, 1
        mov box_temp, 0

        .endif
        .endif


        .if level_num == 2

        .if box_temp == 1

        inc box_8_temp
        mov box_temp, 0

        .endif
        .endif

        .if box_8_temp == 2

        call box_8_l2
        neg speed_y

        .endif


        .if level_num == 3

        .if box_temp == 1

        inc box_8_temp
        mov box_temp, 0

        .endif
        .endif

        .if box_8_temp == 3

        call box_8_l2
        neg speed_y

        .endif




        ret
    check_b8_coll endp


    check_b9_coll proc

        collision_of_box ball_x_coordinate, ball_y_coordinate, sizee, box9_x_cor, box9_y_cor, height_of_box, width_of_box

        .if level_num == 1
        .if box_temp == 1

        mov box_9_temp, 1
        mov box_temp, 0

        .endif
        .endif


        .if level_num == 2

        .if box_temp == 1

        inc box_9_temp
        mov box_temp, 0

        .endif
        .endif

        .if box_9_temp == 2

        call box_9_l2
        neg speed_y

        .endif



        .if level_num == 3

        .if box_temp == 1

        inc box_9_temp
        mov box_temp, 0

        .endif
        .endif

        .if box_9_temp == 3

        call box_9_l2
        neg speed_y

        .endif





        ret
    check_b9_coll endp


    check_b10_coll proc

        .if box_11_temp == 3

        mov box_5_temp, 3
        call box_5_l2

        .endif

        collision_of_box ball_x_coordinate, ball_y_coordinate, sizee, box10_x_cor, box10_y_cor, height_of_box, width_of_box

        .if level_num == 1
        .if box_temp == 1

        mov box_10_temp, 1
        mov box_temp, 0

        .endif
        .endif



        .if level_num == 2

        .if box_temp == 1

        inc box_10_temp
        mov box_temp, 0

        .endif
        .endif

        .if box_10_temp == 2

        call box_10_l2
        neg speed_y

        .endif


        .if level_num == 3

        .if box_temp == 1

        inc box_10_temp
        mov box_temp, 0

        .endif
        .endif

        .if box_10_temp == 3

        call box_10_l2
        neg speed_y

        .endif




        ret
    check_b10_coll endp


    check_b11_coll proc

        collision_of_box ball_x_coordinate, ball_y_coordinate, sizee, box11_x_cor, box11_y_cor, height_of_box, width_of_box

        .if level_num == 1
        .if box_temp == 1

        mov box_11_temp, 1
        mov box_temp, 0

        .endif
        .endif 



        .if level_num == 2

        .if box_temp == 1

        inc box_11_temp
        mov box_temp, 0

        .endif
        .endif

        .if box_11_temp == 2

        call box_11_l2
        neg speed_y

        .endif




        .if level_num == 3

        .if box_temp == 1

        inc box_11_temp
        mov box_temp, 0

        .endif
        .endif

        .if box_11_temp == 3

        call box_11_l2
        neg speed_y

        .endif





        ret
    check_b11_coll endp





    check_b12_coll proc

        collision_of_box ball_x_coordinate, ball_y_coordinate, sizee, box12_x_cor, box12_y_cor, height_of_box, width_of_box

        .if level_num == 1
        .if box_temp == 1

        mov box_12_temp, 1
        mov box_temp, 0

        .endif
        .endif


        .if level_num == 2

        .if box_temp == 1

        inc box_12_temp
        mov box_temp, 0

        .endif
        .endif

        .if box_12_temp == 2

        call box_12_l2
        neg speed_y

        .endif


        .if level_num == 3

        .if box_temp == 1

        inc box_12_temp
        mov box_temp, 0

        .endif
        .endif

        .if box_12_temp == 3

        call box_12_l2
        neg speed_y

        .endif



        ret
    check_b12_coll endp





    check_b13_coll proc

        collision_of_box ball_x_coordinate, ball_y_coordinate, sizee, box13_x_cor, box13_y_cor, height_of_box, width_of_box

        .if level_num == 1
        .if box_temp == 1

        mov box_13_temp, 1
        mov box_temp, 0

        .endif
        .endif


        .if level_num == 2

        .if box_temp == 1

        inc box_13_temp
        mov box_temp, 0

        .endif
        .endif

        .if box_13_temp == 2

        call box_13_l2
        neg speed_y
        .endif


        .if level_num == 3

        .if box_temp == 1

        inc box_13_temp
        mov box_temp, 0

        .endif
        .endif

        .if box_13_temp == 3

        call box_13_l2
        neg speed_y
        .endif



        ret
    check_b13_coll endp





    check_b14_coll proc                 ; fixed box for level 3

        collision_of_box ball_x_coordinate, ball_y_coordinate, sizee, box14_x_cor, box14_y_cor, height_of_box, width_of_box

        .if level_num == 1
        .if box_temp == 1

        mov box_14_temp, 1
        mov box_temp, 0

        .endif
        .endif


        .if level_num == 2

        .if box_temp == 1

        inc box_14_temp
        mov box_temp, 0

        .endif
        .endif

        .if box_14_temp == 2

        call box_14_l2
        neg speed_y
        .endif



        .if box_14_temp == 2

        inc box_14_temp
        call box_14_l2
        neg speed_y

        .endif

        .if level_num == 3

        .if box_temp == 1

        mov box_temp, 0
    
        neg speed_x
        dec score

        .endif
        .endif


        ret
    check_b14_coll endp





    check_b15_coll proc

        collision_of_box ball_x_coordinate, ball_y_coordinate, sizee, box15_x_cor, box15_y_cor, height_of_box, width_of_box

        .if level_num == 1
        .if box_temp == 1

        mov box_15_temp, 1
        mov box_temp, 0
        .endif
        .endif


        .if level_num == 2

        .if box_temp == 1

        inc box_15_temp
        mov box_temp, 0

        .endif
        .endif

        .if box_15_temp == 2

        call box_15_l2
        neg speed_y

        .endif



        .if level_num == 3

        .if box_temp == 1

        inc box_15_temp
        mov box_temp, 0

        .endif
        .endif

        .if box_15_temp == 3

        call box_15_l2
        neg speed_y

        .endif



        ret
    check_b15_coll endp



    ; CHECKING COLLISIONS FOR LEVEL 2

    box_1_l2 proc

        build_box colorbg, box1_x_cor, box1_y_cor

        ret
    box_1_l2 endp


    box_2_l2 proc

        build_box colorbg, box2_x_cor, box2_y_cor

        ret
    box_2_l2 endp


    box_3_l2 proc

        build_box colorbg, box3_x_cor, box3_y_cor

        ret
    box_3_l2 endp


    box_4_l2 proc

        build_box colorbg, box4_x_cor, box4_y_cor

        ret
    box_4_l2 endp


    box_5_l2 proc

        build_box colorbg, box5_x_cor, box5_y_cor

        ret
    box_5_l2 endp


    box_6_l2 proc

        build_box colorbg, box6_x_cor, box6_y_cor

        ret
    box_6_l2 endp


    box_7_l2 proc

        build_box colorbg, box7_x_cor, box7_y_cor

        ret
    box_7_l2 endp


    box_8_l2 proc

        build_box colorbg, box8_x_cor, box8_y_cor

        ret
    box_8_l2 endp


    box_9_l2 proc

        build_box colorbg, box9_x_cor, box9_y_cor

        ret
    box_9_l2 endp


    box_10_l2 proc

        build_box colorbg, box10_x_cor, box10_y_cor

        ret
    box_10_l2 endp

    box_11_l2 proc

        build_box colorbg, box11_x_cor, box11_y_cor

        ret
    box_11_l2 endp


    box_12_l2 proc

        build_box colorbg, box12_x_cor, box12_y_cor

        ret
    box_12_l2 endp


    box_13_l2 proc

        build_box colorbg, box13_x_cor, box13_y_cor

        ret
    box_13_l2 endp

    box_14_l2 proc

        build_box colorbg, box14_x_cor, box14_y_cor

        ret
    box_14_l2 endp

    box_15_l2 proc

        build_box colorbg, box15_x_cor, box15_y_cor

        ret
    box_15_l2 endp


    ; CALLING MACROS DIFFERENT PROCEDURES FOR MAKING BOXES

    box2 proc
        build_box box2_color, box2_x_cor, box2_y_cor
        ret
    box2 endp

    box3 proc
        build_box box3_color, box3_x_cor, box3_y_cor
        ret
    box3 endp

    box4 proc
        build_box box4_color, box4_x_cor, box4_y_cor
        ret
    box4 endp

    box5 proc
        build_box box5_color, box5_x_cor, box5_y_cor
        ret
    box5 endp

    box6 proc
        build_box box6_color, box6_x_cor, box6_y_cor
        ret
    box6 endp

    box7 proc
        build_box box7_color, box7_x_cor, box7_y_cor
        ret
    box7 endp

    box8 proc
        build_box box8_color, box8_x_cor, box8_y_cor
        ret
    box8 endp

    box9 proc
        build_box box9_color, box9_x_cor, box9_y_cor
        ret
    box9 endp


    box10 proc
        build_box box10_color, box10_x_cor, box10_y_cor
        ret
    box10 endp


    box11 proc
        build_box box11_color, box11_x_cor, box11_y_cor
        ret
    box11 endp


    box12 proc
        build_box box12_color, box12_x_cor, box12_y_cor
        ret
    box12 endp


    box13 proc
        build_box box13_color, box13_x_cor, box13_y_cor
        ret
    box13 endp


    box14 proc
        build_box box14_color, box14_x_cor, box14_y_cor
        ret
    box14 endp


    box15 proc
        build_box box15_color, box15_x_cor, box15_y_cor
        ret
    box15 endp


    ;FUNCTIONS MAINLY FOR MENUS

    LINE macro x_axis,y_axis,color
		push cx

		mov ah,0ch
		mov al,color
		mov bh,0



		mov cx,x_axis
		mov dx,y_axis
		int 10h

		pop cx
	endm

	verticalline proc												;Function for clearing screen by printing colored line
		line2:
			mov ah, 0ch
			mov bx, 0 ;pg number
			mov al, color
			int 10h
			inc dx
			cmp dx, Yaxis
			JE return2
			JNE line2
		return2:
		ret
	verticalline endp

	Border proc														;Function for creating a border

		mov Xaxis, 1
		mov Yaxis, 1
		mov cx,317
		axis:
			LINE Xaxis,Yaxis,14
			inc Xaxis
		loop axis

		mov cx,200
		mov Xaxis,1
		y:
			LINE Xaxis,Yaxis,14
			inc Yaxis
		loop y

		mov cx,200
		mov Xaxis,318
		mov Yaxis,1
		x:
			LINE Xaxis,Yaxis,14
			inc Yaxis
		loop x

		mov cx,317
		mov Yaxis,404
		mov Xaxis,-62
		Z:
			LINE Xaxis,Yaxis,14
			inc Xaxis
		loop Z

		ret
	Border endp

	makebox proc														;Function for creating a box
		
		mov bx, Yvar
		mov Yaxis, bx
		mov Xaxis, 102
		mov cx,100
		axis:						;upper line
			LINE Xaxis,Yaxis,6
			inc Xaxis
		loop axis

		mov cx,16
		mov Xaxis,102
		y:							;left line
			LINE Xaxis,Yaxis,6
			inc Yaxis
		loop y
		
		mov Xaxis,102
		mov cx,100
		x:							;bottom line
			LINE Xaxis,Yaxis,6
			inc Xaxis
		loop x


		mov cx,16

		mov Xaxis,201
		mov bx, Yvar
		mov Yaxis, bx
		Z:							;right line
			LINE Xaxis,Yaxis,6
			inc Yaxis
		loop Z

		ret
	makebox endp

	destroybox proc														;Function for destroying a border

		mov Xaxis, 102
		mov bx, Yvar
		mov Yaxis, bx
		mov cx,100
		axis:						;upper line
			LINE Xaxis,Yaxis,12h
			inc Xaxis
		loop axis

		mov cx,16
		mov Xaxis,102
		y:							;left line
			LINE Xaxis,Yaxis,12h
			inc Yaxis
		loop y
		
		mov Xaxis,102
		mov cx,100
		x:							;bottom line
			LINE Xaxis,Yaxis,12h
			inc Xaxis
		loop x


		mov cx,16

		mov Xaxis,201
		mov bx, Yvar
		mov Yaxis, bx
		Z:							;right line
			LINE Xaxis,Yaxis,12h
			inc Yaxis
		loop Z

		ret
	destroybox endp

	instructions proc														;Function for displaying instructions page

		;for clearing the screen smoothly
		mov bx,0
		mov cx,0
		mov dx,0
		.while cx!=360
			mov dx,0
			mov Yaxis,200
			mov color,12h
			call verticalline
			inc cx
		.endw

		call Border

		mov dh, 2		;row coordinate
		mov dl, 8		;column coordinate
		mov ah,02h
		int 10h			;moving cursor position

		mov dx, offset welcome
		mov ah, 09h
		int 21h

		mov dh, 6		;row coordinate
		mov dl, 1		;column coordinate
		mov ah,02h
		int 10h			;moving cursor position

		mov dx, offset instruction1
		mov ah, 09h
		int 21h

		mov dh, 9		;row coordinate
		mov dl, 1		;column coordinate
		mov ah,02h
		int 10h			;moving cursor position

		mov dx, offset instruction2
		mov ah, 09h
		int 21h

		mov dh, 12		;row coordinate
		mov dl, 1		;column coordinate
		mov ah,02h
		int 10h			;moving cursor position

		mov dx, offset instruction3
		mov ah, 09h
		int 21h

		mov dh, 15		;row coordinate
		mov dl, 1		;column coordinate
		mov ah,02h
		int 10h			;moving cursor position

		mov dx, offset instruction4
		mov ah, 09h
		int 21h

		mov dh, 18		;row coordinate
		mov dl, 1		;column coordinate
		mov ah,02h
		int 10h			;moving cursor position

		mov dx, offset instruction5
		mov ah, 09h
		int 21h

		mov dh, 20		;row coordinate
		mov dl, 3		;column coordinate
		mov ah,02h
		int 10h			;moving cursor position

		mov dx, offset instruction6
		mov ah, 09h
		int 21h

		mov dh, 23		;row coordinate
		mov dl, 3		;column coordinate
		mov ah,02h
		int 10h			;moving cursor position

		mov dx, offset instruction7
		mov ah, 09h
		int 21h

		ret
	instructions endp

	goodbyee proc														;Function for displaying goodbye page

		;for clearing the screen smoothly
		mov bx,0
		mov cx,0
		mov dx,0
		.while cx!=360
			mov dx,0
			mov Yaxis,200
			mov color,0h
			call verticalline
			inc cx
		.endw

		mov dh, 9		;row coordinate
		mov dl, 3		;column coordinate
		mov ah,02h
		int 10h			;moving cursor position

		mov dx, offset goodbye1
		mov ah, 09h
		int 21h

		mov dh, 15		;row coordinate
		mov dl, 13		;column coordinate
		mov ah,02h
		int 10h			;moving cursor position

		mov dx, offset goodbye2
		mov ah, 09h
		int 21h

		mov dh, 0		;row coordinate
		mov dl, 0		;column coordinate
		mov ah,02h
		int 10h			;moving cursor position

		ret
	goodbyee endp

	WritetoFile proc

		;WRITE SCORE TO NAME FIRST

		mov cx, 0
		mov si, offset inputname
		.while cx != 101			;Big While loop
				
				mov al, [si]

			    .if al == '?'		;IF CHARACTER IS ? THEN JUMP OUT
				    jmp getouttt
			    .endif

			    inc si

		     .endw

			 getouttt:
                inc si              ;For readability 
                inc si
				mov al, score 
				add al, 30h
				mov [si], al
				;inc si
				;mov al, score 
				;mov [si], al
				
		
		;WRITING NAME TO HIGH SCORES FILE

		; Open file
		mov ah, 3Dh
		mov al,2
		mov dx,offset FileN
		int 21h
		mov FileH, ax  
    
		; Append file
		mov bx, FileH
		mov cx, 0
		mov dx, 0
		mov ah, 42h
		mov al, 2                   ;APPEND FILE FROM THE END OF THE FILE
		int 21h

		mov ah,40h                  ;Write to file, no cx changing because cx is length of string and is already calculated
		mov bx, FileH
		mov cx, lengthof inputname
		mov dx, offset inputname
		int 21h

		; Close file
		mov ah, 3eh
		mov bx, FileH
		int 21h

		ret
	WritetoFile endp

	ReadfromFile proc
		
		; Open file
		mov ah, 3Dh
		mov al,2
		mov dx,offset FileN
		int 21h
		mov FileH, ax
			
			



		




		; Close file
		mov ah, 3eh
		mov bx, FileH
		int 21h

		ret
	ReadfromFile endp

	DelayFunction proc

		mov ax, 1

		.while ax != 9000

			inc ax
		
		.endw

		ret
	DelayFunction endp

	game_win_or_lose:
		mov bx, 1
		jmp repeeatmenu
		

	exitgame:

    mov ah, 4ch
    int 21h
end
