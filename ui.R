library(shiny)
library(datasets)

# Use the euro data
data(euro)
euro2 <- c(euro, "EURO"=1)
cnames <- names(euro2)
listx <- c(cnames)
names(listx)<-c(cnames)

shinyUI(
    pageWithSidebar(
        headerPanel('European Currency Conversion'),
        sidebarPanel(
            fluidRow(
                h5('The original currency'),
                column(6,numericInput('value1','',1,min=1,max=10000,step=1)),
                column(6,selectInput('select1',label='',choices = listx, selected = 'ATS'))),
            fluidRow(
                h5('is converted into the curreny of'),
                column(6,selectInput('select2',label='',choices = listx, selected = 'ATS'))),
            submitButton('Submit')
        ),
        mainPanel(
            h3('Instruction'),
            h5('This app is used to convert the currencies participating
               in the European monetary union.'),
            br(),
            h5('Your input value and currency are'),
            verbatimTextOutput('inputValue'),
            verbatimTextOutput('inputUnit'),
            h5('The resulting value and currency are'),
            verbatimTextOutput('outputValue'),
            verbatimTextOutput('outputUnit'),
            br(),
            h6('Note:'),
            h6('These conversion rates were fixed by the European Union on December 31, 1998.'),
            verbatimTextOutput('outputfullname1'),
            verbatimTextOutput('outputfullname2')
        )
))
