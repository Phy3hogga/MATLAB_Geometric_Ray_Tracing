%% Generates a table format for coordinate structures
function [Coordinate_Table] = Create_Coordinate_Table(X, Y, Z)
    if(nargin == 2)
        Coordinate_Table = table(Condense_Variable_To_1D(X), Condense_Variable_To_1D(Y), 'VariableNames', {'X', 'Y'});
    elseif(nargin == 3)
        Coordinate_Table = table(Condense_Variable_To_1D(X), Condense_Variable_To_1D(Y), Condense_Variable_To_1D(Z), 'VariableNames', {'X', 'Y', 'Z'});
    else
        Coordinate_Table = NaN;
    end
end

%% Condenses X,Y or Z to the correct dimensions
function [Var_Out] = Condense_Variable_To_1D(Var_In)
    %Verify input array size
    if(numel(size(Var_In)) ~= 2)
        error("Create_Coordinate_Table ERROR: Incompatible Array Size.");
    end
    if(size(Var_In, 1) == 1)
        Var_Out = squeeze(Var_In)';
    else
        Var_Out = squeeze(Var_In);
    end
end