:- module(about_lists, 
	[my_first/2, my_last/2, my_penultimate/2, my_element_at/3,
	my_number_of/2, my_reverse/2, is_palindrome/1, my_flatten/2,
	my_compress/2, my_pack/2, my_encode/2, my_encode_modified/2,
	my_encode_reverse/2, my_encode_direct/2, my_duplicate/2,
	my_duplicate_for_n/3, my_drop/3, my_split/4, my_slice/4,
	my_rotate/3, remove_at/4, insert_at/4, range/3, my_reverse_impl/4]).

my_first(X, [X]).
my_first(X, [X|_]).
    
my_last(X, [X]).
my_last(X, [_|Rest]) :-
  my_last(X, Rest).

my_penultimate(X, [_|T]) :- my_penultimate(X, T).
my_penultimate(X, [X|[_]]).

my_element_at(X, [X|_], 1).
my_element_at(X, [_|Rest], N) :-
  M is N - 1,
  my_element_at(X, Rest, M).

my_number_of(0,[]).
my_number_of(1,[_]).
my_number_of(N,[_|Rest]) :-
  my_number_of(M,Rest),
  N is M + 1.

my_reverse_impl(L1, L2, N, N) :-
  my_last(X, L1),
  my_first(X, L2).

my_reverse_impl(L1, L2, N, Length) :-
  N < Length,
  my_element_at(X, L1, N),
  M is Length + 1 - N,
  my_element_at(X, L2, M),
  N_next is N + 1,
  my_reverse_impl(L1, L2, N_Next, Length).

my_reverse([A],[A]).
my_reverse(L1, L2) :-
  my_number_of(Length, L1),
  my_number_of(Length, L2),
  my_reverse_impl(L1, L2, 1, Length).

is_palindrome(L) :- my_reverse(L, L).

my_flatten([],[]).
my_flatten(Item,[Item]) :- \+ is_list(Item).
my_flatten([Item],Flattened) :-
  is_list(Item),
  my_flatten(Item, Flattened).
my_flatten([First|Rest], Flattened) :-
  my_flatten(First, First_flattened),
  my_flatten(Rest, Rest_flattened),
  append(First_flattened, Rest_flattened, Flattened).

my_compressed([], []).
my_compress([A],[A]).
my_compress([A|[A|Rest]], Compressed) :- my_compress([A|Rest], Compressed).
my_compress([A|[B|Rest]], Compressed) :-
  my_compress([B|Rest], Rest_Compressed),
  Compressed = [A|Rest_Compressed].


my_first_bin(Bin, [First|Rest], Remaining) :-
  


my_pack([], []).
my_Pack([A], [A]).
my_pack([Item|Rest], [FirstBin|LaterBins]) :-
  my_first(Item, FirstBin),
  append(Bin, [Item], NewBin)
  



my_encode(_,_) :- false.

my_encode_modified(_,_) :- false.

my_encode_reverse(_,_) :- false.

my_encode_direct(_,_) :- false.

my_duplicate(_,_) :- false.

my_duplicate_for_n(_,_,_) :- false.

my_drop(_,_,_) :- false.

my_slice(_,_,_,_) :- false.

my_split(_,_,_,_) :- false.

my_rotate(_,_,_) :- false.

remove_at(_,_,_,_) :- false.

insert_at(_,_,_,_) :- false.

range(_,_,_) :- false.
