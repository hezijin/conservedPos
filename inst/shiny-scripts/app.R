library(shiny)
# This layout of app is adapted from
# app.R section. Tabsets(2020) Shiny in R studio
# https://shiny.rstudio.com/gallery/tabsets.html
# Other Reference:
# Using sliders(2017) Shiny in R studio
# https://shiny.rstudio.com/articles/sliders.html

ui <- fluidPage(
  titlePanel("conservedPos"),

  sidebarLayout(
    sidebarPanel(

      fileInput("file", "File input:"),

      br(),

      sliderInput("range", "Choose plot pange in max length of conservity table)",
                  min = 1, max = 200,
                  value = c(1,10)),
      br(),

      textInput("site",
                "Choose a specific site",
                value = 1)


    ),

    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("Conservity Table", verbatimTextOutput("table")),
                  tabPanel("Conservity Plot", plotOutput("plot")),
                  tabPanel("Site-specific Conservity", tableOutput("site"))

      )
    )

  )
)

server <- function(input, output) {


    output$table<- renderPrint({
      testSeq <- Biostrings::readBStringSet(input$file$datapath)
      mytable <- conservityTable(testSeq)
      cat("Conservity for uploaded sequences set, max length",findMaxLen(testSeq))
      cat("\n")
      mytable
    })

    output$plot<- renderPlot({
      testSeq <- Biostrings::readBStringSet(input$file$datapath)
      mytable <- conservityTable(testSeq)
      plotPartial(mytable, input$range[1], input$range[2])

    })

    output$site<- renderPrint({
      testSeq <- Biostrings::readBStringSet(input$file$datapath)
      posVec <- createPosVec(testSeq,as.numeric(input$site))
      cat("Nucleotide/Residue with highest frequency at position:", findConservedNul(posVec))
      cat(" with frequency", findConservityFromS(posVec))
      #

    })


  }
shinyApp(ui = ui, server = server)
