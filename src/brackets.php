<?php 
    
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

        echo "$result" ;
        
    ?>