%% Calculates the dot product given a single start and end coordinate, for a series of common coordinates
function [Angle] = Angle_Between_Two_Vectors_From_Coordinates(Origin, Destination, Common_Central_Coordinate_List)
    %% Pre-handling to verify vector sizing is compatible; or handle automatic duplication of array elements
    if(height(Common_Central_Coordinate_List) == height(Origin))
        Length_Match_Common_Origin = true;
    else
        Length_Match_Common_Origin = false;
    end
    if(height(Common_Central_Coordinate_List) == height(Destination))
        Length_Match_Common_Destination = true;
    else
        Length_Match_Common_Destination = false;
    end
    if(height(Origin) == height(Destination))
        Length_Match_Origin_Destination = true;
    else
        Length_Match_Origin_Destination = false;
    end

    if(Length_Match_Common_Origin && Length_Match_Common_Destination && Length_Match_Origin_Destination)
       %Valid -> all lengths match
    else
        if(sum([Length_Match_Common_Origin, Length_Match_Common_Destination, Length_Match_Origin_Destination]) == 1)
            %If only a single length match occurs
            if(Length_Match_Common_Origin)
                if(height(Destination) == 1)
                    Destination = repmat(Destination, height(Common_Central_Coordinate_List), 1);
                elseif(height(Origin) == 1)
                    Origin = repmat(Origin, height(Destination), 1);
                    Common_Central_Coordinate_List = repmat(Common_Central_Coordinate_List, height(Destination), 1);
                else
                    %Invalid; no matching vector lengths
                    error("Angle_Between_Two_Vectors_From_Coordinates : Requires a minimum of a pair of matching vector lengths.");
                end
            end
            if(Length_Match_Common_Destination)
                if(height(Origin) == 1)
                    Origin = repmat(Origin, height(Common_Central_Coordinate_List), 1);
                elseif(height(Destination) == 1)
                    Destination = repmat(Destination, height(Origin), 1);
                    Common_Central_Coordinate_List = repmat(Common_Central_Coordinate_List, height(Origin), 1);
                else
                    %Invalid; no matching vector lengths
                    error("Angle_Between_Two_Vectors_From_Coordinates : Requires a minimum of a pair of matching vector lengths.");
                end
            end
            if(Length_Match_Origin_Destination)
                if(height(Common_Central_Coordinate_List) == 1)
                    Common_Central_Coordinate_List = repmat(Common_Central_Coordinate_List, height(Origin), 1);
                elseif(height(Origin) == 1)
                    Origin = repmat(Origin, height(Common_Central_Coordinate_List), 1);
                    Destination = repmat(Destination, height(Common_Central_Coordinate_List), 1);
                else
                    %Invalid; no matching vector lengths
                    error("Angle_Between_Two_Vectors_From_Coordinates : Requires a minimum of a pair of matching vector lengths.");
                end
            end
        else
            %Invalid; no matching vector lengths
            error("Angle_Between_Two_Vectors_From_Coordinates : Requires a minimum of a pair of matching vector lengths.");
        end
    end
    
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