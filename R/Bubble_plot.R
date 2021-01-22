#' @title Create bubble plots
#' @description This function takes a four row dataframe to create a bubble plot.
#' @param tabla_de_datos a four row dataframe.
#' @param tabla_de_datos_x a valid col name to use on the x axis.
#' @param tabla_de_datos_y a valid col name to use on the y axis.
#' @param tabla_de_datos_sz a valid col name to use to plot the size of the bubbles.
#' @param tabla_de_datos_color a valid col name to use to plot the color of the bubbles.
#' @details This function is part of a package used for the analysis of microbial metabolism.
#' @examples
#' Bubble_plot(example,  "gene", "genomes", "abundance", "group")
#' @export
Bubble_plot<-function(tabla_de_datos, tabla_de_datos_x,
                        tabla_de_datos_y, tabla_de_datos_sz,
                        tabla_de_datos_color){
  ggplot(tabla_de_datos,
         aes_string(x=tabla_de_datos_x,
                    y=tabla_de_datos_y,
                    size=tabla_de_datos_sz,
                    color=tabla_de_datos_color )) +
    geom_point(alpha=0.5) +
    scale_size(range = c(1,4))+
    theme_bw(base_size = 9) +
    theme(axis.text.x = element_text(angle = 90,
                                     size=8,
                                     hjust = 1,
                                     vjust = 0.5),
          axis.text.y = element_text(size=9))
}


