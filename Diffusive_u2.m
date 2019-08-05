%% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%            Vertical surface displacements, u2            %  
%         at time t for reservoir with diffusivity c       %
%                  (Lambert and Tsai, 2019)                %  
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %%
%                     Free Surface
%   <----------------------------------------------------> x1
%                           |  ^
%                           |  |
%                           |  D
%                           |  |
%                           |  v
%               <-----------|----------->  dm(t,c)     Reservoir
%                           |                        (thickness T)
%                           |                       
%                           v
%                           x2
function u2= Diffusive_u2(x1,y1,D,T,c,t)
% Change in fluid mass distribution
dm = sqrt(t/c)*(exp(-y1.^2./(4*c*t))./sqrt(pi) - abs(y1)./sqrt(4*c*t).*erfc(abs(y1)./sqrt(4*c*t)));

f  = log( D^2 + (x1-y1).^2 )  - log( (D+T)^2 + (x1-y1).^2 );
u2 = dm.*f;
end