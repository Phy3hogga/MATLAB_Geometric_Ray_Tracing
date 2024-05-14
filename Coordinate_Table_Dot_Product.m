%% Calculates the dot product given a single start and end coordinate, for a series of common coordinates
function [Dot_Product] = Coordinate_Table_Dot_Product(Origin, Destination, Common_Central_Coordinate_List)
    %Generate vectors from coordinate lists
    [Vector_A, ~] = Vector_From_3D_Coordinate_Pair(Origin, Common_Central_Coordinate_List);
    [Vector_B, ~] = Vector_From_3D_Coordinate_Pair(Common_Central_Coordinate_List, Destination);
    %Calculate dot product of coordinate vector
    Dot_Product = dot([Vector_A.X, Vector_A.Y, Vector_A.Z], [Vector_B.X, Vector_B.Y, Vector_B.Z],2);
end