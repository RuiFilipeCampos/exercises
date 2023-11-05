x = [1 2 3 4]
y = [1 2 3 4]
f = figure('visible','off');
plot(x,y);

F = getframe(f);
[X, Map] = frame2im(F);
figure
imshow(X)