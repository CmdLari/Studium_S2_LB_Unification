:-[aufg4_test].

occurs_check(Variable, Term):-
    var(Variable),
    var(Term),
    not(Variable==Term).

occurs_check(Variable, Term):-
    nonvar(Term),
    Term=..[OP|Args],
    occurs_check_list(Variable, Args).

occurs_check_list(Variable, [Arg|Tail]):-
    occurs_check(Variable, Arg),
    occurs_check_list(Variable, Tail).

occurs_check_list(Variable, []):-write(true), true.

my_unify_unify_unify([A1H|A1T], [A2H|A2T], SUB) :-
    my_unify_unify(A1H, A2H, SUB),
    my_unify_unify_unify(A1T, A2T, SUB).

my_unify_unify_unify([], [], _).

my_unify(Term1, Term2) :-
    my_unify_unify(Term1, Term2, SUB),
    write(SUB).

my_unify_unify(Term1, Term2, SUB) :-
    var(Term1),
    var(Term2),
    Term1 = Term2,
    SUB = Term1.

my_unify_unify(Term1, Term2, SUB) :-
    var(Term1),
    nonvar(Term2),
    occurs_check(Term1, Term2),
    Term2 =.. [OP|Args],
    length(Args, 1),
    Term1 = Term2,
    SUB = Term1.

my_unify_unify(Term1, Term2, SUB) :-
    nonvar(Term1),
    var(Term2),
    occurs_check(Term1, Term2),
    Term1 =.. [OP|Args],
    length(Args, 1),
    Term1 = Term2,
    SUB = Term1.

my_unify_unify(Term1, Term2, SUB) :-
    nonvar(Term1),
    nonvar(Term2),
    %occurs_check(Term1, Term2),
    Term1 =.. [OP1|Args1],
    Term2 =.. [OP2|Args2],
    OP1 == OP2,
    length(Args1, Length1),
    length(Args2, Length2),
    Length1 == Length2,
    my_unify_unify_unify(Args1, Args2, SUB).
