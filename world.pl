% Author: binesiyu
% Date: 2016/7/19

:- discontiguous
   que/2,
   ins/2,
   inh/2.

%类型
que(type,'what?').
que(type,'how?').
que(type,'why?').

%对象类
que(class,'new?').
ins(class,type).

%对象
inh(object,class).
que(object,'time?').
que(object,'space?').


%名字空间
inh(name,object).


%人

inh(people,object).
has(people,name).


ins(myself,people).
fact(myself,name,'yubin').
name(myself,'yubin').


q(X,_):-
    que(X,Q),
    write(Q),
    nl,fail.
q(X,O):-
    has(X,H),
    Calc =.. [H,O,P],
    call(Calc),
    write(H),
    write(':'),
    write(P),
    nl,fail.
    
q(X,O):-
    inh(X,H),
    q(H,O),
    fail.
    
q(X,O):-
    ins(X,I),
    q(I,O),
    fail.

q(_,_):-true.


qo(X):-q(X,X).

qself:-qo(myself).