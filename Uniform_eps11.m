%% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%   Horizontal extensional surface strain, epsilon_11      %
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
function eps11=Uniform_eps11(x1,D,a)
epsneg = (x1-a)./D;
epspos = (x1+a)./D;
eps11 = 1/D*((epspos./(1+epspos.^2)-epsneg./(1+epsneg.^2)));  
end