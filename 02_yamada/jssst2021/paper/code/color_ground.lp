% gringo -t -c c=3 graph.lp color.lp
node(1).   node(2).   node(3).   node(4).
edge(1,2). edge(2,3). edge(2,4). edge(3,4).
col(1).    col(2).    col(3).
1 { color(1,1) ; color(1,2) ; color(1,3) } 1.
1 { color(2,1) ; color(2,2) ; color(2,3) } 1.
1 { color(3,1) ; color(3,2) ; color(3,3) } 1.
1 { color(4,1) ; color(4,2) ; color(4,3) } 1.
:- not {color(1,1) ; color(2,1) } 1.
:- not {color(1,2) ; color(2,2) } 1.
:- not {color(1,3) ; color(2,3) } 1.
:- not {color(2,1) ; color(3,1) } 1.
:- not {color(2,2) ; color(3,2) } 1.
:- not {color(2,3) ; color(3,3) } 1.
:- not {color(2,1) ; color(4,1) } 1.
:- not {color(2,2) ; color(4,2) } 1.
:- not {color(2,3) ; color(4,3) } 1.
:- not {color(3,1) ; color(4,1) } 1.
:- not {color(3,2) ; color(4,2) } 1.
:- not {color(3,3) ; color(4,3) } 1.
