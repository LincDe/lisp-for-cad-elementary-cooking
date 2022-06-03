
# Start your first lisp program in CAD
In this chapter I'd like to introduce what can lisp programs do in CAD drawing in a simplified way and I will put forward a few examples on how to create your unique programs that can help reduce your workload.
## What can lisp do?
Generally speaking lisp programs can do every command that can be entered manually by the user. It is especially helpful in highly repetitive and calculative works.
## How to create a lisp program?
The first step is to get your self familiar with Visual Lisp Compiler:Visual Lisp Compiler can be found in Tool Bar in CAD.It looks very antique, however the good news is that with this embedded compiler you can apply your program whiout packing it.
## Basice grammer
If you are familiar with Python, C or any other kind of programming language, you will find that lisp is not too difficult to comprehend.  
There are only 2 simple but significant rules in lisp: the bracket and the order of the sentences.  Bracket functions the same as ';' in C, or '.' in English. The word order is always: verb, subject, object.  
eg1: When you want to express "let a equals to 5", we express it as 'a=5' in python, but in lisp we should swap the word order and it will be like (don't forget the bracket):
```
(setq a 5) 
```
eg2: When you want to express "is a>b ?", we express it as 'if a>5' in python, but in lisp we should swap the word order and it will be like:  
(> a 5)  
If you want to apply lisp in CAD, there is one more vital sentence you should put into your mind: (command "key")  
Basically, command means the lisp will press the key operarion just like you press the key board while you do CAD drawing.
eg3: if you want to draw a line from (x1,y1) to (x2,y2):  
(command "LINE" "x1,y1" "x2,y2")  
OR  
(command "LINE"  "x1,y1,0" "x2-x1, y2-y1,0")  
eg4: let us go futher with eg3 and aim to create a "real" lisp program which can draw a line given to 2 coordinate points-(x1,y1) and (x2,y2)  
Now we need to 



