n(1..n).

k { q(I,J) : n(I), n(J) } k.

attackable_r(X)   :- q(X,Y).
attackable_c(Y)   :- q(X,Y).
attackable_u(X+Y) :- q(X,Y).
attackable_d(X-Y) :- q(X,Y).

:- not attackable_r(I),
   not attackable_c(J),
   not attackable_u(I+J),
   not attackable_d(I-J),
   n(I), n(J).

#show q/2.
