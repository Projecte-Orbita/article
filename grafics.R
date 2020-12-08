# Gràfics

cormat_plot = function(melted_cormat, titol = "") {
  ggheatmap <- ggplot(melted_cormat, aes(Var2, Var1, fill = value)) +
    geom_tile(color = "white") +
    scale_fill_gradient2(
      low = "blue",
      high = "red",
      mid = "white",
      midpoint = 0,
      limit = c(-1, 1),
      space = "Lab",
      name = "Spearman\nCorrelation"
    ) +
    theme_light() + # minimal theme
    theme(axis.text.x = element_text(
      angle = 45,
      vjust = 1,
      size = 12,
      hjust = 1
    )) +
    coord_fixed() +
    ggtitle(titol) +
    geom_text(aes(Var2, Var1, label = round(value, 2)),
              color = "black",
              size = 4) +
    theme(
      axis.title.x = element_blank(),
      axis.title.y = element_blank(),
      panel.grid.major = element_blank(),
      panel.border = element_blank(),
      panel.background = element_blank(),
      axis.ticks = element_blank(),
      legend.justification = c(1, 0),
      legend.position = c(0.5, 0.7),
      legend.direction = "horizontal",
      plot.title = element_text(hjust = 0.5)
    ) +
    
    guides(fill = guide_colorbar(
      barwidth = 5,
      barheight = 1,
      title.position = "top",
      title.hjust = 0.5
    ))
}