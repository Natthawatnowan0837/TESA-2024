classdef Shape_To_PadLayer1004 < nnet.layer.Layer & nnet.layer.Formattable
    % A custom layer auto-generated while importing an ONNX network.

    %#codegen
    %#ok<*PROPLC>
    %#ok<*NBRAK>
    %#ok<*INUSL>
    %#ok<*VARARG>

    properties (Learnable)
        conv_1_Split_split
    end

    properties
        ONNXParams         % An ONNXParameters object containing parameters used by this layer.
    end

    methods
        function this = Shape_To_PadLayer1004(name, onnxParams)
            this.Name = name;
            this.OutputNames = {'conv_1_Pad'};
            this.ONNXParams = onnxParams;
            this.conv_1_Split_split = onnxParams.Learnables.conv_1_Split_split;
        end

        function [conv_1_Pad] = predict(this, imageinput_Sub)
            if isdlarray(imageinput_Sub)
                imageinput_Sub = stripdims(imageinput_Sub);
            end
            imageinput_SubNumDims = 4;
            onnxParams = this.ONNXParams;
            onnxParams.Learnables.conv_1_Split_split = this.conv_1_Split_split;
            [conv_1_Pad, conv_1_PadNumDims] = Shape_To_PadFcn(imageinput_Sub, imageinput_SubNumDims, onnxParams, 'Training', false, ...
                'InputDataPermutation', {[4 3 1 2], ['as-is']}, ...
                'OutputDataPermutation', {[3 4 2 1], ['as-is']});
            if any(cellfun(@(A)~isnumeric(A) && ~islogical(A), {conv_1_Pad}))
                fprintf('Runtime error in network. At least one output of custom layer ''%s'' is a non-numeric, non-logical value.\n', 'Shape_To_PadLayer1004');
                error(message('nnet_cnn_onnx:onnx:BadCustomLayerRuntimeOutput', 'Shape_To_PadLayer1004'));
            end
            conv_1_Pad = dlarray(single(conv_1_Pad), 'SSCB');
            if ~coder.target('MATLAB')
                conv_1_Pad = extractdata(conv_1_Pad);
            end
        end

        function [conv_1_Pad] = forward(this, imageinput_Sub)
            if isdlarray(imageinput_Sub)
                imageinput_Sub = stripdims(imageinput_Sub);
            end
            imageinput_SubNumDims = 4;
            onnxParams = this.ONNXParams;
            onnxParams.Learnables.conv_1_Split_split = this.conv_1_Split_split;
            [conv_1_Pad, conv_1_PadNumDims] = Shape_To_PadFcn(imageinput_Sub, imageinput_SubNumDims, onnxParams, 'Training', true, ...
                'InputDataPermutation', {[4 3 1 2], ['as-is']}, ...
                'OutputDataPermutation', {[3 4 2 1], ['as-is']});
            if any(cellfun(@(A)~isnumeric(A) && ~islogical(A), {conv_1_Pad}))
                fprintf('Runtime error in network. At least one output of custom layer ''%s'' is a non-numeric, non-logical value.\n', 'Shape_To_PadLayer1004');
                error(message('nnet_cnn_onnx:onnx:BadCustomLayerRuntimeOutput', 'Shape_To_PadLayer1004'));
            end
            conv_1_Pad = dlarray(single(conv_1_Pad), 'SSCB');
            if ~coder.target('MATLAB')
                conv_1_Pad = extractdata(conv_1_Pad);
            end
        end
    end
end

function [conv_1_Pad, conv_1_PadNumDims, state] = Shape_To_PadFcn(imageinput_Sub, imageinput_SubNumDims, params, varargin)
%SHAPE_TO_PADFCN Function implementing an imported ONNX network.
%
% THIS FILE WAS AUTO-GENERATED BY importONNXFunction.
% ONNX Operator Set Version: 14
%
% Variable names in this function are taken from the original ONNX file.
%
% [CONV_1_PAD] = Shape_To_PadFcn(IMAGEINPUT_SUB, PARAMS)
%			- Evaluates the imported ONNX network SHAPE_TO_PADFCN with input(s)
%			IMAGEINPUT_SUB and the imported network parameters in PARAMS. Returns
%			network output(s) in CONV_1_PAD.
%
% [CONV_1_PAD, STATE] = Shape_To_PadFcn(IMAGEINPUT_SUB, PARAMS)
%			- Additionally returns state variables in STATE. When training,
%			use this form and set TRAINING to true.
%
% [__] = Shape_To_PadFcn(IMAGEINPUT_SUB, PARAMS, 'NAME1', VAL1, 'NAME2', VAL2, ...)
%			- Specifies additional name-value pairs described below:
%
% 'Training'
% 			Boolean indicating whether the network is being evaluated for
%			prediction or training. If TRAINING is true, state variables
%			will be updated.
%
% 'InputDataPermutation'
%			'auto' - Automatically attempt to determine the permutation
%			 between the dimensions of the input data and the dimensions of
%			the ONNX model input. For example, the permutation from HWCN
%			(MATLAB standard) to NCHW (ONNX standard) uses the vector
%			[4 3 1 2]. See the documentation for IMPORTONNXFUNCTION for
%			more information about automatic permutation.
%
%			'none' - Input(s) are passed in the ONNX model format. See 'Inputs'.
%
%			numeric vector - The permutation vector describing the
%			transformation between input data dimensions and the expected
%			ONNX input dimensions.%
%			cell array - If the network has multiple inputs, each cell
%			contains 'auto', 'none', or a numeric vector.
%
% 'OutputDataPermutation'
%			'auto' - Automatically attempt to determine the permutation
%			between the dimensions of the output and a conventional MATLAB
%			dimension ordering. For example, the permutation from NC (ONNX
%			standard) to CN (MATLAB standard) uses the vector [2 1]. See
%			the documentation for IMPORTONNXFUNCTION for more information
%			about automatic permutation.
%
%			'none' - Return output(s) as given by the ONNX model. See 'Outputs'.
%
%			numeric vector - The permutation vector describing the
%			transformation between the ONNX output dimensions and the
%			desired output dimensions.%
%			cell array - If the network has multiple outputs, each cell
%			contains 'auto', 'none' or a numeric vector.
%
% Inputs:
% -------
% IMAGEINPUT_SUB
%			- Input(s) to the ONNX network.
%			  The input size(s) expected by the ONNX file are:
%				  IMAGEINPUT_SUB:		[Unknown, Unknown, Unknown, Unknown]				Type: FLOAT
%			  By default, the function will try to permute the input(s)
%			  into this dimension ordering. If the default is incorrect,
%			  use the 'InputDataPermutation' argument to control the
%			  permutation.
%
%
% PARAMS	- Network parameters returned by 'importONNXFunction'.
%
%
% Outputs:
% --------
% CONV_1_PAD
%			- Output(s) of the ONNX network.
%			  Without permutation, the size(s) of the outputs are:
%				  CONV_1_PAD:		[Unknown, Unknown, Unknown, Unknown]				Type: FLOAT
%			  By default, the function will try to permute the output(s)
%			  from this dimension ordering into a conventional MATLAB
%			  ordering. If the default is incorrect, use the
%			  'OutputDataPermutation' argument to control the permutation.
%
% STATE		- (Optional) State variables. When TRAINING is true, these will
% 			  have been updated from the original values in PARAMS.State.
%
%
%  See also importONNXFunction

% Preprocess the input data and arguments:
[imageinput_Sub, Training, outputDataPerms, anyDlarrayInputs] = preprocessInput(imageinput_Sub, params, varargin{:});
% Put all variables into a single struct to implement dynamic scoping:
[Vars, NumDims] = packageVariables(params, {'imageinput_Sub'}, {imageinput_Sub}, [imageinput_SubNumDims]);
% Call the top-level graph function:
[conv_1_Pad, conv_1_PadNumDims, state] = Shape_To_PadGraph1001(imageinput_Sub, NumDims.imageinput_Sub, Vars, NumDims, Training, params.State);
% Postprocess the output data
[conv_1_Pad] = postprocessOutput(conv_1_Pad, outputDataPerms, anyDlarrayInputs, Training, varargin{:});
end

function [conv_1_Pad, conv_1_PadNumDims1003, state] = Shape_To_PadGraph1001(imageinput_Sub, imageinput_SubNumDims1002, Vars, NumDims, Training, state)
% Function implementing the graph 'Shape_To_PadGraph1001'
% Update Vars and NumDims from the graph's formal input parameters. Note that state variables are already in Vars.
Vars.imageinput_Sub = imageinput_Sub;
NumDims.imageinput_Sub = imageinput_SubNumDims1002;

% Execute the operators:
% Shape:
[Vars.conv_1_InputShapeInt, NumDims.conv_1_InputShapeInt] = onnxShape(Vars.imageinput_Sub, NumDims.imageinput_Sub, 0, NumDims.imageinput_Sub+1);

% Cast:
if islogical(Vars.conv_1_InputShapeInt)
    Vars.conv_1_InputShapeInt = single(Vars.conv_1_InputShapeInt);
end
Vars.conv_1_InputShape = single(Vars.conv_1_InputShapeInt);
NumDims.conv_1_InputShape = NumDims.conv_1_InputShapeInt;

% Div:
Vars.conv_1_Div = Vars.conv_1_InputShape ./ Vars.conv_1_Stride;
NumDims.conv_1_Div = max(NumDims.conv_1_InputShape, NumDims.conv_1_Stride);

% Ceil:
Vars.conv_1_Ceil = ceil(Vars.conv_1_Div);
NumDims.conv_1_Ceil = NumDims.conv_1_Div;

% Sub:
Vars.conv_1_Sub = Vars.conv_1_Ceil - Vars.conv_1_One;
NumDims.conv_1_Sub = max(NumDims.conv_1_Ceil, NumDims.conv_1_One);

% Mul:
Vars.conv_1_Mul = Vars.conv_1_Sub .* Vars.conv_1_Stride;
NumDims.conv_1_Mul = max(NumDims.conv_1_Sub, NumDims.conv_1_Stride);

% Add:
Vars.conv_1_Add = Vars.conv_1_Mul + Vars.conv_1_Filter;
NumDims.conv_1_Add = max(NumDims.conv_1_Mul, NumDims.conv_1_Filter);

% Sub:
Vars.conv_1_Sub1 = Vars.conv_1_Add - Vars.conv_1_InputShape;
NumDims.conv_1_Sub1 = max(NumDims.conv_1_Add, NumDims.conv_1_InputShape);

% Relu:
Vars.conv_1_ReluInt = relu(Vars.conv_1_Sub1);
NumDims.conv_1_ReluInt = NumDims.conv_1_Sub1;

% Cast:
if islogical(Vars.conv_1_ReluInt)
    Vars.conv_1_ReluInt = single(Vars.conv_1_ReluInt);
end
Vars.conv_1_Relu = single(Vars.conv_1_ReluInt);
NumDims.conv_1_Relu = NumDims.conv_1_ReluInt;

% Split:
[Vars.conv_1_BCPadding, Vars.conv_1_totalPaddingN, Vars.conv_1_totalPaddin_5, NumDims.conv_1_BCPadding, NumDims.conv_1_totalPaddingN, NumDims.conv_1_totalPaddin_5] = onnxSplit13(Vars.conv_1_Relu, 0, Vars.conv_1_Split_split, 3, NumDims.conv_1_Relu);

% Div:
Vars.conv_1_totalPaddin_2 = Vars.conv_1_totalPaddingN ./ Vars.conv_1_totalPaddin_4;
NumDims.conv_1_totalPaddin_2 = max(NumDims.conv_1_totalPaddingN, NumDims.conv_1_totalPaddin_4);

% Floor:
Vars.conv_1_totalPaddin_3 = floor(Vars.conv_1_totalPaddin_2);
NumDims.conv_1_totalPaddin_3 = NumDims.conv_1_totalPaddin_2;

% Ceil:
Vars.conv_1_totalPaddin_1 = ceil(Vars.conv_1_totalPaddin_2);
NumDims.conv_1_totalPaddin_1 = NumDims.conv_1_totalPaddin_2;

% Div:
Vars.conv_1_totalPaddin_7 = Vars.conv_1_totalPaddin_5 ./ Vars.conv_1_totalPaddin_9;
NumDims.conv_1_totalPaddin_7 = max(NumDims.conv_1_totalPaddin_5, NumDims.conv_1_totalPaddin_9);

% Floor:
Vars.conv_1_totalPaddin_8 = floor(Vars.conv_1_totalPaddin_7);
NumDims.conv_1_totalPaddin_8 = NumDims.conv_1_totalPaddin_7;

% Ceil:
Vars.conv_1_totalPaddin_6 = ceil(Vars.conv_1_totalPaddin_7);
NumDims.conv_1_totalPaddin_6 = NumDims.conv_1_totalPaddin_7;

% Concat:
[Vars.conv_1_paddingSize, NumDims.conv_1_paddingSize] = onnxConcat(0, {Vars.conv_1_Zero, Vars.conv_1_Zero, Vars.conv_1_totalPaddin_3, Vars.conv_1_totalPaddin_8, Vars.conv_1_Zero, Vars.conv_1_Zero, Vars.conv_1_totalPaddin_1, Vars.conv_1_totalPaddin_6}, [NumDims.conv_1_Zero, NumDims.conv_1_Zero, NumDims.conv_1_totalPaddin_3, NumDims.conv_1_totalPaddin_8, NumDims.conv_1_Zero, NumDims.conv_1_Zero, NumDims.conv_1_totalPaddin_1, NumDims.conv_1_totalPaddin_6]);

% Cast:
if islogical(Vars.conv_1_paddingSize)
    Vars.conv_1_paddingSize = single(Vars.conv_1_paddingSize);
end
Vars.conv_1_paddingSizeIn = cast(int64(extractdata(Vars.conv_1_paddingSize)), 'like', Vars.conv_1_paddingSize);
NumDims.conv_1_paddingSizeIn = NumDims.conv_1_paddingSize;

% Pad:
[Vars.conv_1_Pad, NumDims.conv_1_Pad] = onnxPad(Vars.imageinput_Sub, Vars.conv_1_paddingSizeIn, Vars.conv_1_Pad_value, 'constant', dlarray([0:NumDims.imageinput_Sub]'), NumDims.imageinput_Sub);

% Set graph output arguments from Vars and NumDims:
conv_1_Pad = Vars.conv_1_Pad;
conv_1_PadNumDims1003 = NumDims.conv_1_Pad;
% Set output state from Vars:
state = updateStruct(state, Vars);
end

function [inputDataPerms, outputDataPerms, Training] = parseInputs(imageinput_Sub, numDataOutputs, params, varargin)
% Function to validate inputs to Shape_To_PadFcn:
p = inputParser;
isValidArrayInput = @(x)isnumeric(x) || isstring(x);
isValidONNXParameters = @(x)isa(x, 'ONNXParameters');
addRequired(p, 'imageinput_Sub', isValidArrayInput);
addRequired(p, 'params', isValidONNXParameters);
addParameter(p, 'InputDataPermutation', 'auto');
addParameter(p, 'OutputDataPermutation', 'auto');
addParameter(p, 'Training', false);
parse(p, imageinput_Sub, params, varargin{:});
inputDataPerms = p.Results.InputDataPermutation;
outputDataPerms = p.Results.OutputDataPermutation;
Training = p.Results.Training;
if isnumeric(inputDataPerms)
    inputDataPerms = {inputDataPerms};
end
if isstring(inputDataPerms) && isscalar(inputDataPerms) || ischar(inputDataPerms)
    inputDataPerms = repmat({inputDataPerms},1,1);
end
if isnumeric(outputDataPerms)
    outputDataPerms = {outputDataPerms};
end
if isstring(outputDataPerms) && isscalar(outputDataPerms) || ischar(outputDataPerms)
    outputDataPerms = repmat({outputDataPerms},1,numDataOutputs);
end
end

function [imageinput_Sub, Training, outputDataPerms, anyDlarrayInputs] = preprocessInput(imageinput_Sub, params, varargin)
% Parse input arguments
[inputDataPerms, outputDataPerms, Training] = parseInputs(imageinput_Sub, 1, params, varargin{:});
anyDlarrayInputs = any(cellfun(@(x)isa(x, 'dlarray'), {imageinput_Sub}));
% Make the input variables into unlabelled dlarrays:
imageinput_Sub = makeUnlabeledDlarray(imageinput_Sub);
% Permute inputs if requested:
imageinput_Sub = permuteInputVar(imageinput_Sub, inputDataPerms{1}, 4);
end

function [conv_1_Pad] = postprocessOutput(conv_1_Pad, outputDataPerms, anyDlarrayInputs, Training, varargin)
% Set output type:
if ~anyDlarrayInputs && ~Training
    if isdlarray(conv_1_Pad)
        conv_1_Pad = extractdata(conv_1_Pad);
    end
end
% Permute outputs if requested:
conv_1_Pad = permuteOutputVar(conv_1_Pad, outputDataPerms{1}, 4);
end


%% dlarray functions implementing ONNX operators:

function [Y, numDimsY] = onnxConcat(ONNXAxis, XCell, numDimsXArray)
% Concatentation that treats all empties the same. Necessary because
% dlarray.cat does not allow, for example, cat(1, 1x1, 1x0) because the
% second dimension sizes do not match.

% Copyright 2021 The MathWorks, Inc.

numDimsY = numDimsXArray(1);
XCell(cellfun(@isempty, XCell)) = [];
if isempty(XCell)
    Y = dlarray([]);
else
    if ONNXAxis<0
        ONNXAxis = ONNXAxis + numDimsY;
    end
    DLTAxis = numDimsY - ONNXAxis;
    Y = cat(DLTAxis, XCell{:});
end
end

function [Y, numDimsY] = onnxPad(X, pads, value, mode, ONNXAxis, numDimsX)
% Implements the ONNX Pad operator

% ONNX 'pads' is a vector: [x1_begin, x2_begin...x1_end, x2_end,...], with
% x1,x2, listed in FORWARD ONNX dimension ordering, because it is data
% within a dimension and so is not flipped. xi_begin is the number of
% pixels added at the beginning of axis `i` and xi_end, the number of
% pixels added at the end of axis `i`.  pads can be negative, in which case
% that number of pixels is removed.

% Copyright 2020-2024 The MathWorks, Inc.

pads = pads(:)';
numDimsY = numDimsX;
if ONNXAxis < 0
    ONNXAxis = ONNXAxis + numDimsX;
end
% Fill in pads to length 2*numDimsX if size(ONNXAxis,1) < numDimsX
if size(ONNXAxis,1) < numDimsX
    helpPads = dlarray(zeros(1,2*numDimsX));
    helpPads([ONNXAxis+1,ONNXAxis+numDimsX+1]) = pads;
    pads = helpPads;
end

if numDimsX==1
    % X is Nx1. Temporarily make it reverse-ONNX 2D (1xN), then transpose
    % the result back to 1D at the end.
    X = X';
    numDimsX = 2;
    pads = [pads(1) 0 pads(2) 0];  % Don't pad the dummy dimension
    numDimsY = 1;
end
sizeX  = size(X, 1:numDimsX);
fwdPadMat = reshape(extractdata(pads), [], 2)';  % row1 = begins, row2 = ends
% Columns of padmat are in reverse ONNX ordering. Still the case that row1
% = begins, row2 = ends:
padmat = fliplr(fwdPadMat);
sizeY  = sum([sizeX; padmat]);
% Create output tensor of the right size
Y = value*ones(sizeY, 'like', X);
% Construct subsref indices for inserting (and cropping) the original
for i=1:numel(sizeX)
    Ysubs{i} = max(1,1+padmat(1,i)) : min(sizeY(i), sizeY(i)-padmat(2,i));
    Xsubs{i} = max(1,1-padmat(1,i)) : min(sizeX(i), sizeX(i)+padmat(2,i));
end
Sy      = struct('type', '()');
Sy.subs = Ysubs;
Sx      = struct('type', '()');
Sx.subs = Xsubs;
% Insert/crop the original into the result
Y = subsasgn(Y, Sy, subsref(X, Sx));
% Handle 'reflect' and 'edge' modes, but don't do it if X was 1D, 0x1.
if ismember(mode, ["edge", "reflect"]) && ~(numDimsY==1 && sizeX(2)==0)
    for dim = 1:numDimsX
        if any(padmat(:,dim)>0)
            % Setup a call to subsasgn
            prepad  = padmat(1,dim);
            postpad = padmat(2,dim);
            if prepad > 0
                [Sy, Sx] = prepadIndices(sizeX, prepad, dim, mode);
                Y = subsasgn(Y, Sy, subsref(Y, Sx));
            end
            if postpad > 0
                [Sy, Sx] = postpadIndices(sizeX, sizeY, prepad, postpad, dim, mode);
                Y = subsasgn(Y, Sy, subsref(Y, Sx));
            end
        end
    end
end
% Transpose the result back to 1D if the input was 1D
if numDimsY==1
    Y = Y';
end

% Subfunctions in onnxPad:
    function [Sy, Sx] = prepadIndices(sizeX, prepad, dim, mode)
        Sy   	= struct('type', '()');
        Sy.subs	= repmat({':'}, [1 numel(sizeX)]);
        Sx   	= Sy;
        % Write into the first 'prepad' elements of Y.dim.
        Sy.subs{dim} = 1:prepad;
        switch mode
            case 'reflect'
                % Create indices 2:prepad+1 of X.dim, in the reverse order, with
                % wraparound. Then add prepad to convert them to Y indices.
                Sx.subs{dim} = wrapIndices(prepad+1 : -1 : 2, sizeX(dim)) + prepad;
            case 'edge'
                % Create replicated indices 1 of X.dim. Then add prepad to
                % convert them to Y indices.
                Sx.subs{dim} = repmat(1, [1 prepad]) + prepad;
            otherwise
                assert(false);
        end
    end

    function [Sy, Sx] = postpadIndices(sizeX, sizeY, prepad, postpad, dim, mode)
        Sy   	= struct('type', '()');
        Sy.subs	= repmat({':'}, [1 numel(sizeX)]);
        Sx   	= Sy;
        % Write into the last 'postpad' elements of Y.dim.
        Sy.subs{dim} = sizeY(dim)-postpad+1 : sizeY(dim);
        switch mode
            case 'reflect'
                % Create indices in the reverse order, with wraparound. Then add
                % prepad to convert them to Y indices.
                Sx.subs{dim} = wrapIndices(sizeX(dim)-1 : -1 : sizeX(dim)-postpad, sizeX(dim)) + prepad;
            case 'edge'
                % Create replicated end indices . Then add prepad to convert them
                % to Y indices.
                Sx.subs{dim} = repmat(sizeX(dim), [1 postpad]) + prepad;
            otherwise
                assert(false);
        end
    end

    function j = wrapIndices(i, maxIdx)
        % i can be positive, negative or zero. Legal output indices are in the
        % range 1:maxIdx.
        j = mod(i-1, maxIdx) + 1;
    end
end


function [Y, numDimsY] = onnxShape(X, numDimsX, startAxis, endAxis)
% Implements the ONNX Shape operator
% Return the reverse ONNX shape as a 1D column vector

% Copyright 2020-2024 The MathWorks, Inc.

switch numDimsX
    case 0
        if isempty(X)
            Y = dlarray(0);
        else
            Y = dlarray(1);
        end
    case 1
        if isempty(X)
            Y = dlarray(0);
        else
            Y = dlarray(size(X,1));
        end
    otherwise
        if(endAxis<0)
            %  If the endAxis is smaller than 0 after converting it positive,
            % the endAxis is 0
            endAxis = max(0, numDimsX + endAxis);
        end
        if(startAxis<0)
            %  If the startAxis is smaller than 0 after converting it positive,
            % the startAxis is 0
            startAxis = max(0, numDimsX + startAxis);
        end
        % transform startAxis and endAxis from 0 index to 1 index
        startAxis = startAxis + 1;
        endAxis = endAxis + 1;
        % if startAxis is larger than numDimsX or endAxis is larger than
        % numDimsX + 1, cramp it to the upper bound. The endAxis is exclusive,
        % transform it to MATLAB inclusive way
        endAxis = min(endAxis, numDimsX + 1) - 1;
        startAxis = min(startAxis, numDimsX);
        if endAxis < startAxis || endAxis == 0
            Y = dlarray(0);
        else
            Y = dlarray(fliplr(size(X, (numDimsX-endAxis+1):(numDimsX-startAxis+1)))');
        end
end
numDimsY = 1;
end

function varargout = onnxSplit13(X, ONNXaxis, splits, numSplits, numDimsX)
% Implements the ONNX Split operator

% Copyright 2021-2024 The MathWorks, Inc.

% ONNXaxis is origin 0. splits is a vector of the lengths of each segment.
% If splits is empty, instead split into segments of equal length.
if ONNXaxis<0
    ONNXaxis = ONNXaxis + numDimsX;
end
DLTAxis = numDimsX - ONNXaxis;
if isempty(splits)
    C       = size(X, DLTAxis);
    sz      = floor(C/numSplits);
    splits	= repmat(sz, 1, numSplits);
else
    splits = extractdata(splits);
end
S      = struct;
S.type = '()';
S.subs = repmat({':'}, 1, numDimsX);        % Important to use numDimsX. ndims(X) may be too small.
splitIndices = [0 cumsum(splits(:)')];
numY = numel(splitIndices)-1;
for i = 1:numY
    from            = splitIndices(i) + 1;
    to              = splitIndices(i+1);
    S.subs{DLTAxis}	= from:to;
    % The first numY outputs are the Y's. The second numY outputs are their
    % numDims. We assume all the outputs of Split have the same numDims as
    % the input.
    varargout{i}        = subsref(X, S);
    varargout{i + numY} = numDimsX;
end
end

%% Utility functions:

function s = appendStructs(varargin)
% s = appendStructs(s1, s2,...). Assign all fields in s1, s2,... into s.

%   Copyright 2020 The MathWorks, Inc.

if isempty(varargin)
    s = struct;
else
    s = varargin{1};
    for i = 2:numel(varargin)
        fromstr = varargin{i};
        fs = fieldnames(fromstr);
        for j = 1:numel(fs)
            s.(fs{j}) = fromstr.(fs{j});
        end
    end
end
end

function checkInputSize(inputShape, expectedShape, inputName)

%   Copyright 2020-2021 The MathWorks, Inc.

if numel(expectedShape)==0
    % The input is a scalar
    if ~isequal(inputShape, [1 1])
        inputSizeStr = makeSizeString(inputShape);
        error(message('nnet_cnn_onnx:onnx:InputNeedsResize',inputName, "[1,1]", inputSizeStr));
    end
elseif numel(expectedShape)==1
    % The input is a vector
    if ~shapeIsColumnVector(inputShape) || ~iSizesMatch({inputShape(1)}, expectedShape)
        expectedShape{2} = 1;
        expectedSizeStr = makeSizeString(expectedShape);
        inputSizeStr = makeSizeString(inputShape);
        error(message('nnet_cnn_onnx:onnx:InputNeedsResize',inputName, expectedSizeStr, inputSizeStr));
    end
else
    % The input has 2 dimensions or more

    % The input dimensions have been reversed; flip them back to compare to the
    % expected ONNX shape.
    inputShape = fliplr(inputShape);

    % If the expected shape has fewer dims than the input shape, error.
    if numel(expectedShape) < numel(inputShape)
        expectedSizeStr = strjoin(["[", strjoin(string(expectedShape), ","), "]"], "");
        error(message('nnet_cnn_onnx:onnx:InputHasGreaterNDims', inputName, expectedSizeStr));
    end

    % Prepad the input shape with trailing ones up to the number of elements in
    % expectedShape
    inputShape = num2cell([ones(1, numel(expectedShape) - length(inputShape)) inputShape]);

    % Find the number of variable size dimensions in the expected shape
    numVariableInputs = sum(cellfun(@(x) isa(x, 'char') || isa(x, 'string'), expectedShape));

    % Find the number of input dimensions that are not in the expected shape
    % and cannot be represented by a variable dimension
    nonMatchingInputDims = setdiff(string(inputShape), string(expectedShape));
    numNonMatchingInputDims  = numel(nonMatchingInputDims) - numVariableInputs;

    expectedSizeStr = makeSizeString(expectedShape);
    inputSizeStr = makeSizeString(inputShape);
    if numNonMatchingInputDims == 0 && ~iSizesMatch(inputShape, expectedShape)
        % The actual and expected input dimensions match, but in
        % a different order. The input needs to be permuted.
        error(message('nnet_cnn_onnx:onnx:InputNeedsPermute',inputName, expectedSizeStr, inputSizeStr));
    elseif numNonMatchingInputDims > 0
        % The actual and expected input sizes do not match.
        error(message('nnet_cnn_onnx:onnx:InputNeedsResize',inputName, expectedSizeStr, inputSizeStr));
    end
end
end

function doesMatch = iSizesMatch(inputShape, expectedShape)
% Check whether the input and expected shapes match, in order.
% Size elements match if (1) the elements are equal, or (2) the expected
% size element is a variable (represented by a character vector or string)
doesMatch = true;
for i=1:numel(inputShape)
    if ~(isequal(inputShape{i},expectedShape{i}) || ischar(expectedShape{i}) || isstring(expectedShape{i}))
        doesMatch = false;
        return
    end
end
end

function sizeStr = makeSizeString(shape)
sizeStr = strjoin(["[", strjoin(string(shape), ","), "]"], "");
end

function isVec = shapeIsColumnVector(shape)
if numel(shape) == 2 && shape(2) == 1
    isVec = true;
else
    isVec = false;
end
end
function X = makeUnlabeledDlarray(X)
% Make numeric X into an unlabelled dlarray

%   Copyright 2020-2021 The MathWorks, Inc.

if isa(X, 'dlarray')
    X = stripdims(X);
elseif isnumeric(X)
    if isinteger(X)
        % Make ints double so they can combine with anything without
        % reducing precision
        X = double(X);
    end
    X = dlarray(X);
end
end

function [Vars, NumDims] = packageVariables(params, inputNames, inputValues, inputNumDims)

%   Copyright 2020 The MathWorks, Inc.

% inputNames, inputValues are cell arrays. inputRanks is a numeric vector.
Vars = appendStructs(params.Learnables, params.Nonlearnables, params.State);
NumDims = params.NumDimensions;
% Add graph inputs
for i = 1:numel(inputNames)
    Vars.(inputNames{i}) = inputValues{i};
    NumDims.(inputNames{i}) = inputNumDims(i);
end
end

function X = permuteInputVar(X, userDataPerm, onnxNDims)

%   Copyright 2020-2021 The MathWorks, Inc.
% Returns reverse-ONNX ordering
if onnxNDims == 0
    return;
elseif onnxNDims == 1 && isvector(X)
    X = X(:);
    return;
elseif isnumeric(userDataPerm)
    % Permute into reverse ONNX ordering
    if numel(userDataPerm) ~= onnxNDims
        error(message('nnet_cnn_onnx:onnx:InputPermutationSize', numel(userDataPerm), onnxNDims));
    end
    perm = fliplr(userDataPerm);
elseif isequal(userDataPerm, 'auto') && onnxNDims == 4
    % Permute MATLAB HWCN to reverse onnx (WHCN)
    perm = [2 1 3 4];
elseif isequal(userDataPerm, 'as-is')
    % Do not permute the input
    perm = 1:ndims(X);
else
    % userDataPerm is either 'none' or 'auto' with no default, which means
    % it's already in onnx ordering, so just make it reverse onnx
    perm = max(2,onnxNDims):-1:1;
end
X = permute(X, perm);
end

function Y = permuteOutputVar(Y, userDataPerm, onnxNDims)

%   Copyright 2020-2021 The MathWorks, Inc.
switch onnxNDims
    case 0
        perm = [];
    case 1
        if isnumeric(userDataPerm)
            % Use the user's permutation because Y is a column vector which
            % already matches ONNX.
            perm = userDataPerm;
        elseif isequal(userDataPerm, 'auto')
            % Treat the 1D onnx vector as a 2D column and transpose it
            perm = [2 1];
        else
            % userDataPerm is 'none'. Leave Y alone because it already
            % matches onnx.
            perm = [];
        end
    otherwise
        % ndims >= 2
        if isnumeric(userDataPerm)
            % Use the inverse of the user's permutation. This is not just the
            % flip of the permutation vector.
            perm = onnxNDims + 1 - userDataPerm;
        elseif isequal(userDataPerm, 'auto')
            if onnxNDims == 2
                % Permute reverse ONNX CN to DLT CN (do nothing)
                perm = [];
            elseif onnxNDims == 4
                % Permute reverse onnx (WHCN) to MATLAB HWCN
                perm = [2 1 3 4];
            else
                % User wants the output in ONNX ordering, so just reverse it from
                % reverse onnx
                perm = onnxNDims:-1:1;
            end
        elseif isequal(userDataPerm, 'as-is')
            % Do not permute the input
            perm = 1:ndims(Y);
        else
            % userDataPerm is 'none', so just make it reverse onnx
            perm = onnxNDims:-1:1;
        end
end
if ~isempty(perm)
    Y = permute(Y, perm);
end
end

function s = updateStruct(s, t)
% Set all existing fields in s from fields in t, ignoring extra fields in
% t.
%   Copyright 2020 The MathWorks, Inc.

for name = transpose(fieldnames(s))
    s.(name{1}) = t.(name{1});
end
end
