# DICOM-Series

**General information:**

This project is dedicated for scientiests who want to create image stack with DICOM format.
This tool can be useful to create your own image stack with DICOM easily.

**Algorithm:**
The code load anonimious metadata from DICOM file(located in the root directory)
Load the pics folder and makes Ncopies of each image in grayscale
Change metadata (slice number, greyscale, position etc.) and save as .dcm file

**Notice:**
Due to confidential information the real human tissues pics was replaced by muscle tissue pic distributed for free and rotated.
For your purpose you can use any pictures, but be aware to check extension in the code (.png by default)
Image size 512 x 512 by default
If your image is dark you can fix it by changing metadata.RescaleIntercept value
For edges change  metadata.RescaleSlope value
