# MetabolismTools

This package, for now, contains two functions: Bubble_plot and ko_pheatmap_for_CP9_groups.

The first function creates a bubble plot and allows you to color by your data's particular feature. The second function is currently under development, but it makes a heatmap of specific KO ids. 

Install the package like this:

``install.packages("devtools")``

``library(devtools)``

``install_github("mirnavazquez/MetabolismTools")``
  
Run the example:

``library(MetabolismTools)``

``Bubble_plot(example,  "gene", "genomes", "abundance", "group")``


Explore the data format by looking at the "example" data.
