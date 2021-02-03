%all of the triangle observations first ensure the three points
%make a triangle at all, just to be safe and avoid possible errors
%stemming from invalid points.

%equilateral determines the angles of the triangle
%and then ensures they are all equal to one another.

equilateral(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)) :-
    triangle(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)),
    distance(point2d(X1, Y1), point2d(X2, Y2), A),
    distance(point2d(X1, Y1), point2d(X3, Y3), B),
    distance(point2d(X3, Y3), point2d(X2, Y2), C),
    angle(A, B, C, Aa),
    angle(B, A, C, Ba),
    angle(C, A, B, Ca),
    Aa =:= Ba,
    Ba =:= Ca.

%isosceles computes all of the side lenghts and then ensures
%at least 2 of the sides have the same lenghts.
%it also accepts all 3 sides being equal as equilateral
%triangle is just a special case of an isosceles

isosceles(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)) :-
    triangle(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)),
    distance(point2d(X1, Y1), point2d(X2, Y2), A),
    distance(point2d(X1, Y1), point2d(X3, Y3), B),
    distance(point2d(X3, Y3), point2d(X2, Y2), C),
    (A =\= B, A =:= C;
    A =\= C, A =:= B;
    A =\= B, B =:= C;
    A =:= B, A =:= C).

%right calculates all of the angles of the triangle
%and then sees if one of those angles is 90 degrees.

right(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)) :-
    triangle(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)),
    distance(point2d(X1, Y1), point2d(X2, Y2), A),
    distance(point2d(X1, Y1), point2d(X3, Y3), B),
    distance(point2d(X3, Y3), point2d(X2, Y2), C),
    angle(A, B, C, Aa),
    angle(B, A, C, Ba),
    angle(C, A, B, Ca),
    (Aa =:= 90;
    Ba =:= 90;
    Ca =:= 90).

%acute calculates all of the angles of the triangle
%and then checks to see if all 3 angles are less than 
%90 degrees

acute(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)) :-
    triangle(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)),
    distance(point2d(X1, Y1), point2d(X2, Y2), A),
    distance(point2d(X1, Y1), point2d(X3, Y3), B),
    distance(point2d(X3, Y3), point2d(X2, Y2), C),
    angle(A, B, C, Aa),
    angle(B, A, C, Ba),
    angle(C, A, B, Ca),
    Aa < 90,
    Ba < 90,
    Ca < 90.

%obtuse calculates all of the angles of the triangle and then
%checks that one of the angles is greater than 
%90 degrees

obtuse(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)) :-
    triangle(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)),
    distance(point2d(X1, Y1), point2d(X2, Y2), A),
    distance(point2d(X1, Y1), point2d(X3, Y3), B),
    distance(point2d(X3, Y3), point2d(X2, Y2), C),
    angle(A, B, C, Aa),
    angle(B, A, C, Ba),
    angle(C, A, B, Ca),
    (Aa > 90;
    Ba > 90;
    Ca > 90).

%scalene calculates all three side lengths of the triangle
%and then ensures that no side is equal to any other side
%length 

scalene(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)) :-
    triangle(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)),
    distance(point2d(X1, Y1), point2d(X2, Y2), A),
    distance(point2d(X1, Y1), point2d(X3, Y3), B),
    distance(point2d(X3, Y3), point2d(X2, Y2), C),
    A =\= B,
    A =\= C,
    C =\= B.

%line calculates the area given by the points
%and if the area is zero then the points are determined
%to be a line
line(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)) :-
    area(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3), A),
    A =:= 0.

%triangle is like line, where it computes the area
%of the given points, and if the area is not zero then
%it is determined to be a triangle

triangle(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)) :-
    area(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3), A),
    A =\= 0.

%distance takes two points and calculates the 
%distance between them. This distance is the
%side length of the triangle.

distance(point2d(X1,Y1), point2d(X2,Y2), D) :-
    D is sqrt((X2-X1)^2 + (Y2 - Y1)^2).


%area uses the triangle area formula and determines
%the area of three given points.

area(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3), A) :-
    A is (X1*(Y2-Y3) + X2*(Y3-Y1) + X3*(Y1-Y2))/2.

%horizontal checks to see that the two Y
%values of the points are the same,
%and that the X values are not the same.
%if the X values were the same then it would not
%be a line at all, just a single point.

horizontal(point2d(X1,Y1), point2d(X2,Y2)) :-
    Y1 =:= Y2,
    X1 =\= X2.


%vertical checks to see that the two X
%values of the points are the same,
%and that the Y values are not the same.
%if the Y values were the same then it would not
%be a line at all, just a single point.

vertical(point2d(X1,Y1), point2d(X2,Y2)) :-
    X1 =:= X2,
    Y1 =\= Y2.

%angle uses the SSS (Side-Side-Side) formula to
%determine the angle that generates a line of length
%X

angle(X, Y, Z, A) :-
    Co is acos((Y^2 + Z^2 - X^2)/(2*Y*Z)),
    A is integer(Co*(180/pi)).




query(line(point2d(0,0), point2d(2,4), point2d(5,0))).
query(line(point2d(0,0), point2d(3,2), point2d(6,4))).
query(line(point2d(0,0), point2d(5,0), point2d(2.5,sqrt(18.75)))).


query(triangle(point2d(0,0), point2d(2,4), point2d(5,0))).
query(triangle(point2d(0,0), point2d(3,2), point2d(6,4))).
query(triangle(point2d(0,0), point2d(5,0), point2d(2.5,sqrt(18.75)))).


query(equilateral(point2d(0,0), point2d(2,4), point2d(5,0))).
query(isosceles(point2d(0,0), point2d(2,4), point2d(5,0))).
query(right(point2d(0,0), point2d(2,4), point2d(5,0))).
query(scalene(point2d(0,0), point2d(2,4), point2d(5,0))).
query(acute(point2d(0,0), point2d(2,4), point2d(5,0))).
query(obtuse(point2d(0,0), point2d(2,4), point2d(5,0))).

query(equilateral(point2d(0,0), point2d(5,0), point2d(2.5,sqrt(18.75)))).
query(isosceles(point2d(0,0), point2d(5,0), point2d(2.5,sqrt(18.75)))).
query(right(point2d(0,0), point2d(5,0), point2d(2.5,sqrt(18.75)))).
query(scalene(point2d(0,0), point2d(5,0), point2d(2.5,sqrt(18.75)))).
query(acute(point2d(0,0), point2d(5,0), point2d(2.5,sqrt(18.75)))).
query(obtuse(point2d(0,0), point2d(5,0), point2d(2.5,sqrt(18.75)))).

query(line(point2d(1,2), point2d(2,4), point2d(3,6))).
query(line(point2d(1,2), point2d(2,4), point2d(3,8))).
query(line(point2d(1,2), point2d(2,4), point2d(10,20))).

query(vertical(point2d(1,2), point2d(2,4))).
query(vertical(point2d(1,2), point2d(1,4))).
query(vertical(point2d(1,2), point2d(3,2))).

query(horizontal(point2d(1,2), point2d(2,4))).
query(horizontal(point2d(1,2), point2d(1,4))).
query(horizontal(point2d(1,2), point2d(3,2))).

query(triangle(point2d(1,2), point2d(2,4), point2d(3,6))).
query(triangle(point2d(1,2), point2d(2,4), point2d(3,8))).
query(triangle(point2d(1,2), point2d(2,4), point2d(10,20))).

query(triangle(point2d(2,3), point2d(6,3), point2d(4,3 + sqrt(12)))).
query(equilateral(point2d(2,3), point2d(6,3), point2d(4,3 + sqrt(12)))).
query(isosceles(point2d(2,3), point2d(6,3), point2d(4,3 + sqrt(12)))).
query(right(point2d(2,3), point2d(6,3), point2d(4,3 + sqrt(12)))).
query(scalene(point2d(2,3), point2d(6,3), point2d(4,3 + sqrt(12)))).
query(acute(point2d(2,3), point2d(6,3), point2d(4,3 + sqrt(12)))).
query(obtuse(point2d(2,3), point2d(6,3), point2d(4,3 + sqrt(12)))).

query(triangle(point2d(2,2), point2d(5,2), point2d(3.5,-2))).
query(equilateral(point2d(2,2), point2d(5,2), point2d(3.5,-2))).
query(isosceles(point2d(2,2), point2d(5,2), point2d(3.5,-2))).
query(right(point2d(2,2), point2d(5,2), point2d(3.5,-2))).
query(scalene(point2d(2,2), point2d(5,2), point2d(3.5,-2))).
query(acute(point2d(2,2), point2d(5,2), point2d(3.5,-2))).
query(obtuse(point2d(2,2), point2d(5,2), point2d(3.5,-2))).

query(triangle(point2d(0,0), point2d(-2,2), point2d(4,4))).
query(equilateral(point2d(0,0), point2d(-2,2), point2d(4,4))).
query(isosceles(point2d(0,0), point2d(-2,2), point2d(4,4))).
query(right(point2d(0,0), point2d(-2,2), point2d(4,4))).
query(scalene(point2d(0,0), point2d(-2,2), point2d(4,4))).
query(acute(point2d(0,0), point2d(-2,2), point2d(4,4))).
query(obtuse(point2d(0,0), point2d(-2,2), point2d(4,4))).

query(triangle(point2d(1,1), point2d(3,1), point2d(4,3))).
query(equilateral(point2d(1,1), point2d(3,1), point2d(4,3))).
query(isosceles(point2d(1,1), point2d(3,1), point2d(4,3))).
query(right(point2d(1,1), point2d(3,1), point2d(4,3))).
query(scalene(point2d(1,1), point2d(3,1), point2d(4,3))).
query(acute(point2d(1,1), point2d(3,1), point2d(4,3))).
query(obtuse(point2d(1,1), point2d(3,1), point2d(4,3))).

query(triangle(point2d(3,1), point2d(9,1), point2d(6,4))).
query(equilateral(point2d(3,1), point2d(9,1), point2d(6,4))).
query(isosceles(point2d(3,1), point2d(9,1), point2d(6,4))).
query(right(point2d(3,1), point2d(9,1), point2d(6,4))).
query(scalene(point2d(3,1), point2d(9,1), point2d(6,4))).
query(acute(point2d(3,1), point2d(9,1), point2d(6,4))).
query(obtuse(point2d(3,1), point2d(9,1), point2d(6,4))).

writeln(T) :- write(T), nl.

main:- forall(query(Q), Q -> (writeln('yes')) ; (writeln('no'))),
	halt.