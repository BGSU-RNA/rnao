:- use_module(library(lists)). % Yap
% uncomment the following to use with XSB
%:- import reverse/2, append/3, ith/3 from basics.

% TODO:
% use full-length predicate names

:- table motif/1.
motif(X):- stemloop(X).
motif(X):- pseudoknot(X).

:- table pseudoknot/1.
pseudoknot(X):-
        stemloop(SL2),
        has_part(SL2,S2),
        stem(S2),
        stemloop(SL1),
        loop(L1),
        has_part(SL1,L1),
        part_of(S2,L1),
        mereological_union(SL1,SL2,X).

:- table stemloop/1.
stemloop(X):-
        stem(S),
        loop(L),
        top_connects(S,L),
        connects_bottom_of(L,S),
        mereological_union(S,L,X).

:- table fullstemloop/1.
fullstemloop(X):-
        fullstem(S),
        loop(L),
        top_connects(S,L),
        connects_bottom_of(L,S),
        mereological_union(S,L,X).

:- table tetraloop/1.
tetraloop(X):-
        loop(X),
        X=[A,B,C,D],
        five_prime_to(S1,A),
        five_prime_to(D,S2),
        pairs_with_CWW(S1,S2).

:- table gnra_tetraloop/1.
gnra_tetraloop(X):-
        tetraloop(X),
        has_base_at(X,B1,1),
        has_base_at(X,B3,3),
        has_base_at(X,B4,4),
        g(B1),
        purine(B3),
        a(B4).

:- table gnra_tetraloop_with_TSH/1.
gnra_tetraloop_with_TSH(X):-
        gnra_tetraloop(X),
        has_base_at(X,B1,1),
        has_base_at(X,B4,4),
        pairs_with_TSH(B1,B4).

:- table gnra_hairpin_loop/1.
gnra_hairpin_loop(X):-
        loop(X),
        has_base_at(X,B1,1),
        has_base_at(X,B4,4),
        pairs_with_TSH(B1,B4).

:- table bulge/1.
bulge(L):-
        stem(S1),
        loop(L),
        top_connects(S1,L),
        stem(S2),
        connects_top_of(L,S2),
        bottom_connects_bottom_of(S2,S1).

:- table bulge2/1.
bulge2(L12-L34):-
        base(B1),
        pairs_with(B1,B4),
        base(B4),
        five_prime_to(B1,B1x),
        loop(L12),
        has_start_base(L12,B1x),
        has_end_base(L12,B2x),
        five_prime_to(B2x,B2),
        pairs_with(B2,B3),
        five_prime_to(B3,B3x),
        has_start_base(L34,B3x),
        loop(L34),
        has_end_base(L34,B4x),
        five_prime_to(B4x,B4).
        

hhead_III(X):-
        stem(S1),
        loop(L1),
        stemloop(SL2),
        loop(L2),
        stemloop(SL3),
        loop(L3),
        has_part(SL2,S2),
        has_part(SL3,S3),
        top_connects(S1,L1),
        strand_connects_to_start_of_stem(L1,S2),
        top_connects(S2,L2),
        strand_connects_to_start_of_stem(L2,S3),
        top_connects(S3,L3),
        strand_connects_to_start_of_stem(L3,S1).


:- table internal_loopset/1.
internal_loopset(L):-
        stem(S1),
        loop(L1),
        stem(S2),
        loop(L2),
        top_connects(S1,L1),
        strand_internally_connects_start_of_stem(L1,S2),
        stem_end_connects_start_of_strand(S2,L2),
        connects_bottom_of(L2,S1),
        mereological_union(L1,L2,L).

%loop_chain([L]):- loop(L).



:- table consecutive_bases/1.
consecutive_bases(BP):-
        base(X),
        base(Y),
        five_prime_to(X,Y),
        mereological_union(X,Y,BP).

:- table nt_sequence/1.
nt_sequence([S]):-
        base(S).

nt_sequence([X,Y|T]):-
        five_prime_to(X,Y),
        nt_sequence([Y|T]).

:- table ss_sequence/1.
ss_sequence([S]):-
        unpaired_CWW_base(S).
ss_sequence([X,Y|T]):-
        five_prime_to(X,Y),
        unpaired_CWW_base(X),
        ss_sequence([Y|T]).

:- table loop/1.
loop(S):-
        ss_sequence(S).

:- table base_pair/1.
base_pair(BP):-
        base(X),
        base(Y),
        pairs_with(X,Y),
        mereological_union(X,Y,BP).

%% stem(X)
% stored as two seqs, the second is 3 to 5
:- table stem/1.
stem([X-Y]):-
        pairs_with(X,Y).
stem([X-Y,X2-Y2|L]):-
        pairs_with(X,Y),
        five_prime_to(X,X2),
        five_prime_to(Y2,Y),
        stem([X2-Y2|L]).

:- table fullstem/1.
fullstem(X):-
        stem(X),
        X=[_,_|_], 
        \+ ((stem(Y),top_connects_top_of(X,Y))),
        \+ ((stem(Y),top_connects_top_of(Y,X))).



% ========================================
% ontology of base types
% ========================================
base(X):- purine(X).
base(X):- pyrimidine(X).

purine(X):- a(X).
purine(X):- u(X).
pyrimidine(X):- g(X).
pyrimidine(X):- c(X).

unpaired_CWW_base(X):- base(X),\+ pairs_with_CWW(X,_).

% ========================================
% nucleic acid connection relations
% ========================================

% *** (strand,strand) ***

% --[A]--> --[B]-->
% e.u.s-
strand_upstream_adjacent_to_strand(X,Y):-
        has_end_base(X,B1),
        five_prime_to(B1,B2),
        has_start_base(Y,B2).

% --[B]--> --[A]--> 
% s.d.e-
strand_downstream_adjacent_to_strand(X,Y):-
        strand_upstream_adjacent_to_strand(Y,X).

% *** (stem,stem) ***

% e1.u.s1-
top_connects_top_of(X,Y):-
        end_of_strand1(X,B1),
        five_prime_to(B1,B2),
        start_of_strand1(Y,B2).

% e2.u.s1-
bottom_connects_top_of(S1,S2):-
        end_of_strand2(S1,B1),
        five_prime_to(B1,B2),
        start_of_strand1(S2,B2).

% e2.u.s2-
bottom_connects_bottom_of(S1,S2):-
        end_of_strand2(S1,B1),
        five_prime_to(B1,B2),
        start_of_strand2(S2,B2).

% *** (stem, strand)

% internal break of stem
% e1.u.s-
top_connects(S,L):-
        end_of_strand1(S,B1),
        five_prime_to(B1,B2),
        has_start_base(L,B2).

% e.u.s2-
connects_bottom_of(L,S):-
        has_end_base(L,B1),
        five_prime_to(B1,B2),
        start_of_strand2(S,B2).

% e.u.s1-
connects_top_of(L,S):-
        has_end_base(L,B1),
        five_prime_to(B1,B2),
        start_of_strand1(S,B2).

has_first_base(X,B):- has_base_at(X,B,1).
has_last_base(X,B):- reverse(X,XR),has_first_base(XR,B,1).

:- table has_base_at/3.
has_base_at(X,B,Pos):-
        nth(Pos,X,B).
        
:- table has_start_base/2.
% s
has_start_base([X|_],X).

:- table has_end_base/2.
% e
has_end_base(S,X):-
        reverse(S,[X|_]).

:- table start_of_strand1/2.
% p1-.s
start_of_strand1([X-_|_],X).

:- table end_of_strand1/2.
% p1-.e
end_of_strand1(SS,X):-
        reverse(SS,[X-_|_]).

:- table start_of_strand2/2.
% p2-.s
start_of_strand2(SS,X):-
        reverse(SS,[_-X|_]).

:- table end_of_strand2/2.
% p2-.e
end_of_strand2([_-X|_],X).

% sub-relations
:- table pairs_with/2.
pairs_with(X,Y):- pairs_with_CWW(X,Y).

:- table pairs_with_CWW/2.
pairs_with_CWW(X,Y):- pairs_with_CWW(Y,X).

pairs_with(X,Y):- pairs_with_THS(X,Y).

:- table pairs_with_TSH/2.
pairs_with_TSH(X,Y):- pairs_with_THS(Y,X).

%%TODO pairs_with(X,Y):- pairs_with(Y,X).

mereological_union(X,Y,Z):-
        is_list(X),
        is_list(Y),
        append(X,Y,Z).
mereological_union(X,Y,Z):-
        \+ is_list(X),
        \+ is_list(Y),
        sort([X,Y],Z).

transitive_five_prime_to(X,Y):- five_prime_to(X,Y).
transitive_five_prime_to(X,Y):- five_prime_to(X,Z), transitive_five_prime_to(Z,Y).

%base(X):- five_prime_to(X,_).
%base(X):- five_prime_to(_,X).



% ========================================
% utility
% ========================================

wstemloops:-
        forall(stemloop(X),
               (   write(X),nl)).
