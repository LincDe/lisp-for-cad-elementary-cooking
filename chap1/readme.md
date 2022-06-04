
# Start your first lisp program in CAD
In this chapter I'd like to introduce what can lisp programs do in CAD drawing in a simplified way and I will put forward a few examples on how to create your unique programs that can help reduce your workload.  
本章节将通过几个例子介绍lisp程序入门及其如何减少CAD制图工作量。  
## What can lisp do?
Generally speaking lisp programs can do every command that can be entered manually by the user. It is especially helpful in highly repetitive and calculative works.  
通常来书通过lisp程序可以实现所有通过快捷键人工输入的部分，有望减少大幅高重复性和有需要大量计算的工作的工作量。  
## How to create a lisp program?
The first step is to get your self familiar with Visual Lisp Compiler:Visual Lisp Compiler can be found in Tool Bar in CAD.It looks very antique, however the good news is that with this embedded compiler you can apply your program whiout packing it. Just creat a new lsp file to start your programming!  
第一步：打开CAD自带的visual lisp编译器（在CAD工具栏-工具中找到）。新建一个.lsp文件即可开始编写程序。  
## Basic grammer - Logically Speaking
If you are familiar with Python, C or any other kind of programming language, you will find that lisp is not too difficult to comprehend. Well, don't worry if you never coded before, we can comprehend lisp in a linuistic perspect.  
There are only 2 simple but significant rules in lisp: the bracket and the order of the sentences.  Bracket functions the same as ';' in C, or '.' in English. The word order is always: verb, subject, object.  
如果你熟悉Python，C或任意一门编程语言，熟悉lisp这个过程会比较简单。即使不了解其他的编程语言问题也不大，我们可以用语言学的知识去解释。Lisp语言两个显著的特点是括号（类似句子的句号）和动词在前的语序。
  
eg1: When you want to express "let a equals to 5", we express it as 'a=5' in python. Both are in a "Subject-verb-object" order. But in lisp we should swap the word order and it will be like (don't forget the bracket):  
例1：如果你想说让a等于5，在python中它会被写成“a=5”，都为“主谓宾”顺序。而在lisp中我们应该交换谓语和主语的位置（别忘了括号）：  
```
(setq a 5) 
```
eg2: When you want to express "is a>b ...?", we express it as 'if a>5' in python, but in lisp we should swap the word order and it will be like:  
例2：如果你想说a大于b吗？，在python中它会被写成“if a>5 ”。而在lisp中我们应该交换谓语和主语的位置，像这样：
```
(if (> a 5) 
  (...)
  )
```
If you want to apply lisp in CAD, there is one more vital sentence you should put into your mind: (command "key")  
Basically, command means the lisp will press the key operarion just like you press the key board while you do CAD drawing.  
如果你想在CAD中运用lisp语言那么 (command "key")  这个句子非常重要。它等同于你在键盘上按下对应的快捷键，即command lisp帮你干活。  
  
eg3: if you want to draw a line from (x1,y1) to (x2,y2):  
例3：画过（x1,y1）(x2,y2)的线段：
```
(command "LINE" "x1,y1" "x2,y2")  
```
OR  
```
(command "LINE"  "x1,y1,0" "x2-x1, y2-y1,0")  
```
eg4: let us go futher with eg3 and aim to create a more complicated and "more pratical" lisp program which can draw a line given to 2 coordinate points - (x1,y1) and (x2,y2). In order to do that you should know this sentence:  
例4：试着去编写更复杂“实用”的lisp程序吧，如输入两个点的坐标，让程序绘制过该两点的线段（并不实用[doge]）。那么你需要知道如何输入参数值：
```
(getstring "\n Sth you wish to remind：")
```
This is a practical way out when you don't need users to enter a bunch of parameters and it's especially useful if you don't want to add a dialog box in your program. Now with "getstring" we can set (x1,y1) and (x2,y2) to 2 parameters, let's say a and b:  
如果你不想给你的小破程序特地加一个对话框函数的话这个句子非常有用哦[dege]~把两个点的数值传给参数a和b应该这样写（运行这两句话你就可以在CAD界面输入这两个点的坐标了）：
```
(setq a (getstring "\n enter (x1,y1)："))
(setq b (getstring "\n enter (x2,y2)："))
```
## Fuctions
We are very close to success now!  
The function format in lisp is like:  
Ok,例4马上就要写出来啦！为了后续更好的利用我们要把写好的句子封装在函数里面。函数应该这样写：
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
"a,b,c..."是你想要传入函数的变量。  
两个格式不同的地方在于第一种格式不属于主函数，这样的函数格式主要运用在子函数中，方便主函数调用子函数片段。第二个有“C:”的函数格式才是主函数的格式，这里的Function name指的就是这个函数的快捷键。在cad中加载（appload）相应lsp文件后可以输入这个快捷键运行你的函数。
## To sum up
1. To learn to create lisp program, you shold bare in mind 2 grammery features: () and verb-first order.  or （verb subject object）
2. Lisp program canbe compiled in a embedded compiler in CAD and canbe tested line-by-line. Thus you don't have to pack your code in a function to test/use it, however if the code is packed in a main function it will be much easier to share it with your colleagues and more pratical. If you are not sure what result your code will return, just run it (line-by-line) and see if it is what you want.
3. To check more basic grammar expressions, check chap1-grammar.lsp or reference: https://www.yiibai.com/lisp/lisp_decisions.html    

小结：  
1. 你需要知道lisp基本格式：（谓语 主语 宾语）
2. lisp程序可以直接在CAD内嵌的编译器中运行（选择想要运行的行，点击运行这些行）。所以编写测试阶段/临时使用没有必要一次次的在别的cad中加载这个lsp文件。但是封装函数通过加载app的方式运行可以让你的程序更有实用性，更方便分享。
3. 更多基础语法详见：chap1-grammar.lsp或 https://www.yiibai.com/lisp/lisp_decisions.html 


