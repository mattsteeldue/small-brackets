#!/usr/bin/perl

# brackets test

=pod
EXPECTED :
input           --> output
(abc)	          --> abc
((abc))	        --> abc
(abc	          --> (abc
()              -->
(ab) (cd)       --> (ab) (cd)
((ab) (cd))	    --> (ab) (cd)
ab(cd)	        --> ab(cd)
=cut

use  strict ;
use  warnings ;
while ( my $input = <DATA> ) {
  chomp $input;
  my $output = $input ;
  $output = $2 while $output =~ m/^ (  \(   (   (?<inside>  [^()]++ | (?1)   )*+   )  \)   ) $/x ;
  printf( "%-15s --> %-15s\n", $input, $output ) ;
}

=pod
RESULT :
Casi di esempio --> Casi di esempio
(abc)           --> abc
((abc))         --> abc
(abc            --> (abc
()              -->
(ab) (cd)       --> (ab) (cd)
((ab) (cd))     --> (ab) (cd)
ab(cd)          --> ab(cd)
                -->
((abc)          --> ((abc)
((abc)))        --> ((abc)))
(()(abc))       --> ()(abc)
(()(abc)))      --> (()(abc)))
((()))          -->
=cut

1;

__DATA__
Casi di esempio
(abc)
((abc))
(abc
()
(ab) (cd)
((ab) (cd))
ab(cd)

((abc)
((abc)))
(()(abc))
(()(abc)))
((()))
