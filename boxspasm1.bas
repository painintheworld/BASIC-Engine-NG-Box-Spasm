1 'Excluding lines 960-980 speeds things up!
2 'Change fr values on line 990 to change refresh rate for drawing
3 'Yes, the code is sloppy...I had an idea this evening and
4 'knocked this our right fast
5 'Change RX or RY random values as desired
6 'Setting it to 5 and removing VSYNC makes
7 'the box go into spasms :)
10 CPUSPEED 100
20 X=227:Y=110
100 SCREEN 14:PALETTE 2
110 GOSUB &colorchart
150 maxx=PSIZE(0)-1:maxy=PSIZE(1)-1
160 centerx=INT(maxx/2)
165 centery=INT(maxy/2)
170 boxwidth=24:boxheight=24
180 OT=TICK()
300 WHILE INKEY$=""
305   NT=(TICK()-OT)/1000
310   OX=X:OY=Y
320   RX=RND(5):RY=RND(5)
330   IF RX=1 THEN
335     X=X+1
340   ENDIF
350   IF RY=2 THEN
355     Y=Y+1
360   ENDIF
365   IF RX=3 THEN
370     X=X-1
375   ENDIF
380   IF RY=4 THEN
385     Y=Y-1
390   ENDIF
400   IF X<0 THEN X=0
405   IF X>455 THEN X=455
410   IF Y<0 THEN Y=0
415   IF Y>245 THEN Y=245
430   IF OX<>X OR OY<>Y THEN
435     RECT OX,OY,OX+boxwidth,OY+boxheight,0,0
440     RECT X,Y,X+boxwidth,Y+boxwidth,orange,deepred
450   ENDIF
950   N=N+1
960   LOCATE 0,31
970   PRINT N;" ITERATIONS";
975   LOCATE 0,32
980   PRINT NT;" SECONDS";
985   fr=FRAME()
990   VSYNC fr+1
1000 WEND
1500 COLOR deepred:SCREEN 15:LIST
1999 END
5000 &colorchart
5005 deepred=RGB(188,30,30)
5010 orange=RGB(255,162,0)
5015 darkorange=RGB(209,132,0)
5020 yellow=RGB(247,255,0)
5025 yellow172=RGB(255,190,66)
5090 RETURN
