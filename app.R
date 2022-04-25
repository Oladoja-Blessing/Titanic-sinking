library(shiny.fluent)
library(shiny)
library(DMwR)
library(waiter)
library(bslib)
#########
### data
library(readr)
train <- read_csv("C:/Users/USER/Downloads/train.csv")

########
backgroundImageCSS <- "background-color: #cccccc;
                       height: 91vh;
                       background-position: center;
                       background-repeat: no-repeat;
                       background-size: cover; 
                       background-image: url('%s');
                       "
### Home page
home <- tabPanel(
  title = "Home",
  style = "background-color:black;
background-image:
radial-gradient(white, rgba(255,255,255,.2) 2px, transparent 40px),
radial-gradient(white, rgba(255,255,255,.15) 1px, transparent 30px),
radial-gradient(white, rgba(255,255,255,.1) 2px, transparent 40px),
radial-gradient(rgba(255,255,255,.4), rgba(255,255,255,.1) 2px, transparent 30px);
position: absolute; left: 0; right: 0;margin-top: -10px;width: 100%;
",
  column(12, 
         h3(p("Titanic Ship"), align = "center"),
         br(),
         tags$img(src = "data:image/jpeg;base64,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", 
                  style = "float: left; height: 250px; width: 250px; margin: 15px; border-radius: 50%;"),
         p("The RMS Titanic sank in the early hours of 15 April 1912 in the North Atlantic Ocean, four days into her maiden voyage from Southampton to New York City. 
It was the largest Ocean liner at the time and had an estimated 2,224 people on board when she struck an iceberg at around 23:40 (ship's time) on Sunday, 14 April 1912. 
Her sinking on Monday, 15 April, resulted in the deaths of more than 1,500 people. 
This made it one of the deadliest peacetime maritime disasters in history."),
         p("The highest percentage of survivors were women, children, or people accompanying a child. Statistically males, adults and passengers without children were less likely to survive.

A woman's chance of survival was more than 50% greater than a man's, a child had a 14.8% higher probability of surviving than an adult, and an adult accompanying a child was 19.6% more likely to survive than one without.")
         ,
         p("The analysis tab is built on a model that predicts whether a passenger will survive the sinking of the ship using there Age, Sex, Cabin class, and the number of relatives aboard as parameters.
  You can check to see your chances of surviving the disaster if you were there."),
         p("This project is inspired by kaggle's first competition and the model was built using data from the same organization.")
  )
  )
#############
### analysis page
analysis <- tabPanel(
  title = "Analysis",
  sidebarLayout(
    sidebarPanel(
      title = "Inputs",
      sliderInput("age",
                  "Your age:",
                  min = 1,
                  max = 100,
                  value = 30),
      radioButtons("Pclass",
                   "Passenger class:",
                   c("First class" = 1,
                     "Second class" = 2,
                     "Third class" = 3
                   )),
      radioButtons("sex",
                   "Your Sex:",
                   c("Female" = "female",
                     "Male" = "male"
                   )),
      sliderInput("sibsp",
                  "Number of Siblings or spouse aboard:",
                  min = 0,
                  max = 10,
                  value = 1),
      actionButton("run_button","Analyze",icon = icon("play"))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      style = sprintf(backgroundImageCSS,  "https://wallpaperaccess.com/download/titanic-ship-2889504"),
      uiOutput("result")
    )
  )
)

########
### about
about <- tabPanel(title = "About",
                  style = sprintf(backgroundImageCSS, "https://wallpaperaccess.com/download/titanic-ship-1266157"),
  "Titanic is a shiny app created for the sole purpose of predicting your chances of surviving the titanic ship disaster",
  br(),br(),br(),
  "Created with R Shiny by:",
  fluidPage(uiOutput("tab")),
  "Source code on",
  fluidPage(uiOutput("tab2")),
  br(),br(),br(),
  "2022 April")
################
### theme
a <- font_google("Crimson Pro", wght = "200..900", local = FALSE)
b <- font_link(
  "Crimson Pro",
  href = "https://fonts.googleapis.com/css2?family=Crimson+Pro:wght@200..900"
)
url <- "https://fonts.gstatic.com/s/crimsonpro/v13/q5uDsoa5M_tv7IihmnkabARboYF6CsKj.woff2"
c <- font_face(
  family = "Crimson Pro",
  style = "normal",
  weight = "200 900",
  src = paste0("url(", url, ") format('woff2')")
)
themes <- bslib::bs_theme(
  bootswatch = "superhero",
  base_font = font_google("Fira Sans"),
  code_font = font_google("Fira Code"),
  heading_font = font_google("Fredoka One")
)

###############
# Define UI for application 
ui <- navbarPage(
  theme = themes,
  # Application title
  titlePanel("Titanic sinking"),
  home,
  analysis,
  about
)
# Define server logic 
server <- function(input, output) {
  surv <- eventReactive(input$run_button,{
    train.rt3 <- rpartXse(Survived~.,data = train[,c(2,3,5,7)])
    new_data <- data.frame(Age = input$age,Pclass = as.integer(input$Pclass),
                           Sex = input$sex, SibSp = input$sibsp)
    result <- round(predict(train.rt3,new_data),0)
    if(result == 1){
      tags$strong(paste0("Congratulations!!! You Survived the sinking of the Titanic "))
    }else{
      tags$strong(paste0("I am very sorry, you could not make it", emo::ji("sad")))
    }
  })
  ######   
  output$result <- renderUI(
    surv()
  )
  ######
  url <- a("Oladoja Blessing Bolarinwa", 
           href="https://www.linkedin.com/in/blessing-oladoja-19034618b/?lipi=urn%3Ali%3Apage%3Ad_flagship3_resumebuilder%3BZnSh2P1oTFGai0oTDfBa5Q%3D%3D",
           target = "_blank")
  output$tab <- renderUI(tagList(url))
  #####
  url2 <- a("Github", 
            href="https://github.com/Oladoja-Blessing/",
            target = "_blank")
  output$tab2 <- renderUI(tagList(url2))
}

# Run the application 
shinyApp(ui = ui, server = server)
