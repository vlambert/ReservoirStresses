%% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%            Horizontal surface displacements, u1          %  
%         at time t for reservoir with diffusivity c       %
%                  (Lambert and Tsai, 2020)                %  
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
function u1=Diffusive_u1(x1,y1,D,T,c,t)
% Change in fluid mass distribution
dm = sqrt(t/c)*(exp(-y1.^2./(4*c*t))./sqrt(pi) - abs(y1)./sqrt(4*c*t).*erfc(abs(y1)./sqrt(4*c*t)));

f  = atan((D+T)./(x1-y1))-atan(D./(x1-y1));
u1 = 2*dm.*f;
end
