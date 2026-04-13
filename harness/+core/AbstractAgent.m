classdef (Abstract) AbstractAgent < handle
    % ABSTRACTAGENT Interface for the Cognitive Tracing Research
    
    properties (Abstract)
        ID string
        State % Should be represented as a matrix/tensor
    end
    
    methods (Abstract)
        % Primary decision loop
        % observation: current environment state
        % prediction: the agent's internal guess of the next state
        [action, prediction] = step(obj, observation);
        
        % Reset logic for new simulation runs
        reset(obj);
    end
end

