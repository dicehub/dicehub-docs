# Background mesh

In this step, the background mesh is created.

For the  background mesh a bounding box is generated and the OpenFOAM `blockMesh` 
utility is used.

!!! note
    Other more complex background meshes are allowed but are not
    covered in this case.   
    They can be generated with blockMesh or any other utility.

## Bounding box

The bounding box can be defined automatically or manually. 
It should surround all imported/created geometries of interest.
