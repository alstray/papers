n(1..n).
u(2..2*n).
d(1-n..n-1).

k { q(I,J) : n(I), n(J) } k.

{ attackable_r(I) } :- n(I).
{ attackable_c(J) } :- n(J).
{ attackable_u(A) } :- u(A).
{ attackable_d(B) } :- d(B).

:- attackable_r(I), not 1 { q(I,J): n(J) }.
:- attackable_c(J), not 1 { q(I,J): n(I) }.
:- attackable_u(A), not 1 { q(I,J): n(I),n(J),I+J=A }.
:- attackable_d(B), not 1 { q(I,J): n(I),n(J),I-J=B }.

:- not attackable_r(I),
   not attackable_c(J),
   not attackable_u(I+J),
   not attackable_d(I-J),
   n(I), n(J).

#show q/2.
