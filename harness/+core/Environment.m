classdef Environment < handle
    methods
        function obs = getObservation(obj)
            obs = rand(1, 5);
        end
    end
end
