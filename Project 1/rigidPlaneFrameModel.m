classdef rigidPlaneFrameModel < handle
    
    %Structure properties loaded from spreadsheet
    properties (SetObservable, AbortSet)
        %Node properties
        n_nodes uint64 = 2
        X(:,1) double = zeros(2,1,'double')
        Y(:,1) double = zeros(2,1,'double')
        n_Forces uint64 = 0
        Fx(:,1) double = zeros(2,1,'double')
        Fy(:,1) double = zeros(2,1,'double')
        n_Moments uint64 = 0
        M(:,1) double = zeros(2,1,'double')

        %Element properties
        n_elements uint64 = 1
        ncon(:,2) uint64 = [1 1]
        E(:,1) double = zeros(1,1,'double')
        A(:,1) double = zeros(1,1,'double')
        I(:,1) double = zeros(1,1,'double')

        %Fixed degrees of freedom
        NDU uint64 = 0
        dzero(:,1) uint64 = uint64.empty(0,1)

        %Distributed loads
        n_distLoads uint64 = 0
        UDL_el(:,1) uint64 = uint64.empty(0,1) %Element UDL is applied to
        UDL(:,1) double = double.empty(0,1)    %Load magnitude

    end


    %Derived/Computed properties
    properties
        Xline(:,4,20) = zeros(0,4,20) %Deformed spline X
        Yline(:,4,20) = zeros(0,4,20) %Defromed spline Y
        F(:,1) double = double.empty(0,1) %Combined force vector
        L(:,1) double = double.empty(0,1) %Vector for element length
        alpha(:,1) double = double.empty(0,1) %Vector for element angle
        K(:,:) double = double.empty() %K stiffness matrix
        nodal_F(:,1) double = double.empty(0,1) %Vector for element angle
        nodal_d(:,1) double = double.empty(0,1) %Vector for element angle
    end

    methods
        %Setter Function for updating values upon n_node change
        function set.n_nodes(obj, val)
            oldn_nodes = obj.n_nodes;
            obj.n_nodes = val;

            %Expands/Shrinks model nodal properties
            if obj.n_nodes > oldn_nodes
                obj.X(end+1:obj.n_nodes) = 0;
                obj.Y(end+1:obj.n_nodes) = 0;
                obj.Fx(end+1:obj.n_nodes) = 0;
                obj.Fy(end+1:obj.n_nodes) = 0;
                obj.M(end+1:obj.n_nodes) = 0;
            elseif obj.n_nodes < oldn_nodes
                obj.X(obj.n_nodes+1:end) = [];
                obj.Y(obj.n_nodes+1:end) = [];
                obj.Fx(obj.n_nodes+1:end) = [];
                obj.Fy(obj.n_nodes+1:end) = [];
                obj.M(obj.n_nodes+1:end) = [];
            end

            %Updates n_elements from n_nodes
            if obj.n_elements < obj.n_nodes-1 %Minimum number of elements for connected graph
                obj.n_elements = obj.n_nodes-1;
            elseif obj.n_elements > obj.n_nodes*(obj.n_nodes-1)/2 %Maximum number of elements for complete graph
                obj.n_elements = obj.n_nodes*(obj.n_nodes-1)/2;
            end
        end

        %Setter Function for updating values upon n_node change
        function set.n_elements(obj, val)
            oldn_elements = obj.n_elements;
            obj.n_elements = val;

            %Expands/Shrinks model element properties
            if obj.n_elements > oldn_elements
                obj.ncon(end+1:obj.n_elements,:) = 1;
                obj.E(end+1:obj.n_elements) = 0;
                obj.A(end+1:obj.n_elements) = 0;
                obj.I(end+1:obj.n_elements) = 0;
            elseif obj.n_elements < oldn_elements
                obj.ncon(obj.n_elements+1:end,:) = [];
                obj.E(obj.n_elements+1:end) = [];
                obj.A(obj.n_elements+1:end) = [];
                obj.I(obj.n_elements+1:end) = [];
            end

            %Updates n_nodes from n_elements
            if obj.n_elements < obj.n_nodes-1
                obj.n_nodes = obj.n_elements+1;
            elseif obj.n_elements > obj.n_nodes*(obj.n_nodes-1)/2
                obj.n_nodes = obj.n_elements+1;
            end
        end

        %Setter Function for updating values upon NDU change
        function set.NDU(obj, val)
            oldNDU = obj.NDU;
            obj.NDU = val;

            %Update dzero vector length
            if obj.NDU > oldNDU
                obj.dzero(end+1:obj.NDU) = 0;
            elseif obj.NDU < oldNDU
                obj.dzero(obj.NDU+1:end) = [];
            end
        end

        %Setter Function for updating values upon n_distLoads change
        function set.n_distLoads(obj, val)
            oldn_distLoads = obj.n_distLoads;
            obj.n_distLoads = val;

            %Update UDL and UDL_el vector length
            if obj.n_distLoads > oldn_distLoads
                obj.UDL_el(end+1:obj.n_distLoads) = 0;
                obj.UDL(end+1:obj.n_distLoads) = 0;
            elseif obj.n_distLoads < oldn_distLoads
                obj.UDL_el(obj.n_distLoads+1:end) = [];
                obj.UDL(obj.n_distLoads+1:end) = [];
            end
        end
    end
    
    %Model Events
    events ( NotifyAccess = private )
        PreprocessStart
        PreprocessEnd
        KassembleStart
        KassembleEnd
        SolveStart
        SolveEnd
        PostprocessStart
        PostprocessEnd
    end


    methods(Static)
        %Returns the length and angle of a line from +X going couterclockwise 
        function [L,alpha] = lengthAndAngle(x1,x2,y1,y2)
            L = sqrt((x2-x1)^2 +(y2-y1)^2);
            alpha = atan2((y2-y1),(x2-x1));
        end
        
        %Returns the elemental stiffness matrix given E,A,I,L,alpha
        function KE = K_element(E, A, I, L, alpha)
            c = cos(alpha);
            s = sin(alpha);
            const = E/L;

            %Create 4x4 sub matrix
            K_sub1 = [(A*c^2+((12*I*s^2)/L^2))      (A-(12*I/L^2))*c*s;
                (A-(12*I/L^2))*c*s            (A*s^2+(12*I*c^2/L^2)) ];

            %Create 2x2 sub matrix
            K_sub2 = [-(6*I*s/L);
                (6*I*c/L)    ];

            K_top = [K_sub1 K_sub2 -K_sub1 K_sub2]; %Rows 1:2
            K_bot = -K_top;                         %Rows 4:5

            KE = [K_top;
                K_sub2.' (4*I) -K_sub2.' (2*I);   %Row 3
                K_bot;
                K_sub2.' (2*I) -K_sub2.' (4*I)];  %Row 6

            KE = const * KE;
        end
    end

    methods
        %Preprocess Function
        function preprocess(obj)
            notify(obj,"PreprocessStart")
            time = tic; %Start timer
            
            %Assemble forces into single force vector
            for i = 1:obj.n_nodes
                obj.F(3*i-2) = obj.Fx(i);
                obj.F(3*i-1) = obj.Fy(i);
                obj.F(3*i) = obj.M(i);
            end
            
            
            %Compute and store the lengths and angles of each element
            for i = 1:obj.n_elements
                n1 = obj.ncon(i,1);
                n2 = obj.ncon(i,2);

                [obj.L(i), obj.alpha(i)] = obj.lengthAndAngle(obj.X(n1), obj.X(n2), obj.Y(n1), obj.Y(n2));
            end

            %Apply UDL forces to force vector
            for i = 1:obj.n_distLoads
                obj.F = obj.F + obj.UDLtoFVec(obj.UDL_el(i),obj.UDL());
            end
            
            notify(obj,"PreprocessEnd", execTime(toc(time))) %Send event with elapsed time
        end

        
        function assemble_K(obj)
            notify(obj,"KassembleStart")
            time = tic; %Start timer
            obj.K = zeros(obj.n_nodes*3);

            for i = 1:obj.n_elements
                KE = obj.K_element(obj.E(i),obj.A(i),obj.I(i),obj.L(i),obj.alpha(i));

                n1 = obj.ncon(i,1);
                n2 = obj.ncon(i,2);

                III(1) = (3*n1) - 2;
                III(2) = (3*n1) - 1;
                III(3) = (3*n1);
                III(4) = (3*n2) - 2;
                III(5) = (3*n2) - 1;
                III(6) = (3*n2);


                for VI = 1:6
                    MI = III(VI);
                    for JX = 1:6
                        MJ = III(JX);
                        obj.K(MI,MJ) = obj.K(MI,MJ) + KE(VI,JX);
                    end
                end
            end
            obj.K
            notify(obj,"KassembleEnd", execTime(toc(time))) %Send event with elapsed time
        end

        function solve(obj)
            notify(obj,"SolveStart")
            time = tic; %Start timer
            KT = obj.K;
            for k = 1:obj.NDU
                n = obj.dzero(k);
                KT(n,:) = 0;
                KT(:,n) = 0;
                KT(n,n) = 1;
            end

            %Solve for displacement and force vetors
            obj.nodal_d = KT\obj.F;
            for i = 1:obj.NDU
                obj.nodal_d(obj.dzero(i)) = 0;
            end
            obj.nodal_F = obj.K*obj.nodal_d;
            obj.nodal_F
            obj.nodal_d
            notify(obj,"SolveEnd", execTime(toc(time))) %Send event with elapsed time
        end

        function postprocess(obj)
            notify(obj,"PostprocessStart")
            time = tic; %Start timer

            s = linspace(0, 1, 20);

            obj.Xline = zeros(obj.n_elements,4,20);
            obj.Yline = zeros(obj.n_elements,4,20);

            for i = 1:obj.n_elements

            %cubic splines
                obj.Xline(i,1,:) = (1 - 3*s.^2 + 2*s.^3);
                obj.Xline(i,2,:) = (3*s.^2 - 2*s.^3);
                obj.Xline(i,3,:) = (s.^3 - 2*s.^2 + s) * obj.L(i);
                obj.Xline(i,4,:) = (s.^3 - s.^2) * obj.L(i);
                obj.Yline(i,1,:) = (1 - 3*s.^2 + 2*s.^3);
                obj.Yline(i,2,:) = (3*s.^2 - 2*s.^3);
                obj.Yline(i,3,:) = (s.^3 - 2*s.^2 + s) * obj.L(i);
                obj.Yline(i,4,:) = (s.^3 - s.^2) * obj.L(i);
            end
            notify(obj,"PostprocessEnd", execTime(toc(time))) %Send event with elapsed time
        end

        %Takes the magnitude of a UDL and the element its loading
        %Returns a nodal force vetor equivilent to the UDL
        function F = UDLtoFVec(obj, elementID, mag)
            F = zeros(obj.n_nodes*3,1);

            Length = obj.L(elementID);
            el_alpha = obj.alpha(elementID);

            n1 = obj.ncon(elementID, 1);
            n2 = obj.ncon(elementID, 2);

            F([n1*3-2 n2*3-2]) = mag*Length(elementID)*sin(el_alpha)/2; %Nodal X components
            F([n1*3-1 n2*3-1]) = -mag*Length*cos(el_alpha)/2;           %Nodal Y components
 
            %Nodal Bending moments
            F(n1*3) = -mag*Length^2/12;
            F(n2*3) = mag*Length^2/12;
        end
    end

    %Data and File functions
    methods
        %Reset all data properties
        function new(obj)
            obj.n_nodes = 2;
            obj.X = zeros(2,1,'double');
            obj.Y = zeros(2,1,'double');
            obj.n_Forces = 0;
            obj.Fx = zeros(2,1,'double');
            obj.Fy = zeros(2,1,'double');
            obj.n_Moments = 0;
            obj.M = zeros(2,1,'double');

            obj.n_elements = 1;
            obj.ncon = [1 1];
            obj.E = zeros(1,1,'double');
            obj.A = zeros(1,1,'double');
            obj.I = zeros(1,1,'double');

            obj.NDU = 0;
            obj.dzero = uint64.empty(0,1);

            obj.n_distLoads = 0;
            obj.UDL_el = uint64.empty(0,1);
            obj.UDL = double.empty(0,1);

        end
        
        %Load structure data from file
        function open(obj, filepath)
            file = readtable(filepath);
            obj.n_nodes = file.n_nodes(1);
            obj.X = file.X(1:obj.n_nodes);
            obj.Y = file.Y(1:obj.n_nodes);
            obj.n_Forces = file.n_Forces(1);
            obj.Fx = file.Fx(1:obj.n_nodes);
            obj.Fy = file.Fy(1:obj.n_nodes);
            obj.n_Moments = file.n_Moments(1);
            obj.M = file.M(1:obj.n_nodes);

            obj.n_elements = file.n_elements(1);
            obj.ncon = [file.ncon_1(1:obj.n_elements), file.ncon_2(1:obj.n_elements)];
            obj.E = file.E(1:obj.n_elements);
            obj.A = file.A(1:obj.n_elements);
            obj.I = file.I(1:obj.n_elements);

            obj.NDU = file.NDU(1);
            obj.dzero = file.dzero(1:obj.NDU);

            obj.n_distLoads = file.n_distLoads(1);
            obj.UDL_el = file.UDL_el(1:obj.n_distLoads);
            obj.UDL = file.UDL(1:obj.n_distLoads);

            
        end

        %Save structure data to file
        function save(obj, filepath)
            n_rows = obj.n_elements+1; %A connected graph has at least nodes-1 edges, thus elements+1 >= number of nodes

            n_nodes = double(obj.n_nodes);
            X = obj.X;
            Y = obj.Y;
            n_Forces = obj.n_Forces;
            Fx = obj.Fx;
            Fy = obj.Fy;
            n_Moments = obj.n_Moments;
            M = obj.M;
            n_elements = double(obj.n_elements);
            ncon_1 = double(obj.ncon(:,1));
            ncon_2 = double(obj.ncon(:,2));
            E = obj.E;
            A = obj.A;
            I = obj.I;
            NDU = double(obj.NDU);
            dzero = double(obj.dzero);

            n_distLoads = obj.n_distLoads;
            UDL_el = obj.UDL_el;
            UDL = obj.UDL;

            n_nodes(end+1:n_rows,1) = nan;
            X(end+1:n_rows) = nan;
            Y(end+1:n_rows) = nan;
            n_Forces(end+1:n_Forces,1) = nan;
            Fx(end+1:n_rows) = nan;
            Fy(end+1:n_rows) = nan;
            n_Moments(end+1:n_Moments,1) = nan;
            M(end+1:n_rows) = nan;
            n_elements(end+1:n_rows,1) = nan;
            ncon_1(end+1:n_rows) = nan;
            ncon_2(end+1:n_rows) = nan;
            E(end+1:n_rows) = nan;
            A(end+1:n_rows) = nan;
            I(end+1:n_rows) = nan;
            NDU(end+1:n_rows,1) = nan;
            dzero(end+1:n_rows) = nan;

            n_distLoads(end+1:n_rows) = nan;
            UDL_el(end+1:n_rows) = nan;
            UDL(end+1:n_rows) = nan;

            data = table(n_nodes,X,Y,n_Forces,Fx,Fy,n_Moments,M,n_elements,ncon_1,ncon_2,E,A,I,NDU,dzero,n_distLoads,UDL_el,UDL);

            writetable(data,filepath)
        end
    end
end

