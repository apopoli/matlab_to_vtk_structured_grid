%% GEOMETRY
np = 100;

x = linspace(0,1,np);
y = linspace(0,1,np);
z = 1;

[X,Y,Z] = meshgrid(x,y,z);

%% VARIABLES
r = rand(np,np);
s = cos(X);
[grad_s_x,grad_s_y] = gradient(s,x,y);

%% OUTPUT
tic
filename = 'out_ASCII.vtk';
vtkwrite(filename,'structured_grid',X,Y,Z,...
        'scalars','r',r,'scalars','s',s,...
        'vectors','grad',grad_s_x,grad_s_y,zeros(np))
toc