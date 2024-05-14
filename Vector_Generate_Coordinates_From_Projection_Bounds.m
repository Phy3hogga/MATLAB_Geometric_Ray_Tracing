%Generate coordinates along a linear path down a given vector trajectory.
function [Coordinates, Projection_Intervals] = Vector_Generate_Coordinates_From_Projection_Bounds(Vector, Intercept, Projection_Start, Projection_End, Projection_Sampling_Resolution)
    %Generate T intervals
    Projection_Intervals = Projection_Start : Projection_Sampling_Resolution : Projection_End;
    %Generate coordinates
    Coordinates = Create_Coordinate_Table((Vector.X .* Projection_Intervals) + Intercept.X, (Vector.Y .* Projection_Intervals) + Intercept.Y, (Vector.Z .* Projection_Intervals) + Intercept.Z);
end