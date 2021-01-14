%% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%            Vertical surface displacements, u2            %
%                 Fixed, uniform reservoir                 %
%           (Segall, 1989; Lambert and Tsai, 2020)         %  
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

function u2=Uniform_u2(x1,D,a)
epsneg = (x1-a)./D;
epspos = (x1+a)./D;
u2 = (atan(epsneg) - atan(epspos));
end
