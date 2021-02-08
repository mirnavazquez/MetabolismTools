#' @title Create a heatmap.
#' @description This function creates a heatmap of the genes in which you are interested.
#' @param Table_groups a dataframe containing the information of the ko and groups.
#' @param Key_vector a vector with the interesting KO.
#' @param Table_genes a dataframe containing the names of the KO and the Genes.
#' @param Order_vector vector containing the order of the Genes in the plot.
#' @details This function is part of a package used for the analysis of microbial metabolism.
#' @import tidyverse RColorBrewer pheatmap dplyr tibble
#' @examples
#' ko_pheatmap_for_CP9_groups(Ko_Final_groups, Arsenic,  Input_data, orden_gene)
#' @export
ko_pheatmap_for_CP9_groups<-function(Table_groups, Key_vector, Table_genes, Order_vector) {
  KO_table<-Table_groups %>%
    filter(ko %in% Key_vector) %>%
    left_join(Table_genes, by ="ko") %>%
    mutate(group_1=(group_1/3)) %>%
    mutate(group_2=(group_2/13)) %>%
    mutate(group_3=(group_3/4))%>%
    mutate(group_4=(group_4/28))%>%
    mutate(group_5=(group_5/17))%>%
    mutate(group_6=(group_6/15)) %>%
    arrange(match(Gene, Order_vector))
  KO_heatmap<- KO_table %>%
    select(-c("ko", "metabolism", "pathway", "description")) %>%
    column_to_rownames("Gene")
  my_colors = brewer.pal(n= 9, name = "Greens")
  pheatmap::pheatmap(KO_heatmap,
                     scale="none",
                     cluster_rows = F,
                     cluster_cols  = F,
                     angle_col=0,
                     labels_col=c("Aeromonadities", "Group 1", "Group 2", "Group 3", "Group 4", "Group 5"),
                     color=my_colors,
                     cex = 1.5)
}
