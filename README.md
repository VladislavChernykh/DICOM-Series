# DICOM-Series
This project is dedicated for scientiests who want to create image stack with DICOM format 

The code load anonimious metadata from DICOM file(located in the root directory)
Load the pics folder and makes Ncopies of each image in grayscale
Change metadata (slice number, greyscale, position etc.) and save as .dcm file

This tool can be useful to create your own image stack with DICOM easily.
If your image is dark you can fix it by changing metadata.RescaleIntercept value
For edges change  metadata.RescaleSlope value
