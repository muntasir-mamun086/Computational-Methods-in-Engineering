function y = dffx(x)
h = 0.00001;
y = (ffx(x+h)-ffx(x))/(h);
end

