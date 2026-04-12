classdef CognitiveLogger < handle
    properties
        Trace % Stores the 'Cognitive Trajectory'
    end
    
    methods
        function logDivergence(obj, step, predictedState, actualState, reasoning)
            % Breakthrough Metric: The 'Reasoning Error'
            % E = ||S_pred - S_actual||
            errorVal = norm(predictedState - actualState);
            
            entry = struct(...
                'Step', step, ...
                'Reasoning', reasoning, ...
                'Divergence', errorVal, ...
                'Timestamp', datetime('now')...
            );
            obj.Trace(end+1) = entry;
            
            % Ensure logs directory exists
            if ~exist('logs', 'dir')
                mkdir('logs');
            end
            
            % Save as JSON for Jules to analyze
            fid = fopen('logs/divergence_trace.json', 'w');
            if fid ~= -1
                fprintf(fid, jsonencode(obj.Trace, 'PrettyPrint', true));
                fclose(fid);
            end
        end
    end
end
