%% Calculates the dot product given a single start and end coordinate, for a series of common coordinates
function [Angle] = Angle_Between_Two_Vectors_From_Coordinates(Origin, Destination, Common_Central_Coordinate_List)
    %Generate vectors from coordinate lists
    [Vector_A, ~] = Vector_From_3D_Coordinate_Pair(Origin, Common_Central_Coordinate_List);
    [Vector_B, ~] = Vector_From_3D_Coordinate_Pair(Common_Central_Coordinate_List, Destination);

    %Get vector length
    Length_A = sqrt(Vector_A.X.^2 + Vector_A.Y.^2 + Vector_A.Z.^2);
    Length_B = sqrt(Vector_B.X.^2 + Vector_B.Y.^2 + Vector_B.Z.^2);
    
    %Get dot product
    Dot_Product_A_B = dot([Vector_A.X, Vector_A.Y, Vector_A.Z], [Vector_B.X, Vector_B.Y, Vector_B.Z], 2);
    
    %Calculate angle for each set of coordinates
    Angle = acosd(Dot_Product_A_B ./ (Length_A .* Length_B));
end