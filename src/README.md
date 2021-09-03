
1. Design and implement a library/package to remove external matching round brackets. Assume no pathological input is provided [ e.g. no “((abc)” ].

  I used Perl to study the problem that can be reduced to a recursive regular expression

    my $output = $input ;
    $output = $2 while $output =~ m/^ (  \(   (   (?<inside>  [^()]++ | (?1)   )*+   )  \)   ) $/x ;

2. How can we be reasonably sure about the correctness of the solution?

    We provided a complete set of test, but in general we can't.

3. Discuss the space-time complexity of the solution (both in general and language related)

    This is for sure a multi-recursive problem with some subtle complexity, but Perl and RegExp can handle it well.

4. What if a pathological input could be provided?
    
    Reg-Exp takes care of some additional examples of them.

5. Provide this solution as a service a user can call via HTTP (preferred deployment method is docker but alternatives are welcome if justified)

    More to do.

