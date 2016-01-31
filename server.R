# Use the euro data
data(euro)
euro2 <- c(euro, "EURO"=1)
cnames <- names(euro2)
listx <- c(cnames)
names(listx)<-c(cnames)
euro2 <- c(euro, "EURO"=1)

# The full names of the currencies
euro2fullname <- c('ATS'='Austrian Schilling ATS',
                   'BEF'='Belgian Franc BEF',
                   'DEM'='German Mark DEM',
                   'ESP'='Spanish Peseta ESP',
                   'FIM'='Finnish Markka FIM',
                   'FRF'='French Franc FRF',
                   'IEP'='Irish Punt IEP',
                   'ITL'='Italian Lira ITL',
                   'LUF'='Luxembourg Franc LUF',
                   'NLG'='Dutch Guilder NLG',
                   'PTE'='Portuguese Escudo PTE',
                   'Euro'='Euro')

convert <- function(value1,select1,select2) {
    round(value1/euro2[[select1]]*euro2[[select2]],3)
    }

shinyServer(
    function(input,output){
        output$inputValue <-renderPrint({input$value1})
        output$inputUnit <- renderPrint({names(listx[input$select1])})
        output$outputValue <- renderPrint({convert(input$value1,input$select1,input$select2)})
        output$outputUnit <- renderPrint({names(listx[input$select2])})
        output$outputfullname1 <-renderPrint({euro2fullname[[input$select1]]})
        output$outputfullname2 <-renderPrint({euro2fullname[[input$select2]]})
}
)
