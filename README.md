# Vessel-Segmentation-in-Fundus-Images
## About
This project involves the implementation of various image processing techniques to enhance and analyze a given image. The main steps include resizing the image, converting it to grayscale using PCA, applying contrast enhancement, background exclusion, Wiener filtering, and thresholding. The final output is an enhanced image with highlighted features.

## Steps Involved
1. **Read and Display Original Image:**
   - The original image is read and displayed.

2. **Resize Image:**
   - The image is resized to facilitate easier computation.

3. **Convert RGB to Grayscale using PCA:**
   - The image is converted from RGB to grayscale using Principal Component Analysis (PCA).

4. **Contrast Enhancement:**
   - Contrast Limited Adaptive Histogram Equalization (CLAHE) is applied to enhance the grayscale image.

5. **Background Exclusion and Wiener Filtering:**
   - A Wiener filter is applied to the enhanced image for noise reduction.

6. **Difference Calculation:**
   - The difference between the grayscale image and the Wiener filtered image is calculated.

7. **Thresholding using Otsu's Method:**
   - Otsu's method is used for thresholding, followed by converting the image to binary and removing small pixels.

8. **Overlay and Resultant Image:**
   - The processed binary image is overlaid on the original resized image to highlight the features.

## Requirements
- MATLAB
- Image Processing Toolbox

## Output
The output includes various stages of the image processing pipeline displayed in a subplot, including the original image, grayscale image, contrast-enhanced image, Wiener filtered image, difference image, and the final resultant enhanced image.
