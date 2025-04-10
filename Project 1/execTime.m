classdef (ConstructOnLoad) execTime < event.EventData
    properties
        time
    end
    methods
      function data = execTime(time)
         data.time = time;
      end
   end
end

