%% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%            Vertical normal stress, Sigma_22 / mu         %  
%                 Fixed, uniform reservoir                 %
%           (Segall, 1989; Lambert and Tsai, 2020)         %  
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
function sig22=Uniform_sig22Field(x1,x2,D,T,a)
f1 = 4*a.*x2.* ( (a.^2-x1.^2+(x2+D  ).^2)./(((x1-a).^2+(x2+D  ).^2).*((x1+a).^2+(x2+D  ).^2))-...
                 (a.^2-x1.^2+(x2+D+T).^2)./(((x1-a).^2+(x2+D+T).^2).*((x1+a).^2+(x2+D+T).^2)));
           
f2 =  atan((x2-D-T)./(a+x1))-atan((x2-D-T)./(x1-a))-...
      atan((x2-D  )./(a+x1))+atan((x2-D  )./(x1-a));
f3 =  atan((x2+D  )./(x1-a)) - atan((x2+D  )./(x1+a)) + ...
     -atan((x2+D+T)./(x1-a)) + atan((x2+D+T)./(x1+a));

sig22 = f1+f2+f3;
end
