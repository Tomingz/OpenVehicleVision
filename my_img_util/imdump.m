function  imdump(varargin)
% 在函数执行完后将用作调试的中间图片写入文件
% 如果不需要输出调试图片则可以在这里return

% mfilename 返回的是最近一次调用的函数名，这里是imdump 所以不行，需要函数调用栈
% 函数调用栈st存储了调用信息，这里st(1)是imdump, st(2)是调用imdump的函数
st = dbstack;
funcname = st(2).name;
line = st(2).line;

for i = 1:nargin
	image = varargin{i};
	if ismatrix(image)  % grey
		image = mat2gray(image);
	end
	% 文件夹浏览器显示时空格可以分行
	imwrite(image, ['output/', inputname(i), ' @', funcname, num2str(line), '.jpg']);
end