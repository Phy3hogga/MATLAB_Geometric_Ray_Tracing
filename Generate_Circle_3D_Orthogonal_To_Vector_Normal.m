%% Plots a circle of a given radius on a plane orthogonal to a normal vector at a given centrepoint
function Circle = Generate_Circle_3D_Orthogonal_To_Vector_Normal(Normal_Vector, Circle_Centre, Circle_Radius, Angular_Resolution)
    %Angular Sampling    
    Theta = 0 : Angular_Resolution : 360;
    %Calculate plane orthogonal to the normal vector
    Orthogonal_Plane = null([Normal_Vector.X, Normal_Vector.Y, Normal_Vector.Z]);
    %Create the points in X,Y,Z on the orthogonal vector plane for the circle of a given radius
    points = repmat([Circle_Centre.X, Circle_Centre.Y, Circle_Centre.Z]', 1, size(Theta, 2)) + Circle_Radius * (Orthogonal_Plane(:,1) * cosd(Theta) + Orthogonal_Plane(:,2) * sind(Theta));
    %Separate points into a coordinate table
    Circle = Create_Coordinate_Table(points(1,:), points(2,:), points(3,:));
    %Debug plot
    %plot3(Circle.X, Circle.Y, Circle.Z, 'r-');
end