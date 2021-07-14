library(plotly)

create.histogram.percent <- function(data, column, title) {
  fig <- plot_ly(data = data,
                 x = column,
                 type = "histogram",
                 histnorm = "percent"
  )
  
  
  fig <- fig %>% layout(
    yaxis = list(title= "Verteilung in %"), 
    title = title
  )
  
  fig
}