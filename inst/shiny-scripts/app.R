library(shiny)
ui <- fluidPage(
  titlePanel("conservedPos"),

  sidebarLayout(
    sidebarPanel(

      fileInput("file", "File input:"),

      br(),

      mainPanel(

        actionButton("Calculate", "Calculate")
      )
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
      mytable
    })

    output$plot<- renderPlot({
      testSeq <- Biostrings::readBStringSet(input$file$datapath)
      mytable <- conservityTable(testSeq)
      plotOverall(mytable)

    })

    output$site<- renderPrint({
      testSeq <- Biostrings::readBStringSet(input$file$datapath)
      posVec <- createPosVec(testSeq,2)
      cat("Nucleotide/Residue with highest frequency at position:", findConservedNul(posVec))
      cat(" with frequency", findConservityFromS(posVec))
      #

    })


  }
shinyApp(ui = ui, server = server)
