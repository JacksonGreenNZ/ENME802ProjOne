classdef cae_gui_scratch_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                       matlab.ui.Figure
        TabGroup                       matlab.ui.container.TabGroup
        ProblemViewerTab               matlab.ui.container.Tab
        ResetAllButton                 matlab.ui.control.Button
        DataPanel                      matlab.ui.container.Panel
        NodeDropDown_4                 matlab.ui.control.DropDown
        NodeDropDown_2Label_3          matlab.ui.control.Label
        NodeDropDown_3                 matlab.ui.control.DropDown
        NodeDropDown_2Label_2          matlab.ui.control.Label
        ForceAxisDropDownLabel_2       matlab.ui.control.Label
        ForceAxisDropDown_2            matlab.ui.control.DropDown
        MomentsLabel                   matlab.ui.control.Label
        DistLoadsLabel                 matlab.ui.control.Label
        PointForcesLabel               matlab.ui.control.Label
        ElementsLabel                  matlab.ui.control.Label
        NodesLabel                     matlab.ui.control.Label
        DistLoadsDropDown              matlab.ui.control.DropDown
        DistLoadsDropDownLabel         matlab.ui.control.Label
        MomentsDropDown                matlab.ui.control.DropDown
        MomentsDropDownLabel           matlab.ui.control.Label
        FEditFieldLabel_2              matlab.ui.control.Label
        FEditField_3                   matlab.ui.control.NumericEditField
        Aream2EditFieldLabel           matlab.ui.control.Label
        Point2DropDownLabel            matlab.ui.control.Label
        EEditFieldLabel                matlab.ui.control.Label
        Point1DropDownLabel            matlab.ui.control.Label
        ElementDataDropDownLabel       matlab.ui.control.Label
        PointForceDataDropDownLabel    matlab.ui.control.Label
        YPosmEditFieldLabel            matlab.ui.control.Label
        XPosmEditFieldLabel            matlab.ui.control.Label
        FEditFieldLabel                matlab.ui.control.Label
        NodePositionDropDownLabel      matlab.ui.control.Label
        NoMomentsSpinnerLabel          matlab.ui.control.Label
        Im4EditFieldLabel              matlab.ui.control.Label
        NoDistributedForcesSpinnerLabel  matlab.ui.control.Label
        NoPointForcesSpinnerLabel      matlab.ui.control.Label
        NoElementsSpinnerLabel         matlab.ui.control.Label
        NoNodesSpinnerLabel            matlab.ui.control.Label
        ProblemSelectionDropDownLabel  matlab.ui.control.Label
        NodeDropDown                   matlab.ui.control.DropDown
        NodeDropDown_2Label            matlab.ui.control.Label
        DirectionDropDown              matlab.ui.control.DropDown
        DirectionDropDownLabel         matlab.ui.control.Label
        FEditField_2                   matlab.ui.control.NumericEditField
        FEditField_3Label              matlab.ui.control.Label
        ForceAxisDropDownLabel         matlab.ui.control.Label
        Lamp_21                        matlab.ui.control.Lamp
        SubmitButton_5                 matlab.ui.control.Button
        DropDown_4                     matlab.ui.control.DropDown
        Lamp_20                        matlab.ui.control.Lamp
        SubmitButton_4                 matlab.ui.control.Button
        DropDown_3                     matlab.ui.control.DropDown
        Lamp_19                        matlab.ui.control.Lamp
        SubmitButton_3                 matlab.ui.control.Button
        DropDown_2                     matlab.ui.control.DropDown
        Lamp_18                        matlab.ui.control.Lamp
        SubmitButton_2                 matlab.ui.control.Button
        FixedCheckBox                  matlab.ui.control.CheckBox
        Lamp_17                        matlab.ui.control.Lamp
        SubmitButton                   matlab.ui.control.Button
        DataLoadedLabel                matlab.ui.control.Label
        Lamp_16                        matlab.ui.control.Lamp
        SubmitResetButton_5            matlab.ui.control.Button
        Lamp_15                        matlab.ui.control.Lamp
        DropDown                       matlab.ui.control.DropDown
        SubmitResetButton_4            matlab.ui.control.Button
        Lamp_14                        matlab.ui.control.Lamp
        SubmitResetButton_3            matlab.ui.control.Button
        Lamp_13                        matlab.ui.control.Lamp
        SubmitResetButton_2            matlab.ui.control.Button
        Lamp_12                        matlab.ui.control.Lamp
        ForceAxisDropDown              matlab.ui.control.DropDown
        Im4EditField                   matlab.ui.control.NumericEditField
        FEditField                     matlab.ui.control.NumericEditField
        PointForceDataDropDown         matlab.ui.control.DropDown
        EEditField                     matlab.ui.control.NumericEditField
        Aream2EditField                matlab.ui.control.NumericEditField
        Point2DropDown                 matlab.ui.control.DropDown
        Point1DropDown                 matlab.ui.control.DropDown
        ElementDataDropDown            matlab.ui.control.DropDown
        YPosmEditField                 matlab.ui.control.NumericEditField
        XPosmEditField                 matlab.ui.control.NumericEditField
        NodePositionDropDown           matlab.ui.control.DropDown
        NoMomentsSpinner               matlab.ui.control.Spinner
        NoDistributedForcesSpinner     matlab.ui.control.Spinner
        NoPointForcesSpinner           matlab.ui.control.Spinner
        NoElementsSpinner              matlab.ui.control.Spinner
        NoNodesSpinner                 matlab.ui.control.Spinner
        ProblemSelectionDropDown       matlab.ui.control.DropDown
        SubmitResetButton              matlab.ui.control.Button
        Lamp_11                        matlab.ui.control.Lamp
        AlldatareadyLabel              matlab.ui.control.Label
        GivenStructureLabel            matlab.ui.control.Label
        SolveButton                    matlab.ui.control.Button
        UIAxes_4                       matlab.ui.control.UIAxes
        SolvedProblemTab               matlab.ui.container.Tab
        DataOutputPanel                matlab.ui.container.Panel
        UITable                        matlab.ui.control.Table
        UserInputPanel                 matlab.ui.container.Panel
        ApplyButton_2                  matlab.ui.control.Button
        ApplyButton                    matlab.ui.control.Button
        RotationScalingSlider          matlab.ui.control.Slider
        RotationScalingLabel           matlab.ui.control.Label
        DeformationScalingSlider       matlab.ui.control.Slider
        DeformationScalingLabel        matlab.ui.control.Label
        DeformedStructurePanel         matlab.ui.container.Panel
        StartOverButton                matlab.ui.control.Button
        UIAxes_3                       matlab.ui.control.UIAxes
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            % USE LATER
            
            %LAMPS
            % app.Lamp.Color = [0.5 0.5 0.5];
            % app.Lamp_2.Color = [0.5 0.5 0.5];
            % app.Lamp_3.Color = [0.5 0.5 0.5];
            % app.Lamp_4.Color = [0.5 0.5 0.5];
            % app.Lamp_5.Color = [0.5 0.5 0.5];

            % app.SubmitResetButton.Enable = 'off';
            % app.SubmitResetButton_2.Enable = 'off';
            % app.SubmitResetButton_3.Enable = 'off';
            % app.SubmitResetButton_4.Enable = 'off';
            % app.SubmitResetButton_5.Enable = 'off';
            % app.NoMomentsSpinner.Enable='off';
            % app.NoDistributedForcesSpinner.enable = 'off';
            % app.NoPointForcesSpinner.enable = 'off';
            % app.NoElementsSpinner.enable = 'off';
            % app.NoNodesSpinner.enable = 'off';
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 978 683];
            app.UIFigure.Name = 'MATLAB App';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.Position = [1 1 978 683];

            % Create ProblemViewerTab
            app.ProblemViewerTab = uitab(app.TabGroup);
            app.ProblemViewerTab.Title = 'Problem Viewer';

            % Create UIAxes_4
            app.UIAxes_4 = uiaxes(app.ProblemViewerTab);
            xlabel(app.UIAxes_4, 'X (m)')
            ylabel(app.UIAxes_4, 'Y (m)')
            zlabel(app.UIAxes_4, 'Z')
            app.UIAxes_4.Position = [474 150 481 381];

            % Create SolveButton
            app.SolveButton = uibutton(app.ProblemViewerTab, 'push');
            app.SolveButton.Enable = 'off';
            app.SolveButton.Position = [854 41 100 23];
            app.SolveButton.Text = 'Solve';

            % Create GivenStructureLabel
            app.GivenStructureLabel = uilabel(app.ProblemViewerTab);
            app.GivenStructureLabel.HorizontalAlignment = 'center';
            app.GivenStructureLabel.FontName = 'Courier';
            app.GivenStructureLabel.FontSize = 18;
            app.GivenStructureLabel.FontWeight = 'bold';
            app.GivenStructureLabel.Position = [645 530 167 23];
            app.GivenStructureLabel.Text = 'Given Structure';

            % Create AlldatareadyLabel
            app.AlldatareadyLabel = uilabel(app.ProblemViewerTab);
            app.AlldatareadyLabel.HorizontalAlignment = 'center';
            app.AlldatareadyLabel.FontWeight = 'bold';
            app.AlldatareadyLabel.Position = [726 41 91 22];
            app.AlldatareadyLabel.Text = 'All data ready?';

            % Create Lamp_11
            app.Lamp_11 = uilamp(app.ProblemViewerTab);
            app.Lamp_11.Position = [820 42 20 20];
            app.Lamp_11.Color = [0.502 0.502 0.502];

            % Create DataPanel
            app.DataPanel = uipanel(app.ProblemViewerTab);
            app.DataPanel.Title = 'Data';
            app.DataPanel.Position = [1 1 463 658];

            % Create SubmitResetButton
            app.SubmitResetButton = uibutton(app.DataPanel, 'push');
            app.SubmitResetButton.Enable = 'off';
            app.SubmitResetButton.Position = [253 584 100 23];
            app.SubmitResetButton.Text = 'Submit/Reset';

            % Create ProblemSelectionDropDown
            app.ProblemSelectionDropDown = uidropdown(app.DataPanel);
            app.ProblemSelectionDropDown.Items = {'Custom', 'Q1', 'Q2', 'Q3', 'Q4'};
            app.ProblemSelectionDropDown.Position = [144 613 100 22];
            app.ProblemSelectionDropDown.Value = 'Custom';

            % Create NoNodesSpinner
            app.NoNodesSpinner = uispinner(app.DataPanel);
            app.NoNodesSpinner.Limits = [2 Inf];
            app.NoNodesSpinner.Position = [145 581 100 22];
            app.NoNodesSpinner.Value = 2;

            % Create NoElementsSpinner
            app.NoElementsSpinner = uispinner(app.DataPanel);
            app.NoElementsSpinner.Limits = [1 Inf];
            app.NoElementsSpinner.Enable = 'off';
            app.NoElementsSpinner.Position = [145 548 100 22];
            app.NoElementsSpinner.Value = 1;

            % Create NoPointForcesSpinner
            app.NoPointForcesSpinner = uispinner(app.DataPanel);
            app.NoPointForcesSpinner.Limits = [0 Inf];
            app.NoPointForcesSpinner.Enable = 'off';
            app.NoPointForcesSpinner.Position = [145 515 100 22];

            % Create NoDistributedForcesSpinner
            app.NoDistributedForcesSpinner = uispinner(app.DataPanel);
            app.NoDistributedForcesSpinner.Limits = [0 Inf];
            app.NoDistributedForcesSpinner.Enable = 'off';
            app.NoDistributedForcesSpinner.Position = [145 482 100 22];

            % Create NoMomentsSpinner
            app.NoMomentsSpinner = uispinner(app.DataPanel);
            app.NoMomentsSpinner.Limits = [0 Inf];
            app.NoMomentsSpinner.Enable = 'off';
            app.NoMomentsSpinner.Position = [145 449 100 22];

            % Create NodePositionDropDown
            app.NodePositionDropDown = uidropdown(app.DataPanel);
            app.NodePositionDropDown.Items = {'Node 1'};
            app.NodePositionDropDown.Enable = 'off';
            app.NodePositionDropDown.Position = [130 406 75 22];
            app.NodePositionDropDown.Value = 'Node 1';

            % Create XPosmEditField
            app.XPosmEditField = uieditfield(app.DataPanel, 'numeric');
            app.XPosmEditField.Enable = 'off';
            app.XPosmEditField.Position = [89 380 53 22];

            % Create YPosmEditField
            app.YPosmEditField = uieditfield(app.DataPanel, 'numeric');
            app.YPosmEditField.Enable = 'off';
            app.YPosmEditField.Position = [223 380 51 22];

            % Create ElementDataDropDown
            app.ElementDataDropDown = uidropdown(app.DataPanel);
            app.ElementDataDropDown.Items = {'Element 1'};
            app.ElementDataDropDown.Enable = 'off';
            app.ElementDataDropDown.Position = [103 331 108 22];
            app.ElementDataDropDown.Value = 'Element 1';

            % Create Point1DropDown
            app.Point1DropDown = uidropdown(app.DataPanel);
            app.Point1DropDown.Items = {'Node 1 (X,Y)'};
            app.Point1DropDown.Enable = 'off';
            app.Point1DropDown.Position = [71 302 107 22];
            app.Point1DropDown.Value = 'Node 1 (X,Y)';

            % Create Point2DropDown
            app.Point2DropDown = uidropdown(app.DataPanel);
            app.Point2DropDown.Items = {'Node 1 (X,Y)'};
            app.Point2DropDown.Enable = 'off';
            app.Point2DropDown.Position = [251 302 115 22];
            app.Point2DropDown.Value = 'Node 1 (X,Y)';

            % Create Aream2EditField
            app.Aream2EditField = uieditfield(app.DataPanel, 'numeric');
            app.Aream2EditField.Limits = [0 Inf];
            app.Aream2EditField.Enable = 'off';
            app.Aream2EditField.Position = [216 275 58 22];

            % Create EEditField
            app.EEditField = uieditfield(app.DataPanel, 'numeric');
            app.EEditField.Limits = [0 Inf];
            app.EEditField.Enable = 'off';
            app.EEditField.Position = [243 331 45 22];

            % Create PointForceDataDropDown
            app.PointForceDataDropDown = uidropdown(app.DataPanel);
            app.PointForceDataDropDown.Items = {'Force 1'};
            app.PointForceDataDropDown.Enable = 'off';
            app.PointForceDataDropDown.Position = [128 223 77 22];
            app.PointForceDataDropDown.Value = 'Force 1';

            % Create FEditField
            app.FEditField = uieditfield(app.DataPanel, 'numeric');
            app.FEditField.Enable = 'off';
            app.FEditField.Position = [46 195 55 22];

            % Create Im4EditField
            app.Im4EditField = uieditfield(app.DataPanel, 'numeric');
            app.Im4EditField.Limits = [0 Inf];
            app.Im4EditField.Enable = 'off';
            app.Im4EditField.Position = [71 275 70 22];

            % Create ForceAxisDropDown
            app.ForceAxisDropDown = uidropdown(app.DataPanel);
            app.ForceAxisDropDown.Items = {'X', 'Y'};
            app.ForceAxisDropDown.Enable = 'off';
            app.ForceAxisDropDown.Position = [230 195 46 22];
            app.ForceAxisDropDown.Value = 'X';

            % Create Lamp_12
            app.Lamp_12 = uilamp(app.DataPanel);
            app.Lamp_12.Position = [404 586 20 20];
            app.Lamp_12.Color = [0.502 0.502 0.502];

            % Create SubmitResetButton_2
            app.SubmitResetButton_2 = uibutton(app.DataPanel, 'push');
            app.SubmitResetButton_2.Enable = 'off';
            app.SubmitResetButton_2.Position = [253 551 100 23];
            app.SubmitResetButton_2.Text = 'Submit/Reset';

            % Create Lamp_13
            app.Lamp_13 = uilamp(app.DataPanel);
            app.Lamp_13.Position = [404 553 20 20];
            app.Lamp_13.Color = [0.502 0.502 0.502];

            % Create SubmitResetButton_3
            app.SubmitResetButton_3 = uibutton(app.DataPanel, 'push');
            app.SubmitResetButton_3.Enable = 'off';
            app.SubmitResetButton_3.Position = [253 518 100 23];
            app.SubmitResetButton_3.Text = 'Submit/Reset';

            % Create Lamp_14
            app.Lamp_14 = uilamp(app.DataPanel);
            app.Lamp_14.Position = [404 520 20 20];
            app.Lamp_14.Color = [0.502 0.502 0.502];

            % Create SubmitResetButton_4
            app.SubmitResetButton_4 = uibutton(app.DataPanel, 'push');
            app.SubmitResetButton_4.Enable = 'off';
            app.SubmitResetButton_4.Position = [253 485 100 23];
            app.SubmitResetButton_4.Text = 'Submit/Reset';

            % Create DropDown
            app.DropDown = uidropdown(app.DataPanel);
            app.DropDown.Items = {'Nm', 'kNm'};
            app.DropDown.Enable = 'off';
            app.DropDown.Position = [128 37 52 22];
            app.DropDown.Value = 'Nm';

            % Create Lamp_15
            app.Lamp_15 = uilamp(app.DataPanel);
            app.Lamp_15.Position = [404 487 20 20];
            app.Lamp_15.Color = [0.502 0.502 0.502];

            % Create SubmitResetButton_5
            app.SubmitResetButton_5 = uibutton(app.DataPanel, 'push');
            app.SubmitResetButton_5.Enable = 'off';
            app.SubmitResetButton_5.Position = [253 452 100 23];
            app.SubmitResetButton_5.Text = 'Submit/Reset';

            % Create Lamp_16
            app.Lamp_16 = uilamp(app.DataPanel);
            app.Lamp_16.Position = [404 454 20 20];
            app.Lamp_16.Color = [0.502 0.502 0.502];

            % Create DataLoadedLabel
            app.DataLoadedLabel = uilabel(app.DataPanel);
            app.DataLoadedLabel.HorizontalAlignment = 'center';
            app.DataLoadedLabel.FontWeight = 'bold';
            app.DataLoadedLabel.Position = [375 609 77 22];
            app.DataLoadedLabel.Text = 'Data Loaded';

            % Create SubmitButton
            app.SubmitButton = uibutton(app.DataPanel, 'push');
            app.SubmitButton.Enable = 'off';
            app.SubmitButton.Position = [286 379 82 23];
            app.SubmitButton.Text = 'Submit';

            % Create Lamp_17
            app.Lamp_17 = uilamp(app.DataPanel);
            app.Lamp_17.Position = [404 383 20 20];
            app.Lamp_17.Color = [0.502 0.502 0.502];

            % Create FixedCheckBox
            app.FixedCheckBox = uicheckbox(app.DataPanel);
            app.FixedCheckBox.Enable = 'off';
            app.FixedCheckBox.Text = 'Fixed?';
            app.FixedCheckBox.Position = [220 406 58 22];

            % Create SubmitButton_2
            app.SubmitButton_2 = uibutton(app.DataPanel, 'push');
            app.SubmitButton_2.Enable = 'off';
            app.SubmitButton_2.Position = [284 274 83 23];
            app.SubmitButton_2.Text = 'Submit';

            % Create Lamp_18
            app.Lamp_18 = uilamp(app.DataPanel);
            app.Lamp_18.Position = [404 300 20 20];
            app.Lamp_18.Color = [0.502 0.502 0.502];

            % Create DropDown_2
            app.DropDown_2 = uidropdown(app.DataPanel);
            app.DropDown_2.Items = {'Pa', 'KPa', 'MPa', 'GPA'};
            app.DropDown_2.Enable = 'off';
            app.DropDown_2.Position = [298 331 67 22];
            app.DropDown_2.Value = 'KPa';

            % Create SubmitButton_3
            app.SubmitButton_3 = uibutton(app.DataPanel, 'push');
            app.SubmitButton_3.Enable = 'off';
            app.SubmitButton_3.Position = [285 194 83 23];
            app.SubmitButton_3.Text = 'Submit';

            % Create Lamp_19
            app.Lamp_19 = uilamp(app.DataPanel);
            app.Lamp_19.Position = [404 208 20 20];
            app.Lamp_19.Color = [0.502 0.502 0.502];

            % Create DropDown_3
            app.DropDown_3 = uidropdown(app.DataPanel);
            app.DropDown_3.Items = {'N', 'kN'};
            app.DropDown_3.Enable = 'off';
            app.DropDown_3.Position = [106 195 52 22];
            app.DropDown_3.Value = 'kN';

            % Create SubmitButton_4
            app.SubmitButton_4 = uibutton(app.DataPanel, 'push');
            app.SubmitButton_4.Enable = 'off';
            app.SubmitButton_4.Position = [285 116 83 23];
            app.SubmitButton_4.Text = 'Submit';

            % Create Lamp_20
            app.Lamp_20 = uilamp(app.DataPanel);
            app.Lamp_20.Position = [404 124 20 20];
            app.Lamp_20.Color = [0.502 0.502 0.502];

            % Create DropDown_4
            app.DropDown_4 = uidropdown(app.DataPanel);
            app.DropDown_4.Items = {'N/m', 'kN/m'};
            app.DropDown_4.Enable = 'off';
            app.DropDown_4.Position = [105 116 59 22];
            app.DropDown_4.Value = 'N/m';

            % Create SubmitButton_5
            app.SubmitButton_5 = uibutton(app.DataPanel, 'push');
            app.SubmitButton_5.Enable = 'off';
            app.SubmitButton_5.Position = [286 8 83 23];
            app.SubmitButton_5.Text = 'Submit';

            % Create Lamp_21
            app.Lamp_21 = uilamp(app.DataPanel);
            app.Lamp_21.Position = [404 38 20 20];
            app.Lamp_21.Color = [0.502 0.502 0.502];

            % Create ForceAxisDropDownLabel
            app.ForceAxisDropDownLabel = uilabel(app.DataPanel);
            app.ForceAxisDropDownLabel.HorizontalAlignment = 'center';
            app.ForceAxisDropDownLabel.Position = [163 195 61 22];
            app.ForceAxisDropDownLabel.Text = 'Force Axis';

            % Create FEditField_3Label
            app.FEditField_3Label = uilabel(app.DataPanel);
            app.FEditField_3Label.HorizontalAlignment = 'center';
            app.FEditField_3Label.Position = [44 37 25 22];
            app.FEditField_3Label.Text = 'F';

            % Create FEditField_2
            app.FEditField_2 = uieditfield(app.DataPanel, 'numeric');
            app.FEditField_2.Enable = 'off';
            app.FEditField_2.Position = [64 37 57 22];

            % Create DirectionDropDownLabel
            app.DirectionDropDownLabel = uilabel(app.DataPanel);
            app.DirectionDropDownLabel.HorizontalAlignment = 'center';
            app.DirectionDropDownLabel.Position = [194 37 52 22];
            app.DirectionDropDownLabel.Text = 'Direction';

            % Create DirectionDropDown
            app.DirectionDropDown = uidropdown(app.DataPanel);
            app.DirectionDropDown.Items = {'Clockwise', 'Anti-Clockwise'};
            app.DirectionDropDown.Enable = 'off';
            app.DirectionDropDown.Position = [248 37 120 22];
            app.DirectionDropDown.Value = 'Clockwise';

            % Create NodeDropDown_2Label
            app.NodeDropDown_2Label = uilabel(app.DataPanel);
            app.NodeDropDown_2Label.HorizontalAlignment = 'center';
            app.NodeDropDown_2Label.Position = [207 64 42 22];
            app.NodeDropDown_2Label.Text = 'Node';

            % Create NodeDropDown
            app.NodeDropDown = uidropdown(app.DataPanel);
            app.NodeDropDown.Items = {'Node 1 (X,Y)'};
            app.NodeDropDown.Enable = 'off';
            app.NodeDropDown.Position = [248 64 121 22];
            app.NodeDropDown.Value = 'Node 1 (X,Y)';

            % Create ProblemSelectionDropDownLabel
            app.ProblemSelectionDropDownLabel = uilabel(app.DataPanel);
            app.ProblemSelectionDropDownLabel.HorizontalAlignment = 'right';
            app.ProblemSelectionDropDownLabel.Position = [27 613 102 22];
            app.ProblemSelectionDropDownLabel.Text = 'Problem Selection';

            % Create NoNodesSpinnerLabel
            app.NoNodesSpinnerLabel = uilabel(app.DataPanel);
            app.NoNodesSpinnerLabel.HorizontalAlignment = 'right';
            app.NoNodesSpinnerLabel.Position = [70 581 62 22];
            app.NoNodesSpinnerLabel.Text = 'No. Nodes';

            % Create NoElementsSpinnerLabel
            app.NoElementsSpinnerLabel = uilabel(app.DataPanel);
            app.NoElementsSpinnerLabel.HorizontalAlignment = 'right';
            app.NoElementsSpinnerLabel.Position = [55 548 77 22];
            app.NoElementsSpinnerLabel.Text = 'No. Elements';

            % Create NoPointForcesSpinnerLabel
            app.NoPointForcesSpinnerLabel = uilabel(app.DataPanel);
            app.NoPointForcesSpinnerLabel.HorizontalAlignment = 'right';
            app.NoPointForcesSpinnerLabel.Position = [38 515 94 22];
            app.NoPointForcesSpinnerLabel.Text = 'No. Point Forces';

            % Create NoDistributedForcesSpinnerLabel
            app.NoDistributedForcesSpinnerLabel = uilabel(app.DataPanel);
            app.NoDistributedForcesSpinnerLabel.HorizontalAlignment = 'right';
            app.NoDistributedForcesSpinnerLabel.Position = [8 482 124 22];
            app.NoDistributedForcesSpinnerLabel.Text = 'No. Distributed Forces';

            % Create Im4EditFieldLabel
            app.Im4EditFieldLabel = uilabel(app.DataPanel);
            app.Im4EditFieldLabel.HorizontalAlignment = 'right';
            app.Im4EditFieldLabel.Interpreter = 'tex';
            app.Im4EditFieldLabel.Position = [20 275 45 22];
            app.Im4EditFieldLabel.Text = 'I (m^4)';

            % Create NoMomentsSpinnerLabel
            app.NoMomentsSpinnerLabel = uilabel(app.DataPanel);
            app.NoMomentsSpinnerLabel.HorizontalAlignment = 'right';
            app.NoMomentsSpinnerLabel.Position = [56 449 76 22];
            app.NoMomentsSpinnerLabel.Text = 'No. Moments';

            % Create NodePositionDropDownLabel
            app.NodePositionDropDownLabel = uilabel(app.DataPanel);
            app.NodePositionDropDownLabel.HorizontalAlignment = 'right';
            app.NodePositionDropDownLabel.FontWeight = 'bold';
            app.NodePositionDropDownLabel.Position = [20 406 86 22];
            app.NodePositionDropDownLabel.Text = 'Node Position';

            % Create FEditFieldLabel
            app.FEditFieldLabel = uilabel(app.DataPanel);
            app.FEditFieldLabel.HorizontalAlignment = 'center';
            app.FEditFieldLabel.Position = [20 195 25 22];
            app.FEditFieldLabel.Text = 'F';

            % Create XPosmEditFieldLabel
            app.XPosmEditFieldLabel = uilabel(app.DataPanel);
            app.XPosmEditFieldLabel.HorizontalAlignment = 'right';
            app.XPosmEditFieldLabel.Position = [20 380 62 22];
            app.XPosmEditFieldLabel.Text = 'X Pos. (m)';

            % Create YPosmEditFieldLabel
            app.YPosmEditFieldLabel = uilabel(app.DataPanel);
            app.YPosmEditFieldLabel.HorizontalAlignment = 'right';
            app.YPosmEditFieldLabel.Position = [152 380 61 22];
            app.YPosmEditFieldLabel.Text = 'Y Pos. (m)';

            % Create PointForceDataDropDownLabel
            app.PointForceDataDropDownLabel = uilabel(app.DataPanel);
            app.PointForceDataDropDownLabel.HorizontalAlignment = 'center';
            app.PointForceDataDropDownLabel.FontWeight = 'bold';
            app.PointForceDataDropDownLabel.Position = [22 223 100 22];
            app.PointForceDataDropDownLabel.Text = 'Point Force Data';

            % Create ElementDataDropDownLabel
            app.ElementDataDropDownLabel = uilabel(app.DataPanel);
            app.ElementDataDropDownLabel.HorizontalAlignment = 'center';
            app.ElementDataDropDownLabel.FontWeight = 'bold';
            app.ElementDataDropDownLabel.Position = [21 331 81 22];
            app.ElementDataDropDownLabel.Text = 'Element Data';

            % Create Point1DropDownLabel
            app.Point1DropDownLabel = uilabel(app.DataPanel);
            app.Point1DropDownLabel.HorizontalAlignment = 'right';
            app.Point1DropDownLabel.Position = [20 302 42 22];
            app.Point1DropDownLabel.Text = 'Point 1';

            % Create EEditFieldLabel
            app.EEditFieldLabel = uilabel(app.DataPanel);
            app.EEditFieldLabel.HorizontalAlignment = 'center';
            app.EEditFieldLabel.FontWeight = 'bold';
            app.EEditFieldLabel.FontAngle = 'italic';
            app.EEditFieldLabel.Position = [223 331 16 22];
            app.EEditFieldLabel.Text = 'E';

            % Create Point2DropDownLabel
            app.Point2DropDownLabel = uilabel(app.DataPanel);
            app.Point2DropDownLabel.HorizontalAlignment = 'right';
            app.Point2DropDownLabel.Position = [205 302 42 22];
            app.Point2DropDownLabel.Text = 'Point 2';

            % Create Aream2EditFieldLabel
            app.Aream2EditFieldLabel = uilabel(app.DataPanel);
            app.Aream2EditFieldLabel.HorizontalAlignment = 'right';
            app.Aream2EditFieldLabel.Interpreter = 'tex';
            app.Aream2EditFieldLabel.Position = [147 275 67 22];
            app.Aream2EditFieldLabel.Text = 'Area (m^2)';

            % Create FEditField_3
            app.FEditField_3 = uieditfield(app.DataPanel, 'numeric');
            app.FEditField_3.Enable = 'off';
            app.FEditField_3.Position = [46 116 55 22];

            % Create FEditFieldLabel_2
            app.FEditFieldLabel_2 = uilabel(app.DataPanel);
            app.FEditFieldLabel_2.HorizontalAlignment = 'center';
            app.FEditFieldLabel_2.Position = [20 116 25 22];
            app.FEditFieldLabel_2.Text = 'F';

            % Create MomentsDropDownLabel
            app.MomentsDropDownLabel = uilabel(app.DataPanel);
            app.MomentsDropDownLabel.HorizontalAlignment = 'center';
            app.MomentsDropDownLabel.FontWeight = 'bold';
            app.MomentsDropDownLabel.Position = [22 64 58 22];
            app.MomentsDropDownLabel.Text = 'Moments';

            % Create MomentsDropDown
            app.MomentsDropDown = uidropdown(app.DataPanel);
            app.MomentsDropDown.Items = {'Moment 1'};
            app.MomentsDropDown.Enable = 'off';
            app.MomentsDropDown.Position = [87 64 110 22];
            app.MomentsDropDown.Value = 'Moment 1';

            % Create DistLoadsDropDownLabel
            app.DistLoadsDropDownLabel = uilabel(app.DataPanel);
            app.DistLoadsDropDownLabel.HorizontalAlignment = 'center';
            app.DistLoadsDropDownLabel.FontWeight = 'bold';
            app.DistLoadsDropDownLabel.Position = [23 145 70 22];
            app.DistLoadsDropDownLabel.Text = 'Dist. Loads';

            % Create DistLoadsDropDown
            app.DistLoadsDropDown = uidropdown(app.DataPanel);
            app.DistLoadsDropDown.Items = {'Load 1'};
            app.DistLoadsDropDown.Enable = 'off';
            app.DistLoadsDropDown.Tooltip = {'Distributed Loads'};
            app.DistLoadsDropDown.Position = [99 145 86 22];
            app.DistLoadsDropDown.Value = 'Load 1';

            % Create NodesLabel
            app.NodesLabel = uilabel(app.DataPanel);
            app.NodesLabel.HorizontalAlignment = 'center';
            app.NodesLabel.FontWeight = 'bold';
            app.NodesLabel.Position = [393 403 42 22];
            app.NodesLabel.Text = 'Nodes';

            % Create ElementsLabel
            app.ElementsLabel = uilabel(app.DataPanel);
            app.ElementsLabel.HorizontalAlignment = 'center';
            app.ElementsLabel.FontWeight = 'bold';
            app.ElementsLabel.Position = [385 321 58 22];
            app.ElementsLabel.Text = 'Elements';

            % Create PointForcesLabel
            app.PointForcesLabel = uilabel(app.DataPanel);
            app.PointForcesLabel.HorizontalAlignment = 'center';
            app.PointForcesLabel.FontWeight = 'bold';
            app.PointForcesLabel.Position = [375 228 78 22];
            app.PointForcesLabel.Text = 'Point Forces';

            % Create DistLoadsLabel
            app.DistLoadsLabel = uilabel(app.DataPanel);
            app.DistLoadsLabel.HorizontalAlignment = 'center';
            app.DistLoadsLabel.FontWeight = 'bold';
            app.DistLoadsLabel.Position = [379 145 70 22];
            app.DistLoadsLabel.Text = 'Dist. Loads';

            % Create MomentsLabel
            app.MomentsLabel = uilabel(app.DataPanel);
            app.MomentsLabel.HorizontalAlignment = 'center';
            app.MomentsLabel.FontWeight = 'bold';
            app.MomentsLabel.Position = [385 59 58 22];
            app.MomentsLabel.Text = 'Moments';

            % Create ForceAxisDropDown_2
            app.ForceAxisDropDown_2 = uidropdown(app.DataPanel);
            app.ForceAxisDropDown_2.Items = {'X', 'Y'};
            app.ForceAxisDropDown_2.Enable = 'off';
            app.ForceAxisDropDown_2.Position = [235 116 46 22];
            app.ForceAxisDropDown_2.Value = 'X';

            % Create ForceAxisDropDownLabel_2
            app.ForceAxisDropDownLabel_2 = uilabel(app.DataPanel);
            app.ForceAxisDropDownLabel_2.HorizontalAlignment = 'center';
            app.ForceAxisDropDownLabel_2.Position = [168 116 61 22];
            app.ForceAxisDropDownLabel_2.Text = 'Force Axis';

            % Create NodeDropDown_2Label_2
            app.NodeDropDown_2Label_2 = uilabel(app.DataPanel);
            app.NodeDropDown_2Label_2.HorizontalAlignment = 'center';
            app.NodeDropDown_2Label_2.Position = [195 145 49 22];
            app.NodeDropDown_2Label_2.Text = 'Element';

            % Create NodeDropDown_3
            app.NodeDropDown_3 = uidropdown(app.DataPanel);
            app.NodeDropDown_3.Items = {'Element 1'};
            app.NodeDropDown_3.Enable = 'off';
            app.NodeDropDown_3.Position = [247 145 121 22];
            app.NodeDropDown_3.Value = 'Element 1';

            % Create NodeDropDown_2Label_3
            app.NodeDropDown_2Label_3 = uilabel(app.DataPanel);
            app.NodeDropDown_2Label_3.HorizontalAlignment = 'center';
            app.NodeDropDown_2Label_3.Position = [207 223 42 22];
            app.NodeDropDown_2Label_3.Text = 'Node';

            % Create NodeDropDown_4
            app.NodeDropDown_4 = uidropdown(app.DataPanel);
            app.NodeDropDown_4.Items = {'Node 1 (X,Y)'};
            app.NodeDropDown_4.Enable = 'off';
            app.NodeDropDown_4.Position = [248 223 121 22];
            app.NodeDropDown_4.Value = 'Node 1 (X,Y)';

            % Create ResetAllButton
            app.ResetAllButton = uibutton(app.ProblemViewerTab, 'push');
            app.ResetAllButton.Tooltip = {'Be careful!'};
            app.ResetAllButton.Position = [855 9 100 23];
            app.ResetAllButton.Text = 'Reset All';

            % Create SolvedProblemTab
            app.SolvedProblemTab = uitab(app.TabGroup);
            app.SolvedProblemTab.Title = 'Solved Problem';

            % Create DeformedStructurePanel
            app.DeformedStructurePanel = uipanel(app.SolvedProblemTab);
            app.DeformedStructurePanel.Title = 'Deformed Structure';
            app.DeformedStructurePanel.Position = [463 188 505 462];

            % Create UIAxes_3
            app.UIAxes_3 = uiaxes(app.DeformedStructurePanel);
            xlabel(app.UIAxes_3, 'X (m)')
            ylabel(app.UIAxes_3, 'Y (m)')
            zlabel(app.UIAxes_3, 'Z')
            app.UIAxes_3.Position = [10 58 481 381];

            % Create StartOverButton
            app.StartOverButton = uibutton(app.DeformedStructurePanel, 'push');
            app.StartOverButton.Enable = 'off';
            app.StartOverButton.Position = [217 13 100 23];
            app.StartOverButton.Text = 'Start Over';

            % Create UserInputPanel
            app.UserInputPanel = uipanel(app.SolvedProblemTab);
            app.UserInputPanel.Title = 'User Input';
            app.UserInputPanel.Position = [10 485 442 165];

            % Create DeformationScalingLabel
            app.DeformationScalingLabel = uilabel(app.UserInputPanel);
            app.DeformationScalingLabel.HorizontalAlignment = 'right';
            app.DeformationScalingLabel.Enable = 'off';
            app.DeformationScalingLabel.Position = [19 94 70 30];
            app.DeformationScalingLabel.Text = {'Deformation'; 'Scaling'};

            % Create DeformationScalingSlider
            app.DeformationScalingSlider = uislider(app.UserInputPanel);
            app.DeformationScalingSlider.Limits = [1 1000];
            app.DeformationScalingSlider.MajorTicks = [1 250 500 750 1000];
            app.DeformationScalingSlider.MinorTicks = [1 50 100 150 200 250 300 350 400 450 500 550 600 650 700 750 800 850 900 950 1000];
            app.DeformationScalingSlider.Enable = 'off';
            app.DeformationScalingSlider.Position = [110 111 175 3];
            app.DeformationScalingSlider.Value = 1;

            % Create RotationScalingLabel
            app.RotationScalingLabel = uilabel(app.UserInputPanel);
            app.RotationScalingLabel.HorizontalAlignment = 'right';
            app.RotationScalingLabel.Enable = 'off';
            app.RotationScalingLabel.Position = [40 38 50 30];
            app.RotationScalingLabel.Text = {'Rotation'; 'Scaling'};

            % Create RotationScalingSlider
            app.RotationScalingSlider = uislider(app.UserInputPanel);
            app.RotationScalingSlider.Limits = [1 150];
            app.RotationScalingSlider.MajorTicks = [1 20 40 60 80 100 120 150];
            app.RotationScalingSlider.MinorTicks = [1 5 10 15 20 25 30 35 40 45 50 55 60 65 70 75 80 85 90 95 100 105 110 115 120 125 130 135 140 145 150];
            app.RotationScalingSlider.Enable = 'off';
            app.RotationScalingSlider.Position = [111 55 177 3];
            app.RotationScalingSlider.Value = 1;

            % Create ApplyButton
            app.ApplyButton = uibutton(app.UserInputPanel, 'push');
            app.ApplyButton.Enable = 'off';
            app.ApplyButton.Position = [322 91 100 23];
            app.ApplyButton.Text = 'Apply';

            % Create ApplyButton_2
            app.ApplyButton_2 = uibutton(app.UserInputPanel, 'push');
            app.ApplyButton_2.Enable = 'off';
            app.ApplyButton_2.Position = [322 35 100 23];
            app.ApplyButton_2.Text = 'Apply';

            % Create DataOutputPanel
            app.DataOutputPanel = uipanel(app.SolvedProblemTab);
            app.DataOutputPanel.Title = 'Data Output';
            app.DataOutputPanel.Position = [11 188 441 287];

            % Create UITable
            app.UITable = uitable(app.DataOutputPanel);
            app.UITable.ColumnName = {'Column 1'; 'Column 2'; 'Column 3'; 'Column 4'};
            app.UITable.RowName = {};
            app.UITable.Position = [1 0 440 266];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = cae_gui_scratch_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end
