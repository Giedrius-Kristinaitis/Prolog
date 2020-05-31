% following code removes same elements from a list if they are next to each other leaving only one
last_element([], Y) :- Y is 0.
last_element([X], Y) :- Y is X.
last_element([Head|Tail], Y) :-
    last_element(Tail, Y).

remove_equal_sequence_values([], ReturnList, FirstIteration) :-
    write('List with removed elements: '), nl,
    write(ReturnList).
remove_equal_sequence_values([Head|Tail], ReturnList, FirstIteration) :-
    Tail = [],
    last_element(ReturnList, LastElement),
    (LastElement = Head -> 
        write('List with removed elements: '), nl,
        write(ReturnList) ;
        append(ReturnList, [Head|[]], NewReturnList),
        write('List with removed elements: '), nl,
        write(NewReturnList)
    ).
remove_equal_sequence_values([Head|Tail], ReturnList, FirstIteration) :- 
    last_element(ReturnList, LastElement),
    (LastElement = Head -> 
        remove_equal_sequence_values(Tail, ReturnList, 0) ; 
        (FirstIteration = 1 ->
            remove_equal_sequence_values(Tail, [Head|[]], 0) ;
            append(ReturnList, [Head|[]], NewReturnList), remove_equal_sequence_values(Tail, NewReturnList, 0)
        )
    ).