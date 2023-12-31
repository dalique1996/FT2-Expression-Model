function circaplot(t, y, s, c, p, color)


% Makes circadian plots
% s = light
% c = bar color
% p = total time
% color = gen color


% allow both cell and string colour inputs by converting strings to cells
if ischar(c)
    nC = length(c);
    c_temp = cell(nC,1);
    for i = 1:nC
        c_temp{i} = c(i);
    end
    c = c_temp;
end

if (nargin > 5)
    plot(t, y, 'Color',color);
else
  plot(t, y);
end

if (nargin > 2)
    v = axis;
    h = v(4)/20;           
    if (nargin == 4)
        p = t(end);
    end
    axis([s(1), p, -h,  v(4)]);
    [m, n] = size(s);
    n = n - 1;
    for i = 1:n
       x = s(i);
       rectangle('Position', [x, - h, s(i + 1) - s(i), h], 'FaceColor', c{i})
    end
    rectangle('Position', [s(end), - h, p - s(end), h], 'FaceColor', c{end});

end
