%% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%               Shear stress, Sigma_12 / mu                %  
%                 Fixed, uniform reservoir                 %
%           (Segall, 1989; Lambert and Tsai, 2019)         %  
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %%
%                     Free Surface
%   <----------------------------------------------------> x1
%                           |  ^
%                           |  |          mu = shear modulus
%                           |  D
%                           |  |
%                           |  v
%             -a -----------|----------- a      Reservoir
%                           |                 (thickness T)
%                           |
%                           v
%                           x2
function sig12=Uniform_sig12Field(x1,x2,D,T,a)
f1 = -log((x1-a).^2+(x2-D).^2) + log((x1-a).^2+(x2-D-T).^2);

f2 =  (16*a.*x1.*x2.*(D + x2) +  ...
      ((a - x1).^2 +(D + x2).^2).* ((a + x1).^2 + (D + x2).^2).*...
      (log((a + x1).^2 + (D - x2).^2)+ log((a - x1).^2 + (D + x2).^2) - log((a + x1).^2 + (D + x2).^2)))./...
      (((a - x1).^2 + (D + x2).^2).* ((a + x1).^2 + (D + x2).^2));

f3 =  -(16*a.*x1.*x2.*(D +T + x2) +  ...
      ((a - x1).^2 +(D +T + x2).^2).* ((a + x1).^2 + (D + T+ x2).^2).*...
      (log((a + x1).^2 + (D + T- x2).^2)+ log((a - x1).^2 + (D + T+ x2).^2) - log((a + x1).^2 + (D + T+ x2).^2)))./...
      (((a - x1).^2 + (D + T+ x2).^2).* ((a + x1).^2 + (D + T+ x2).^2));

sig12 = 0.5*(f1+f2+f3);
end