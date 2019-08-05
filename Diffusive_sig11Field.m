%% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%           Horizontal normal stress, Sigma_11 / mu        %  
%         at time t for reservoir with diffusivity c       %
%                  (Lambert and Tsai, 2019)                %  
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %%
%                     Free Surface
%   <----------------------------------------------------> x1
%                           |  ^
%                           |  |          mu = shear modulus
%                           |  D  
%                           |  |
%                           |  v
%               <-----------|----------->  dm(t,c)     Reservoir
%                           |                        (thickness T)
%                           |                       
%                           v
%                           x2
function sig11=Diffusive_sig11Field(x1,x2,y1,D,T,c,t)
% Change in fluid mass distribution
dm    = sqrt(t/c)*(exp(-y1.^2./(4*c*t))./sqrt(pi) - abs(y1)./sqrt(4*c*t).*erfc(abs(y1)./sqrt(4*c*t)));

f1    = (D+T-x2)./((D+T-x2).^2+(x1-y1).^2) + (3*(D+T)+x2)./((D+T+x2).^2+(x1-y1).^2) + ...
        (4*x2.*(x1-y1).^2)./((D+T+x2).^2 + (x1-y1).^2).^2;
  
f2    = (D-x2)./((D-x2).^2+(x1-y1).^2) + (3*D+x2)./((D+x2).^2+(x1-y1).^2) + ...
        (4*x2.*(x1-y1).^2)./((D+x2).^2 + (x1-y1).^2).^2;

sig11 = dm.*(f2-f1);
end