% following code counts the number of numbers in a list
is_number(X, Y) :-
    number(X);
    Y is 0.
    
increment(X, Y) :-
    Y is X + 1.

count_numbers([], Count) :- Count is 0.
count_numbers([Head|Tail], Count) :-
    Tail = [],
    is_number(Head, IsNumber),
    (IsNumber = 1 -> 
        increment(Count, NewCount),
        write('Number count: '),
        write(NewCount), nl ;
        write('Number count: '),
        write(Count), nl
    ).
    
count_numbers([Head|Tail], Count) :-
    is_number(Head, IsNumber),
    (IsNumber = 1 -> 
        increment(Count, NewCount),
        count_numbers(Tail, NewCount) ;
        count_numbers(Tail, Count)
    ).