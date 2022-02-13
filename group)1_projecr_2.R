library(shiny)
library(fpp3) 
data("tourism")


ui <- fluidPage(
  
  selectInput(inputId = "Selected_Region", label = "Region", choices =unique(tourism$Region)),
  plotOutput("ts_plot"),
  
  selectInput(inputId = "select", label = "Purpose", 
              choices = unique(tourism$Purpose)), 
              plotOutput("value")
  
  
)


server <- function(input, output) {
  output$ts_plot <- renderPlot ({
      Region1 <- subset(tourism, Region==input$Selected_Region)
      autoplot(Region1)
    }
  )
  
  output$value <- renderPlot({ 
    purpose <- subset(tourism, Purpose==input$select)
    autoplot(purpose)
    })
}



shinyApp(ui, server)