%% Project a vector with a given intercept to a given plane at a specified coordinate
function [Projection_Coordinates, Propogation] = Vector_Projection_To_Plane(Vector, Intercept, Plane_Coordinate, Plane)
    %Determine propogation vector
    if(strcmpi(Plane, 'X'))
        Propogation = (Plane_Coordinate - Intercept.X) ./ Vector.X;
    elseif(strcmpi(Plane, 'Y'))
        Propogation = (Plane_Coordinate - Intercept.Y) ./ Vector.Y;
    elseif(strcmpi(Plane, 'Z'))
        Propogation = (Plane_Coordinate - Intercept.Z) ./ Vector.Z;
    end
    %Calculate projected coordinates
    Projection_Coordinates = Create_Coordinate_Table((Propogation .* Vector.X) + Intercept.X, (Propogation .* Vector.Y) + Intercept.Y, (Propogation .* Vector.Z) + Intercept.Z);
end