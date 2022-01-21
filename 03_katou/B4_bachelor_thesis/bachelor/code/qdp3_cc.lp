n(1..n).
u(2..2*n).
d(1-n..n-1).

{ q(I,J) : n(I), n(J) } .

1 { row(I,0..k) } 1 :- n(I).
1 { col(J,0..k) } 1 :- n(J).
1 { dup(A,0..k) } 1 :- u(A).
1 { ddn(B,0..k) } 1 :- d(B).

:- row(I,N), not N { q(I,J):n(J) } N.
:- col(J,N), not N { q(I,J):n(I) } N.
:- dup(A,N), not N { q(I,J):n(I),n(J),I+J=A } N.
:- ddn(B,N), not N { q(I,J):n(I),n(J),I-J=B } N.

% 各行，各列，各対角線のクイーンの合計がkである
:- not k #sum { N,I : row(I,N) } k.
:- not k #sum { N,J : col(J,N) } k.
:- not k #sum { N,A : dup(A,N) } k.
:- not k #sum { N,B : ddn(B,N) } k.

% 全てのマスについてアタック可能なクイーンが一つ以上存在
:- not 1 #sum { M:row(I,M); N:col(J,N); Q:dup(I+J,Q); P:ddn(I-J,P) },n(I),n(J).

#show q/2.
