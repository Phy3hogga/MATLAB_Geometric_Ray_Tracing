%% Calculates a vector and intercept (starting point) from a pair of two coordinates.
function [Vector, Intercept] = Vector_From_3D_Coordinate_Pair(Start_Coordinates, Finish_Coordinates)
    Remove_Z = 0;
    if(~ismember('Z', Start_Coordinates.Properties.VariableNames))
        Start_Coordinates.Z = 0;
        Remove_Z = Remove_Z + 1;
    end
    if(~ismember('Z', Finish_Coordinates.Properties.VariableNames))
        Finish_Coordinates.Z = 0;
        Remove_Z = Remove_Z + 1;
    end
    %Vector calculation
    X = Finish_Coordinates.X - Start_Coordinates.X;
    Y = Finish_Coordinates.Y - Start_Coordinates.Y;
    Z = Finish_Coordinates.Z - Start_Coordinates.Z;
    %Change to unit vector
    Vector_Length = sqrt(X.^2 + Y.^2 + Z.^2);
    %Assign to coordinate structure as a unit vector
    Vector = Create_Coordinate_Table(X ./ Vector_Length, Y ./ Vector_Length, Z ./ Vector_Length);
    %Assign start point to the initial co-ordinate
    Intercept = Start_Coordinates;
    if(Remove_Z == 2)
        Vector.Z = [];
        Intercept.Z = [];
    end
end