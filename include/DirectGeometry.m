%% DirectGeometry Function 
% inputs: 
% - q : current links position;
% - biTri: transformation matrix of link <i> w.r.t. link <i-1> for qi=0; 
% - jointType: 0 for revolute, 1 for prismatic;
% output:
% biTei : transformation matrix of link <i> w.r.t. link <i-1> for the input qi.

function [biTei] = DirectGeometry(qi, biTri, linkType)

    if (linkType == 0) % linkType == 0 -> revolute joint 
       % rotation matrix for rotation around z-axis
       Tr(1,1) = cos(qi); Tr(1,2) = -sin(qi); Tr(1,3) = 0;  Tr(1,4) = 0;
       Tr(2,1) = sin(qi); Tr(2,2) = cos(qi);  Tr(2,3) = 0;  Tr(2,4) = 0;
       Tr(3,1) = 0;       Tr(3,2) = 0;        Tr(3,3) = 1;  Tr(3,4) = 0;
       Tr(4,1) = 0;       Tr(4,2) = 0;        Tr(4,3) = 0;  Tr(4,4) = 1;
    
       % post-multiplication of the transformation matrix with the matrix related
       % to the rotation around z-axis
       biTei = biTri * Tr; 
    end
    
    if (linkType == 1) % linkType == 1 -> prismatic joint
       % translation matrix for translation along z-axis
       Tt(1,1) = 1;       Tt(1,2) = 0;        Tt(1,3) = 0;  Tt(1,4) = 0;
       Tt(2,1) = 0;       Tt(2,2) = 1;        Tt(2,3) = 0;  Tt(2,4) = 0;
       Tt(3,1) = 0;       Tt(3,2) = 0;        Tt(3,3) = 1;  Tt(3,4) = qi;
       Tt(4,1) = 0;       Tt(4,2) = 0;        Tt(4,3) = 0;  Tt(4,4) = 1;
    
       % post-multiplication of the transformation matrix with the matrix related
       % to the translation along z-axis
       biTei = biTri * Tt;
    end

end