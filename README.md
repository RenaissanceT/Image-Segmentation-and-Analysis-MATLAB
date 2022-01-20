# Image-Segmentation-and-Analysis-MATLAB
The objective of the project is to analyze a histopathological image obtained from a stained skin tissue sample. The image looks pink due to the staining. The task is to segment the nuclei present in the image and determine their size and location by using image segmentation and analysis.

# <sub> Original Image (L) and Segmented Image (R)
 <img src="https://user-images.githubusercontent.com/97911922/150272534-f07f815b-b6b8-4b92-8783-db5a3402d411.JPG" width="49%" height="49%"> <img src="https://user-images.githubusercontent.com/97911922/150271746-3323ad07-bbba-44f1-a7d4-a58501821e4f.png" width="49%" height="49%">
  
# <sub> Segmentation Results
<img src="https://user-images.githubusercontent.com/97911922/150271781-4334144e-f54a-44b0-af6e-d021cd80d76a.png" width="100%" height="100%">
  <img src="https://user-images.githubusercontent.com/97911922/150271809-87d0142f-11d0-447d-8695-ef92d5e0f2e3.png" width="100%" height="100%">
  
# <sub> Comments
The microscopic images can be magnified, digitized, and the digital images can be analyzed using an image processing algorithm. From the visual inspection, there are 12 presented nuclei in the provided cell.
    
# <sub> MATLAB Objectives  
* graythresh: Image threshold calculation using Otsu's method 
* im2bw: Convert image to binary image, based on threshold 
* strel: Create morphological structuring element
* imopen: Morphologically open image
* bwconncomp: Find connected components in binary image
* regionprops:  Measure properties of image regions
* find: Find indices and values of nonzero elements
* ismember: Array elements that are members of set
* labelmatrix: Create label matrix from bwconncomp structure

  
  
  
  
  
  
  
