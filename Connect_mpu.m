%% This function is use to connect the mpu via serial port
% It accept the serial port as the input argument
% And return the serial handle and data read from serial port
% Connect_mpu will open the port and set serial port property
% ReceiveCallback is the callback function when serial port receive byte

function [s,x]=Connect_mpu(port)
    delete(instrfindall)
    global s;
    global x ;
    global n;
    global flag;
    flag = 0;
    n = 1;
    x = [];
    
    s = serial(port);
    set(s,'BaudRate',9600);
    % Set the serial callback mode to byte
    set(s,'BytesAvailableFcnMode','byte');
    set(s,'BytesAvailableFcnCount',1);
    fopen(s);
    s.BytesAvailableFcn=@ReceiveCallback;
end

% Callback function of receive byte
function [axis, pos] = ReceiveCallback(obj,event)
    global s;
    global x;
    global n;
    global flag;
    data = fread(s,1);
    % Assign data to x to save the data sampled from the mpu
    x(n) = data;
    % Judge if we receive the '\r\n' terminator
    if flag == 1
        if data == 10
            n = 0;
%             if size(x)<17
%                 % Show the data x
%                 % Just comment it to ignore the output
%                 % x
%                 
%             else
%                 [axis, pos, msg] = Process_data(x(1:17));
%                 disp(pos)
%             end
        disp(x)
        end
        flag = 0;
    end
    if data == 13
        flag = 1;
    end
    % Increce the n to store the data one by one
    n = n+1;
end