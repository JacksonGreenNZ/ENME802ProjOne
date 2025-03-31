classdef planeFrameModel < handle
    %PLANEFRAMEMODEL Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        n_nodes uint64 = 0
        X(:,1) double = double.empty(0,1)
        Y(:,1) double = double.empty(0,1)
        Fx(:,1) double = double.empty(0,1)
        Fy(:,1) double = double.empty(0,1)
        M(:,1) double = double.empty(0,1)

        n_elements uint64 = 0
        ncon(:,2) uint64 = uint64.empty(0,2)
        E(:,1) double = double.empty(0,1)
        A(:,1) double = double.empty(0,1)
        I(:,1) double = double.empty(0,1)

        NDU uint64 = 0
        D(:,1) uint64 = uint64.empty(0,1)
    end

    events ( NotifyAccess = private ) 
        StructureChanged
    end
    
    methods
        function new(obj)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            obj.n_nodes = 0;
            obj.X = double.empty(0,1);
            obj.Y = double.empty(0,1);
            obj.Fx = double.empty(0,1);
            obj.Fy = double.empty(0,1);
            obj.M = double.empty(0,1);

            obj.n_elements = 0;
            obj.ncon = uint64.empty(0,2);
            obj.E = double.empty(0,1);
            obj.A = double.empty(0,1);
            obj.I = double.empty(0,1);

            obj.NDU = 0;
            obj.D = uint64.empty(0,1);

            notify(obj,"StructureChanged")
        end

        function open(obj, filepath)
            file = readtable(filepath);
            obj.n_nodes = file.n_nodes(1);
            obj.X = file.X(1:obj.n_nodes);
            obj.Y = file.Y(1:obj.n_nodes);
            obj.Fx = file.Fx(1:obj.n_nodes);
            obj.Fy = file.Fy(1:obj.n_nodes);
            obj.M = file.M(1:obj.n_nodes);

            obj.n_elements = file.n_elements(1);
            obj.ncon = [file.ncon_1(1:obj.n_elements), file.ncon_2(1:obj.n_elements)];
            obj.E = file.E(1:obj.n_elements);
            obj.A = file.A(1:obj.n_elements);
            obj.I = file.I(1:obj.n_elements);

            obj.NDU = file.NDU(1);
            obj.D = file.D(1:obj.NDU);
            
            notify(obj,"StructureChanged")
        end

        function save(obj, filepath)
            n_rows = obj.n_elements+1; %A connected graph has at least nodes-1 edges, thus elements+1 >= number of nodes
            
            n_nodes = double(obj.n_nodes);
            X = obj.X;
            Y = obj.Y;
            Fx = obj.Fx;
            Fy = obj.Fy;
            M = obj.M;
            n_elements = double(obj.n_elements);
            ncon_1 = double(obj.ncon(:,1));
            ncon_2 = double(obj.ncon(:,2));
            E = obj.E;
            A = obj.A;
            I = obj.I;
            NDU = double(obj.NDU);
            D = double(obj.D);

            n_nodes(end+1:n_rows,1) = nan
            X(end+1:n_rows) = nan
            Y(end+1:n_rows) = nan
            Fx(end+1:n_rows) = nan
            Fy(end+1:n_rows) = nan
            M(end+1:n_rows) = nan
            n_elements(end+1:n_rows,1) = nan
            ncon_1(end+1:n_rows) = nan
            ncon_2(end+1:n_rows) = nan
            E(end+1:n_rows) = nan
            A(end+1:n_rows) = nan
            I(end+1:n_rows) = nan
            NDU(end+1:n_rows,1) = nan
            D(end+1:n_rows) = nan

            data = table(n_nodes,X,Y,Fx,Fy,M,n_elements,ncon_1,ncon_2,E,A,I,NDU,D)

            writetable(data,filepath)
        end
    end
end

