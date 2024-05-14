%% Rotates a set of 3D co-ordinates around a specific Axis
function [Output_X, Output_Y, Output_Z] = Rotate_Coordinates_Around_Axis(Input_X, Input_Y, Input_Z, Angle_Of_Rotation, Axis)
    if(strcmpi(Axis, 'X'))
        %Rotating coordinates around the X-Axis
        Output_X = Input_X;
        Output_Y = Input_Y .* cosd(Angle_Of_Rotation) - Input_Z .* sind(Angle_Of_Rotation);
        Output_Z = Input_Y .* sind(Angle_Of_Rotation) + Input_Z .* cosd(Angle_Of_Rotation);
    elseif(strcmpi(Axis, 'Y'))
        %Rotating coordinates around the Y-Axis
        Output_X = Input_X .* cosd(Angle_Of_Rotation) + Input_Z .* sind(Angle_Of_Rotation);
        Output_Y = Input_Y;
        Output_Z = Input_Z .* cosd(Angle_Of_Rotation) - Input_X .* sind(Angle_Of_Rotation);
    elseif(strcmpi(Axis, 'Z'))
        %Rotating coordinates around the Z-Axis
        Output_X = Input_X .* cosd(Angle_Of_Rotation) - Input_Y .* sind(Angle_Of_Rotation);
        Output_Y = Input_X .* sind(Angle_Of_Rotation) + Input_Y .* cosd(Angle_Of_Rotation);
        Output_Z = Input_Z;
    else
        %No axis specified
        warning("Rotate_Coordinates_Around_Axis : Undefined axis of rotation. No transformation Applied.");
        Output_X = Input_X;
        Output_Y = Input_Y;
        Output_Z = Input_Z;
    end
end