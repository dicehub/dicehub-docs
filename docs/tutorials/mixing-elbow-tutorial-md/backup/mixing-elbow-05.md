
MIXING ELBOW TUTORIAL
=====================

mixing elbow summary
--------------------

The mixing elbow is a 3D pipe geometry with a main inlet and outlet, and a secondary inlet on the curved section of the pipe. The case is designed to demonstrate the 3D mixing process which occurs when a secondary flow is injected into a primary flow at different speed. The main pipe geometry is 1.0m diameter and the secondary inlet is 0.5m diameter. The single STL file used in this demo contains both the pipe geometry and the inlets and outlet geometry, so there is no need for multiple STL files. The meshing will be done with the **snappyHexMesh** application (this is currently the only mesher available). We will be using the **simpleFoam** (steady-state) flow solver, since we are modelling the incompressible flow of water, with turbulence. There are no temperature effects included in this analysis, since we are using the standard form of the simpleFoam solver, which does not include temperature.

![](./images/geometry-plus.png)

the dicehub process
-------------------

When using the **dicehub** platform to complete any simulation analysis, the following process is used. You start with an STL file which has to be uploaded into the meshing application. When the meshing is completed, the mesh has to be imported into the solver application. _NOTE: you cannot import an STL geometry into a solver application._ When the solver has finshed running, you can view the flow solution results online or download them to your local machine. The various stages of the mesher and solver setup will be very familiar if you have any previous experience of using OpenFoam. \

Here is a brief overview of the **dicehub** process:

**a) create new project**

- login to your account
- select *new project*
- enter project name
- select project visibility
- select *create project*

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

**d) delete project**

- settings > main settings
- delete project > delete project
- confirm with project name
- select *delete project*

a) create new project
---------------------

- go to the **dicehub** website
- login to your account
- create a new project:
    
    \- select **New project**
    
    ![](./images/new-project1.png)
    
    \- or **+New** and **New project** (top right)
    
    ![](./images/new-project2.png)
    
    \- enter a project name such as **mixing-elbow** \
    \- select the project visibility eg **internal** \
    \- select the **Create Project** button
    
*   you have now created a new project directory where \
    the mesher and solver applications will be located

b) mesh generation
------------------

*   from within your project directory...\
    hover over the image where it says: \
    _MESHER - Hex dominant mesher_
    
    ![](./images/mesher-app-capture.png)
    
*   then select **Create Application**... \
    this chooses the **snappyHexMesh** mesher \
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


### 1. Mesher > Geometries

when you first go into the mesh setup options\
you should just see a default background mesh

![](./mesher/no-geometry.png)

next upload the STL geometry from your laptop / workstation\
the geometry then should apear inside the background mesh\
the default background mesh is quite fine and needs adjusting\

![](./mesher/new-geometry.png)

### 2. Mesher > Background Mesh

Next we have to set up the background mesh\
Its very useful to adjust the camera settings \
we can use the **standard viewpoints** feature\
to look at the background mesh from the front

![](./mesher/adjust-camera-icons.png)

![](./mesher/adjust-camera-window.png)

![](./mesher/new-geometry-camera.png)

- next we adjust the background mesh settings \
  (this is for the **blockMesh** application)
- You can adjust the **bounding box size**, \
  the **cell number** and the **cell size**

![](./mesher/background-mesh.png)

- It may take several attempts to get it set up correctly.
- The geometry is completly enclosed by the background mesh
- Here we used 1m background cells giving **(7x7x2)** array
- The background mesh should be quite coarse to start with

**NOTE:** if the background mesh is too fine, the resulting\
mesh could be large, and may exceed the available RAM.

### 3. Mesher > Material Point

Now (since this is an internal flow geometry) we adjust the material point to be inside the pipe geometry, by adjusting the XYZ coordinates. NOTE: for an external flow case, the material point should be located outside the geometry. In this case the material point is set to **(2,0.5,0)**

![](./mesher/material-point.png)

### 4. Mesher > Edges Refinement

- next (if required) we specify the edge refinement level 
- for the edges created by the **surfaceFeatures** application
- In this case the edge refinement has been set to **level 5**

![](./mesher/edge-refine.png)

### 5. Mesher > Surface Refinement

The surface refinement specifies what level of refinement is applied to the geometry surface. The **min** level applies to lower curvature regions, and the **max** level applies to higher curvature regions. In this case the surface refinement is set between **level 4** (min) and **level 5** (max). 

**Note:** the final mesh size is very sensitive to these values.

![](./mesher/surface-refine.png)

### 6. Mesher > Volume Refinement

The volume refinement (if needed) allows a region of higher refinement using either box, sphere, plane or plate. Here we select a sphere and then adjust the desired size and position, using parameters on the bottom right.

![](./mesher/volume-options.png)

Here we have positioned a sphere roughly in the mixing region and
have specified a **level 5** refinement inside the sphere volume

![](./mesher/volume-refine.png)

### 7. Mesher > Boundary Layers

Boundary layers are used (if needed) to give better refinement of the near wall region to give more uniform y-plus values in the final flow solution. Layer mesh should be used carefully, since specification of many layers can increase the overall mesh size drastically (compared to a mesh with no-layers).

![](./mesher/boundary-layer.png)

Layer mesh is applied to individual surfaces (not the whole geometry). Here we have selected just the surface **pipe** and select **1 layer** of mesh. We have not specifed any layer mesh on the other inlet/outlet surfaces. **NOTE:** you can start without any layer mesh for the initial flow solutions, and then apply the layer mesh (later) for more accurate flow sultions.

### 8. Mesher > Cell Zones

In this case there is only 1 cell zone called "mixing elbow". 
If the background mesh is quite coarse, you can use cell zone refinement to specify the minimum refinement level on the whole mesh.

![](./mesher/cell-zones.png)

In this case we have specified **level 3** on the cell zone.\
Its not really needed in this case since its an internal flow.\
Cell zone refinement is more useful for external flow cases.

### 9. Mesher > Run

- Finally its time to run the mesher...
- You can **Change machine** (if needed) to select the machine,
- and then select **Run** to get the meshing process started

![](./mesher/run-mesher.png)

- After a few minutes when the meshing has finished...
- look at the "tabs" such as **Meshing** or **Check Mesh**
- see the final mesh size (**cells:67,842** in this case)
- check that the mesh check is OK.

![](./mesher/run-mesher-done.png)

### 10. Mesher > Result

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




c) flow solution
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

Having created a **solver application**, now follow the steps (1-10) below, in order to generate a flow solution and look at the results.


### 1. Solver > Mesh Import

- select Mesh Import > Import
- select the mesh application that you have recently generated

  ![](./solver/import-mesh1.png)

  ![](./solver/import-mesh2.png)

- The mixing-elbow surface mesh (in purple) should appear in the background

  ![](./solver/import-mesh3.png)

- You can adjust the camera settings to view and check and check surface mesh

  ![](./solver/import-mesh4.png)


### 2. Solver > Materials

- Next select the material property (water) which has a kinematic viscosity 1.0e-6

  ![](./solver/select-material.png)

  ![](./solver/select-water.png)


### 3. Solver > Turbulence

Next we select the turbulence model which can be laminar (no turbulence) or one of the available 2-equation turbulence models.
Here we select the standard k-epsilon model

![](./solver/select-turbulence.png)

Now we need think about how to specify the turbulence parameters at both of the pipe inlets. For an internal flow case we need the turbulence intensity (5%), the turbulence length scale (0.07 x pipe diameter), and the mean flow velocity (eg. 1m/sec for the main inlet). If we put these values into the **cfd-online** webpage (https://www.cfd-online.com/Tools/turbulence.php) it generates the correct values for k, epsilon and omega. You could also do this manually using the appropriate turbulence equations.

  \- here are calculated turbulence values for main inlet
    ![](./solver/turb1.png)

  \- here are calculated turbulence values for secondary inlet
    ![](./solver/turb2.png)

### 4. Solver > Boundary Conditions

- Now we specify boundary conditions on our inlets, outlet and wall. 
- The inlets and outlet should be given the *boundary type* of **patch**. 
- The pipe wall should have the *boundary type* **wall**, as shown below.

  ![](./solver/boundary-conditions.png)

- Next we specify a boundary condition for velocity, pressure, and turbulence values on each of the boundary surfaces (*inlet1*, *inlet2*, *outlet* and *pipe*)

- **INLET1**
    - kinematic pressure = zero gradient
    - surface normal velocity = -1 m/sec
    - turbulent kinetic energy = 0.00375
    - epsilon = 0.000295
    - Nut = calculated

        ![](./solver/bc1.png "inlet1")

- **INLET2**
    - kinematic pressure = zero gradient
    - surface normal velocity = -2 m/sec
    - turbulent kinetic energy = 0.015
    - epsilon = 0.00472
    - Nut = calculated

        ![](./solver/bc2.png "inlet2")

- **OUTLET**
    - kinematic pressure fixed value = 0
    - velocity = zero gradient
    - turbulent kinetic energy = zero gradient
    - epsilon = zero gradient
    - Nut = zero gradient

        ![](./solver/bc3.png "outlet")

- **PIPE**

    - (just leave all the default settings)
    - kinematic pressure = zero gradient
    - velocity = no slip
    - turbulent kinetic energy = wall function
    - epsilon = wall function
    - Nut = wall function

        ![](./solver/bc4.png "pipe wall")




### 5. Solver > Initialisation

Next we have to initialise flow solution. This means setting the initial values across the whole flow-field, from which the solver starts. These can all be set to zero, except the turbulence which we have set k=0.003 and epsilon=0.0003 (as shown below), to prevent a divide by zero error.  The initial values can sometimes be adjusted to help the initial convergence or prevent the solver from crashing in the first few iterations.

![](./solver/initialise.png "initialise")

### 6. Solver > Solver Settings

For the solver settings we can leave this mostly unchanged, but we will adjust the under relaxation factors (URFs) to help the initial convergence for this specific case. We have set U=0.5, k=0.3, and Epsilon=0.3 (as shown below). This makes solution convergence more stable and prevents it from crashing.

![](./solver/solver-settings.png "settings")

### 7. Solver > Numerics

For the solver numerics, we will leave these settings unchanged for this test-case.

This panel contains various solver settings which can be used to change the accuracy and convergence of the flow solution. If you click on **Advanced configuration mode** you can see the full list of solver parameters which can be adjusted. They include discretisation schemes for the gradient and divergence terms, for the flow equations (pressure, velocity & turbulence).

![](./solver/solver-numerics.png "numerics")

### 8. Solver > Monitors

In this section we can (optionally) set a convergence monitor. For example, in this case we have added a monitor for the mass flow rate on the outlet boundary of the mixing elbow (see below). This allows us to check the stability of the outlet mass flow (as well as the residuals).  This is done to ensure the flow has converged properly, so we are not just relying on the flow residuals for convergence.

![](./solver/solver-monitors.png "monitors")


### 9. Solver > Run

- If needed we can select **Change machines** to select which machine will run the solver. In this case we use the default machine so we dont need to do anything with *change machine*.

- We also need to select the number of iterations and write interval which are both set to 1000 iterations for this case.

- Finally we can run the solver by selecting **Run**. 

    ![](./solver/solver-run.png "solver run")

When the solver runs we should see the screen output from the solver iterations, which will look familar (see below) if you have run **simpleFoam** before.

![](./solver/solver-running.png "solver running")

If the solver seems to be running as expected, you can then click on the **Monitors** tab, to view the solver convergence residuals instead. You should hopefully see the residuals reducing (as below) during the requested 1000 iterations.

![](./solver/solver-residuals.png "solver residuals")


### 10. Solver > Result

When the solver has finished running (as shown by the *screen output* in **Logs** and the *residual convergence* in **Monitoring**) you can then select **Load results** to see the final flow solution. You should then see the mixing elbow with pressure or velocity contours on the surface. 

  ![](./solver/load-results.png "load results")

As before (in the meshing section) you can then use the camera settings to adjust the view direction, and create a slice though the flow solution.  Here (see below) we are looking at the velocity magnitude through the mid-section of the mixing elbow. 

![](./solver/results-velocity.png "results velocity")

At this point you can check that you have the expected values of velocity (1m/sec and 2m/sec) at the respective inlets, and that the pressure is zero at the outlet. If not - then there is probably something wrong with the boundary conditions settings, and you should check through the setup and look for mistakes.

You can look at other flow values such as pressure, velocity and turbulence. Here (below) we are looking at the kinematic turbulent viscosity (nut) on the mid-section plane of the mixing elbow.

![](./solver/results-turbvisc.png "results turbvisc")


**NOTE:** if you want to go back to the project area...

- when you have finished looking at the flow solution, \
you can just select **Menu > Back to project** (top, left)

    ![](./solver/back-to-project1.png "back to project1")

- or click on the project name **elbow-demo** (top, middle)

  ![](./solver/back-to-project2.png "back to project2")

- when you are back in the project area, you should be able to \
see images of the meshing and solver applications like below

  ![](./solver/back-to-project3.png "back to project3")




d) delete project
-----------------

If you should need to delete the whole project directory (including both mesher and solver applications), the procedure is a bit more awkward, to prevent it from being deleted accidentally.

- settings > main settings
- delete project > delete project
- Please confirm by entering the project name
- delete project

![](./images/project-settings.png)

![](./images/delete-project.png)

![](./images/confirm-project.png)
