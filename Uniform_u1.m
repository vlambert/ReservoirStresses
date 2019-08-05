%% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%            Horizontal surface displacements, u1          %  
%                 Fixed, uniform reservoir                 %
%           (Segall, 1989; Lambert and Tsai, 2019)         %  
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %%
%                     Free Surface
%   <----------------------------------------------------> x1
%                           |  ^
%                           |  |
%                           |  D
%                           |  |
%                           |  v
%             -a -----------|----------- a      Reservoir
%                           |
%                           |
%                           v
%                           x2
function u1= Uniform_u1(x1,D,a)
epsneg = (x1-a)./D;
epspos = (x1+a)./D;
u1 = 0.5*log((1+epspos.^2)./(1+epsneg.^2));
end
