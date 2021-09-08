#!/usr/bin/perl

# brackets test

=pod
EXPECTED :
input           --> output
(abc)	        --> abc
((abc))	        --> abc
(abc	        --> (abc
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

  #           recurse                   1       2      inside is ignored  recursion       2       1  trailing spaces
  $output = $2 while $output =~ m/^ \s* (  \(   (   (?<inside>  [^()]++ |    (?1)   )*+   )  \)   )  \s* $/x ;
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
(((ab))((cd)))  --> ((ab))((cd))
(((ab)((cd)))   --> (((ab)((cd)))
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

 (abc)
 ((abc)
 ((abc)))
(()(abc))
(()(abc)))
 (())
(((ab))((cd)))
(((ab)((cd)))

