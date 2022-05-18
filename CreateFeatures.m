function F = CreateFeatures(points)
x31 = points(3,1) - points(1,1);
y31 = points(3,2) - points(1,2);
f1 = x31/sqrt((x31^2) + (y31^2));
f2 = y31/sqrt((x31^2) + (y31^2));

points_max = max(points);
points_min = min(points);
BB = [points_min(1,1) points_min(1,2);points_max(1,1) points_max(1,2)];
points_maxmin = points_max - points_min;
f3 = (points_maxmin(1,1)^2 + points_maxmin(1,2)^2)^(1/2);
f4 = atan(points_maxmin(1,2)/points_maxmin(1,1));

xend1 = points(end,1) - points(1,1);
yend1 = points(end,2) - points(1,2);
f5 = (xend1^2 + yend1^2)^(1/2);
f6 = xend1/f5;
f7 = yend1/f5;

dx = (points(2:end,1) - points(1:end - 1,1));
dy = (points(2:end,2) - points(1:end - 1,2));
d = sqrt((dx.^2)+(dy.^2));
f8 = sum(d);

theta_ptop = (dx(2:end).*dy(1:end-1)) - (dx(1:end-1).*dy(2:end));
theta_pbottom = (dx(2:end).*dx(1:end-1)) - (dy(2:end).*dy(1:end-1));
theta_p = atand(theta_ptop/theta_pbottom);
f9 = sum(theta_p,'all');
f10 = sum(abs(theta_p),'all');
f11 = sum(theta_p.^2,'all');

dt = (points(2:end,3) - points(1:end - 1,3));
s = (dx.^2 + dy.^2)./(dt.^2);
f12 = max(s);
f13 = sum(points(:,3));

%{
sizef1 = size(f1);
sizef2 = size(f2);
sizef3 = size(f3);
sizef4 = size(f4);
sizef5 = size(f5);
sizef6 = size(f6);
sizef7 = size(f7);
sizef8 = size(f8);
sizef9 = size(f9);
sizef10 = size(f10);
sizef11 = size(f11);
sizef12 = size(f12);
sizef13 = size(f13);
%}
F = [f1;f2;f3;f4;f5;f6;f7;f8;f9;f10;f11;f12;f13];