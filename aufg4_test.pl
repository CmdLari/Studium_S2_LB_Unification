% Autor:
% Datum: 30.07.2015

test(my_unify) :-
    %positiv
    write('my_unify +'),
    my_unify(a(b,_C,d(e,_F,g(h,i,j))),a(_B,c,d(_E,f,_X1))), write('.'),!,
    my_unify(h(r(a),l(X2),g(g(Y2))),h(X2,Y2,_Z2)), write('.'),!,
    my_unify(X3,_Y3), write('.'),!,
    my_unify(X,X),
    %negativ
    write('. -'),!,
    \+ my_unify(h(r(a),l(_Z3),g(g(Y3))),h(X3,Y3,X3)), write('.'),!,
    \+ my_unify(h(r(a),l(Z4),g(g(Y4))),h(_X4,Y4,Z4)), write('.'),!,
    \+ my_unify(f(X5,Y5),f(Y5,f(X5))), write('.'),!,
    \+ my_unify(f(_X6,_Y6),f(a,b,c)), write('.'),!,
    \+ my_unify(n(a,b),f(_X7,_Y7)),!, writeln('ok').

test(occurs_check) :-
    %positiv
    write('occurs_check +'),
    occurs_check(_X,f(_Y)), write('.'),!,
    occurs_check(_X1,h(r(a),l(_Z1),g(g(_Y1)))), write('.'),!,
    occurs_check(_X2,_Y2),
    %negativ
    write('. -'),!,
    \+ occurs_check(X3,f(X3)), write('.'),!,
    \+ occurs_check(X4,h(r(a),l(X4),g(g(_Y4)))), write('.'),!,
    \+ occurs_check(X5,X5),!, writeln('ok').

test(allunify) :-
    test(occurs_check),
    test(my_unify)
    .

test(queens_1) :- queens_N(1,[1]), write('1 +'),!.
test(queens_6) :- queens_N(6,Qs),Qs = [5,3,1,6,4,2], write('6 +'),!.
test(queens_8) :- queens_N(8,Qs),queens_8(Qs), write('8 +'),!.
test(queens_11) :- queens_N(11,Qs),Qs = [1, 3, 7, 10, 2, 9, 6, 4, 11, 8, 5], write('11 +'),!.
test(queens_13) :- queens_N(13,Qs),Qs = [1, 3, 5, 9, 13, 10, 4, 7, 12, 2, 6, 8, 11], writeln('13 +'),!.

test(allqueens) :-
    test(queens_1),
    test(queens_6),
    test(queens_8),
    test(queens_11),
    test(queens_13)
    .

