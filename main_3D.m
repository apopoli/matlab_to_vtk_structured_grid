%% GEOMETRY
np = 100;

x = linspace(0,1,np);
y = linspace(0,1,np);
z = linspace(0,1,np);

[X,Y,Z] = meshgrid(x,y,z);

%% VARIABLES
r = rand(np,np,np);
s = cos(X);
[grad_s_x,grad_s_y,grad_s_z] = gradient(s,x,y,z);

%% OUTPUT
tic
filename = 'out_ASCII.vtk';
vtkwrite(filename,'structured_grid',X,Y,Z,...
        'scalars','r',r,'scalars','s',s,...
        'vectors', 'grad_s', grad_s_x, grad_s_y, grad_s_z)
toc

tic
filename = 'out_binary.vtk';
vtkwrite(filename,'structured_grid',X,Y,Z,...
        'scalars','r',r,'scalars','s',s,...
        'vectors', 'grad_s', grad_s_x, grad_s_y, grad_s_z,'binary')
toc