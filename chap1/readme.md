
# Start your first lisp program in CAD
In this chapter I'd like to introduce what can lisp programs do in CAD drawing in a simplified way and I will put forward a few examples on how to create your unique programs that can help reduce your workload.
## What can lisp do?
Generally speaking lisp programs can do every command that can be entered manually by the user. It is especially helpful in highly repetitive and calculative works.
## How to create a lisp program?
The first step is to get your self familiar with Visual Lisp Compiler:Visual Lisp Compiler can be found in Tool Bar in CAD.It looks very antique, however the good news is that with this embedded compiler you can apply your program whiout packing it. Just creat a new lsp file to start your programming! 
## Basic grammer - Logically Speaking
If you are familiar with Python, C or any other kind of programming language, you will find that lisp is not too difficult to comprehend.  
There are only 2 simple but significant rules in lisp: the bracket and the order of the sentences.  Bracket functions the same as ';' in C, or '.' in English. The word order is always: verb, subject, object.  
eg1: When you want to express "let a equals to 5", we express it as 'a=5' in python, but in lisp we should swap the word order and it will be like (don't forget the bracket):
```
(setq a 5) 
```
eg2: When you want to express "is a>b ?", we express it as 'if a>5' in python, but in lisp we should swap the word order and it will be like:  
```
(> a 5)  
```
If you want to apply lisp in CAD, there is one more vital sentence you should put into your mind: (command "key")  
Basically, command means the lisp will press the key operarion just like you press the key board while you do CAD drawing.  
eg3: if you want to draw a line from (x1,y1) to (x2,y2):  
```
(command "LINE" "x1,y1" "x2,y2")  
```
OR  
```
(command "LINE"  "x1,y1,0" "x2-x1, y2-y1,0")  
```
eg4: let us go futher with eg3 and aim to create a "more pratical" lisp program which can draw a line given to 2 coordinate points - (x1,y1) and (x2,y2). In order to do that you should know this sentence:
```
(getstring "\n Sth you wish to remind：")
```
This is a practical way out when you don't need users to enter a bunch of parameters and it's especially useful if you don't want to add a dialog box in your program. Now with "getstring" we can set (x1,y1) and (x2,y2) to 2 parameters, let's say a and b:  
```
(setq a (getstring "\n enter (x1,y1)："))
(setq b (getstring "\n enter (x2,y2)："))
```
## Fuctions
We are very close to success now!  
The function format in lisp is like:  
```
(defun FUNCTION_NAME(a,b,c...)

)
```
OR
```
(defun C: FUNCTION_NAME(a,b,c...)

)
```
"a,b,c..."stands for the parameters  
The difference between the first expression and the second expression:  
If you want to use shortcut key to get access to the function - namely, the main function- you should use the second format with "C:". If you write this function in a bigger project and the function will only be allowed to be accessed by the main function, then let's choose the first format.  
## To sum up
1. To learn to create lisp program, you shold bare in mind 2 grammery features: () and verb-first order.  
2. Lisp program canbe compiled in a embedded compiler in CAD and canbe tested line-by-line. Thus you don't have to pack your code in a function to test/use it, however if the code is packed in a main function it will be much easier to share it with your colleagues and more pratical. If you are not sure what result your code will return, just run it (line-by-line) and see if it is what you want.
3. To check more basic grammar expressions, see reference: https://www.yiibai.com/lisp/lisp_decisions.html  


