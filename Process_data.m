%% This function is to process the data sampled from mpu
% The input argument must be a matrix which size is 17
% And must be the format we need
% It will return which axis data we got and the corresponse data
function [axis,pos,msg]=Process_data(x)
pos = [];
axis = x(1);
% Judge whether the size of x equals 17
if size(x)<17
    msg = 1;
else
    msg = 0;
    for k = 1:8
        % Caculate the position, include the positive and negative
        if x(1+k)>128
            pos(k) = (x(1+k)*256 + x(8+k)) - 2^16 + 1;
        else
            pos(k) = x(1+k)*256 + x(8+k);
        end
    end
end
    