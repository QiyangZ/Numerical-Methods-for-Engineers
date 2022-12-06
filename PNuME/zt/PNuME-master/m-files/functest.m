function functest(func,inputs_s, expected_outputs_s, eps)
    bestehen = true;
    for n=1:numel(inputs_s)
        expected_outputs = expected_outputs_s{n};
        if nargout(func) ~= numel(expected_outputs)
            bestehen = false;
            errormsg = ['Expect ', int2str(numel(expected_outputs)),' output(s), got ', int2str(nargout(func)),'.'];
            break;
        end
        [outputs{1:nargout(func)}] = func(inputs_s{n}{:});
        for m=1:numel(outputs)
            output = outputs{m};
            expected_output = expected_outputs{m};
            if ~strcmp(mat2str(size(output)), mat2str(size(expected_output)))
                bestehen = false;
                errormsg = ['At output ', int2str(m), ': expect output size: ',mat2str(size(expected_output)),', got ', mat2str(size(output)), '.'];
                break;
            end
            if ~all(abs(output-expected_output)<eps,'all')
                bestehen = false;
                errormsg = ['At output ', int2str(m), ': expect ',mat2str(expected_output),', got ', mat2str(output), '.'];
                break;
            end
        end
        if ~bestehen
            break;
        end
    end
    if bestehen
        disp(['Test bestanden: ', func2str(func)])
    else
        disp(['Test nicht bestanden: ', func2str(func)])
        disp(['  ','At input group ', int2str(n),':'])
        disp(['  ',errormsg])
    end

end
