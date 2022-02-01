n(1..n).

k { q(I,J) : n(I), n(J) } k.

attackable(I,J) :- q(A,B), n(I), n(J), A == I.
attackable(I,J) :- q(A,B), n(I), n(J), B == J.
attackable(I,J) :- q(A,B), n(I), n(J), A+B == I+J.
attackable(I,J) :- q(A,B), n(I), n(J), A-B == I-J.

:- not attackable(I,J), n(I), n(J).

#show q/2.
