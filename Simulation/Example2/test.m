function pdemodel
[pde_fig,ax]=pdeinit;
pdetool('appl_cb',1);
set(ax,'DataAspectRatio',[5.5 3.25 1]);
set(ax,'PlotBoxAspectRatio',[1 1 1]);
set(ax,'XLim',[-0.5 10.5]);
set(ax,'YLim',[-0.5 6]);
set(ax,'XTickMode','auto');
set(ax,'YTickMode','auto');

% Geometry description:
pderect([0 10 5.5 0],'R1');
pdeellip(1.25,2.75,0.5,0.5,...
0,'E1');
pdeellip(1.25,2.75,2,2,...
0,'E2');
pdeellip(1.25,2.75,6,6,...
0,'E3');
set(findobj(get(pde_fig,'Children'),'Tag','PDEEval'),'String','R1 - E1')

% Boundary conditions:
pdetool('changemode',0)
pdesetbd(12,...
'dir',...
1,...
'1',...
'0')
pdesetbd(11,...
'dir',...
1,...
'1',...
'0')
pdesetbd(10,...
'dir',...
1,...
'1',...
'0')
pdesetbd(9,...
'dir',...
1,...
'1',...
'0')
pdesetbd(8,...
'dir',...
1,...
'1',...
'0')
pdesetbd(7,...
'dir',...
1,...
'1',...
'0')
pdesetbd(6,...
'dir',...
1,...
'1',...
'0')
pdesetbd(5,...
'dir',...
1,...
'1',...
'0')
pdesetbd(4,...
'dir',...
1,...
'1',...
'0')
pdesetbd(3,...
'dir',...
1,...
'1',...
'0')
pdesetbd(2,...
'dir',...
1,...
'1',...
'0')
pdesetbd(1,...
'dir',...
1,...
'1',...
'0')

% Mesh generation:
setappdata(pde_fig,'Hgrad',1.3);
setappdata(pde_fig,'refinemethod','regular');
setappdata(pde_fig,'jiggle',char('on','mean',''));
pdetool('initmesh')
pdetool('refine')
pdetool('refine')

% PDE coefficients:
pdeseteq(1,...
'1000!1!1',...
'0.0!0.0!0.0',...
'1!1!1',...
'1.0!1.0!1.0',...
'0:10',...
'0.0',...
'0.0',...
'[0 100]')
setappdata(pde_fig,'currparam',...
['1000!1!1   ';...
'0.0!0.0!0.0';...
'1!1!1      ';...
'1.0!1.0!1.0'])

% Solve parameters:
setappdata(pde_fig,'solveparam',...
str2mat('0','6192','10','pdeadworst',...
'0.5','longest','0','1E-4','','fixed','Inf'))

% Plotflags and user data strings:
setappdata(pde_fig,'plotflags',[1 1 1 1 1 1 1 1 0 0 0 1 1 0 0 1 0 1]);
setappdata(pde_fig,'colstring','');
setappdata(pde_fig,'arrowstring','');
setappdata(pde_fig,'deformstring','');
setappdata(pde_fig,'heightstring','');