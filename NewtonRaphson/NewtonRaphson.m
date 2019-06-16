function x1 = NewtonRaphson( f, fd, x0, eps, max )
         
         x = x0 - f(x0)/fd(x0);
     
         n = 1;
         
         x1 = size(max);
         x1(1) = x0;
         i = 2;
         
        while( abs(x - x0) >= eps )
                       
            x0 = x;
            
            x = x0 - f(x0)/fd(x0);
        
            x1(i) = x;
            
            i = i + 1;
             if ( n >= max)
               disp('Maximalis iteracio ellet erve!')
               return;
             end    
            
            
            n = n + 1;
        
        end
        
       
end

