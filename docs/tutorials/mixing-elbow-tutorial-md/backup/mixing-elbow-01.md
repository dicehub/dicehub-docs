
mixing elbow tutorial
=====================

mixing elbow summary
--------------------

The mixing elbow is a 3D pipe geometry with a main inlet and outlet, and a secondary inlet on the curved section of the pipe. The case is designed to demonstrate the 3D mixing process which occurs when a secondary flow is injected into a primary flow at different speed. The main pipe geometry is 1.0m diameter and the secondary inlet is 0.5m diameter. The single STL file used in this demo contains both the pipe geometry and the inlets and outlet geometry, so there is no need for multiple STL files. The meshing will be done with the **snappyHexMesh** application (this is currently the only mesher available). We will be using the **simpleFoam** (steady-state) flow solver, since we are modelling the incompressible flow of water, with turbulence. There are no temperature effects included in this analysis, since we are using the standard form of the simpleFoam solver, which does not include temperature.

![](./images/geometry-plus.png)

the dicehub process
-------------------

When using the **dicehub** platform to complete any simulation analysis, the following process is used. You start with an STL file which has to be uploaded into the meshing application. When the meshing is completed, the mesh has to be imported into the solver application. _NOTE: you cannot import an STL geometry into a solver application._ When the solver has finshed running, you can view the flow solution results online or download them to your local machine. The various stages of the mesher and solver setup will be very familiar if you have any previous experience of using OpenFoam. Here is a brief overview of the process:

**a) create new project**

**b) mesh generation**

- create meshing application
- upload STL file to mesher
- setup and run the mesher \
  (work through steps 1-10)
- inspect the mesh (if needed)
- download the mesh (if needed)

**c) flow solution**

- create solver application
- import mesh into solver
- setup and run the solver \
  (work through steps 1-10)
- check the convergence
- inspect flow solution (if needed)
- download flow solution (if needed)

a) create new project
---------------------

- go to the **dicehub** website
- login to your account
- to create a new project:
    
    - select **New project**
    
        ![](./images/new-project1.png)
    
    - or **+New** and **New project** (top right)
    
        ![](./images/new-project2.png)
    
    - enter a project name such as **"mixing elbow"**
    - select the visibility of your project eg **internal**
    - select the **Create Project** button
    
*   you have now created a new project directory where \
    the mesher and solver applications will be located

b) mesh generation
------------------

*   from within your project directory...\
    hover over the image where it says: \
    _MESHER - Hex dominant mesher_
    
    ![](./images/mesher-app-capture.png)
    
*   then select **Create Application**... \
    this chooses the **snappyHexMesh** mesher,\
    and takes you to the mesh setup as follows:
        
        1. Geometries
        2. Background Mesh
        3. Material Point
        4. Edges Refinement
        5. Surface Refinement
        6. Volume Refinement
        7. Boundary Layers
        8. Cell Zones
        9. Run
        10. Result
        
    **NOTE:** each meshing application name is created randomly within dicehub, eg. **epic\_cohen (Mesher)** but this can be changed by clicking and editting it
            
    ![](./images/epic-cohen.png)
            
    ![](./images/my-snappyhexmesh.png)
            

    if you need to **delete** an application - right-click and select _delete_

    ![](./images/delete-mesher-app.png)


### 1\. Mesher > Geometries

when you first go into the mesh setup options\
you should just see a default background mesh

![](./mesher/no-geometry.png)

next upload the STL geometry from your laptop / workstation\
the geometry then should apear inside the background mesh\
the default background mesh is quite fine and needs adjusting\

![](./mesher/new-geometry.png)

### 2\. Mesher > Background Mesh

**STEP2** now to set up the background mesh\
the camera settings **standard viewpoints**,\
to look at the background mesh from the front

![](./mesher/adjust-camera-icons.png)

![](./mesher/adjust-camera-window.png)

![](./mesher/new-geometry-camera.png)

next adjust the background mesh settings (**blockMesh** application)

You can adjust the **bounding box size**, **cell number** and **cell size**

![](./mesher/background-mesh.png)

- It may take several attempts to get it set up correctly.
- The geometry should be completly enclose by the background mesh
- Here we used 1m background cells giving a **(7x7x2)** array
- The background mesh should be quite coarse to start with

**NOTE:** if the background mesh is too fine - the resulting\
mesh could be very large, and may exceed the available RAM.

### 3. Mesher > Material Point

Now (since this is an internal flow geometry) we adjust the material point to be inside the pipe geometry, by adjusting the XYZ coordinates. NOTE: for an external flow case, the material point should be located outside the geometry. In this case the material point is set to **(2,0.5,0)**

![](./mesher/material-point.png)

### 4. Mesher > Edges Refinement

next (if required) we specify the edge refinement level which applies

to the feature edges created by the **surfaceFeatures** application

In this case the edge refinement has been set to **level 5**

![](./mesher/edge-refine.png)

### 5. Mesher > Surface Refinement

The surface refinement specifies what level of refinement is applied to the geometry surface. The min level applies to lower curvature, and the max level applies to high curvature. In this case the surface refinement is set between **level 4** (min) and **level 5** (max)

![](./mesher/surface-refine.png)

### 6\. Mesher > Volume Refinement

The volume refinement (if needed) allows a region of higher refinment using either box, sphere, plane or plate. Here we select a sphere and then adjust the desired size and position, using parameters on the bottom right.

![](./mesher/volume-options.png)

Here we have positioned a sphere roughly in the mixing region and
have specified a **level 5** refinement inside the sphere volume

![](./mesher/volume-refine.png)

### 7\. Mesher > Boundary Layers

Boundary layers are used (if needed) to give better refinement of the

near wall region to give more uniform y-plus values in the final flow.

Layer mesh should be used carefully, since specification of many layers

can increase the overall mesh size considerably (compared to no-layers).

![](./mesher/boundary-layer.png)

Layer mesh can be applied to individual surfaces (not the whole geometry). Here we have selected just the surface **pipe** and select **1 layer** of mesh. We have not specifed any layer mesh on the other inlet/outlet surfaces. **NOTE:** you can start without any layer mesh for initial flow solutions, and then increase the layer mesh (later) for more accurate flow sultions.

### 8\. Mesher > Cell Zones

In this case there is only 1 cell zone called "mixing elbow"
If the background mesh is quite coarse, you may want to use
this to specify the minimum refine level in the whole mesh.

![](./mesher/cell-zones.png)

In this case we have specified **level 3** on the cell zone.
Its not really needed in this case since its an internal flow.
Cell zone refinement perhaps more useful for external flow cases.

### 9\. Mesher > Run

- Finally its time to run the mesher...
- You can **Change machine** (if needed) to select the machine,
- and then select **Run** to get the meshing process started

![](./mesher/run-mesher.png)

- After a few minutes when the meshing has finished...
- look at the "tabs" such as **Meshing** or **Check Mesh**
- see the final mesh size (**cells:67,842** in this case)
- check that the mesh check is OK.

![](./mesher/run-mesher-done.png)

### 10\. Mesher > Result

- Now select **Show result** to look at the final mesh
- You should then see the surface mesh on the pipe geometry

![](./mesher/show-result.png)

**NOTE:**
You should then be able to see **internalMesh** in the object tree. if not, there may be a problem with the meshing process. if you select or click on _internalMesh_ in the object tree, you can then use the **slice filter** or **clip filter** tools to look at the volume mesh in more detail using slices.

![](./mesher/slice-filter.png)

![](./mesher/slice-filter-mesh.png)

when you have looked at the mesh (and if it looks ok)\
exit the mesher by clicking on the project name above

![](./mesher/finish-meshing.png)

this takes you back into the project working directory,\
where you can start the flow solver application when ready

c) FLOW SOLUTION
----------------

*   from within your project directory...\
    hover mouse over the car image where it says:\
    *SOLVER - Incompressible steady-state fluid flow*
    
    ![](./images/solver-app-capture.png)*
    
    then select **Create Application**...\
    this chooses the **simpleFoam** solver and\
    takes you to the solver setup as follows:
    
    1. Mesh Import
    2. Materials
    3. Turbulence
    4. Boundary Conditions
    5. Initialisation
    6. Solver Settings
    7. Numerics
    8. Monitors
    9. Run
    10. Result
    
Each solver application name is created randomly\
within dicehub, eg. **sleepy\_beaver (ISS Solver)**\
but this can be changed by clicking and editting it
        
![](./images/sleepy-beaver.png)

![](./images/my-simplefoam.png)
        
if you need to **delete** an application - right click and select *delete*
            
![](./images/delete-solver-app.png)


### 1. Solver > Mesh Import
### 2. Solver > Materials
### 3. Solver > Turbulence
### 4. Solver > Boundary Conditions
### 5. Solver > Initialisation
### 6. Solver > Solver Settings
### 7. Solver > Numerics
### 8. Solver > Monitors
### 9. Solver > Run
### 10. Solver > Result