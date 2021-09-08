--
--  External brackets  
--

1. Design and implement a library/package to remove external matching round brackets. Assume no pathological input is provided [ e.g. no “((abc)” ].

  I used Perl to study the problem that can be reduced to a recursive regular expression like the following

        $output = $input ;
        $output = $2 while $output =~ m/^ (  \(   (   (?<inside>  [^()]++ | (?1)   )*+   )  \)   ) $/x ;
    
  then I ported it to PHP quite directly
  
        $data = $_GET["DATA"] ;
        $result = $data ;
        #       /^\s*(\(((?:[^()]++|(?1))*+)\))\s*$/
        #       
        #       /^\s*                                    ignore leading spaces
        #            (                                   match #1 
        #             \(                                 open bracket
        #               (                                match #2 begin
        #                (?:[^()]++|(?1))*+              no inner brackets *or* recurse match #1 (repeated zero-or-many times)
        #                                  )             match # 2 end
        #                                   \)           closed bracket
        #                                     )          match #1 end
        #                                      \s*$/     ignore trailing spaces 
        while ( 
               preg_match( 
               '/^\s*(\(((?:[^()]++|(?1))*+)\))\s*$/'
                , $result
                , $found
                , PREG_OFFSET_CAPTURE ) 
              )
        {
            $result = $found[2][0] ;
        }
    
    

2. How can we be reasonably sure about the correctness of the solution?

    We must provid a complete set of successful tests, even pathological cases. In 'test' directory the Perl script has some of them.


3. Discuss the space-time complexity of the solution (both in general and language related)

    This is a recursive problem with some subtle complexity, but Perl and RegExp can handle it well.
    PHP provides the same RegExp semantics, so the translation is quite straigth.
    
    Using RegExp hides most of complexity, but in general Perl and PHP are both memory expensive, but nowadays that's not the point.
        

4. What if a pathological input could be provided?
    
    Recursive RegExp takes care of all cases.


5. Provide this solution as a service a user can call via HTTP (preferred deployment method is docker but alternatives are welcome if justified)

    I'm not familiar with Dockerfile and I prefer using docker-compose technique: in trunk directory there is docker-compose.yaml that can be used directly via
    
      $ docker-compose up
    
    that build and start the container. PHP page can be accessed via browser providing a DATA parameter, for example
    
      http://localhost:8000/brackets.php?DATA=(((AB))(CD)))

