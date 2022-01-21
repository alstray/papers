n(1..n).

k { q(I,J) : n(I), n(J) } k.

:- not 1 { q(I,1..n) ;
	   q(1..n,J) ;
	   q(A,B): n(A),n(B),A+B=I+J ;
	   q(A,B): n(A),n(B),A-B=I-J }, n(I), n(J).

#show q/2.
