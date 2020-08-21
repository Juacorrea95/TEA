## Copyright (C) 2020 Correa
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} promedios (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefntam-tam_est

## Author: Correa <Correa@CORREA-PC>
## Created: 2020-08-21

function [p,m]=promedios(m,tam,delta,tam_est,pararayo)
    
    s=m;
    for i=2:tam-1
        for j=1:tam
            if j==1
                s(i,j)=1/4*(m(i-1,j)+m(i+1,j)+m(i,j+1)+m(i,tam));
            elseif j==tam
               s(i,j)=1/4*(m(i-1,j)+m(i+1,j)+m(i,j-1)+m(i,1));
            else
                s(i,j)=1/4*(m(i-1,j)+m(i+1,j)+m(i,j-1)+m(i,j+1));
            end
        end
     end
     
     D = s-m;
     #disp((delta+1)*D)
     #disp(m)
     p = m + (delta+1)*D;
     #mantengo al cubo a potencial cero
     pos_init = round(tam/2-tam_est/2);
     pos_fin = round(tam/2+tam_est/2);
    
    for i=tam-tam_est:tam
        for j=pos_init:pos_fin
           p(i,j)=0;
         end  
     end
     for i=tam-tam_est-pararayo-1:tam-tam_est
       p(i,pos_init)=0;
      end
     #aca agrego de la misma forma el pararayo `para la segunda parte a potencial cero
endfunction