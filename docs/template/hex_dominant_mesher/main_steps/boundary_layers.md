# Boundary layers

<figure Markdown>
  ![Boundary layers step](./images/boundary_layers_step.png){ .zoom .image-wrapper }
  <figcaption>View of the boundary layers step</figcaption>
</figure>

In this step the user can create layers over some of the loaded STL surfaces. 
The purpose of these step is to construct layers which are normal to the surface 
to make the calculations of the boundary layer solver more accurate.

All the surfaces of the loaded STL are listed as shown in the above image. For a selected surface, the following entries are specified:

1. **Layers:** this specifies the number of layers to be constructed.
1. **Expansion ratio:** the heights of the constructed layers follow a geometric progression. This entry specifies the ratio of the geometric progression.
1. **Min thickness:** The mesher may try to construct layers whose thickness is small enough to cause stability and/or accuracy problems. So, it is advisable to specify a minimum value for the thickness of the layers to avoid these extra small layers. 
1. **Final layer thickness:** this represents the thickness of the last layer (the furthest from the surface).
