%% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%                  Shear stress, Sigma_12 / mu             %  
%         at time t for reservoir with diffusivity c       %
%                  (Lambert and Tsai, 2020)                %  
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
function sig12=Diffusive_sig12Field(x1,x2,y1,D,T,c,t)
% Change in fluid mass distribution
dm = sqrt(t/c)*(exp(-y1.^2./(4*c*t))./sqrt(pi) - abs(y1)./sqrt(4*c*t).*erfc(abs(y1)./sqrt(4*c*t)));

f1    = (2*(D+T).^3 + x2.*(D+T).^2 + x2.*(x2.^2 + (x1-y1).^2) + 2.*(D+T).*(x1-y1).^2);
f1p   = f1./(((D+T-x2).^2 + (x1-y1).^2).*((D+T+x2).^2+(x1-y1).^2).^2);

f2    = (2*(D).^3 + x2.*(D).^2 + x2.*(x2.^2 + (x1-y1).^2) + 2.*(D).*(x1-y1).^2);
f2p   = f2./(((D-x2).^2 + (x1-y1).^2).*((D+x2).^2+(x1-y1).^2).^2);

sig12 = 4.*dm.*x2.*(x1-y1).*(f2p-f1p);
end
