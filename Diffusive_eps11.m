%% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%        Horizontal extensional surface strain, eps11      %  
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
function eps11=Diffusive_eps11(x1,y1,D,T,c,t)
% Change in fluid mass distribution
dm =sqrt(t/c)*(exp(-y1.^2./(4*c*t))./sqrt(pi) - abs(y1)./sqrt(4*c*t).*erfc(abs(y1)./sqrt(4*c*t)));

f = (D*(D+T) - (x1-y1).^2)./((D.^2+(x1-y1).^2).*(((D+T).^2+(x1-y1).^2)));
eps11 = 2*T*f.*dm;  
end