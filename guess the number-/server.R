#install.packages("shiny")
library(shiny)

#the computer guesses an integer between
number <- floor(runif(1,1,101))
#print(number)
numberGuessed <- function(guess, number) {
        returnValue <- "Nothing entered yet."
        if (guess > 100) {
                #print(guess)
                #print(class(guess))
                #print(class(100))
                returnValue <- 'Above 100.\nPlease make a selection between 1 and 100.'
        }
        else if (guess < 1) {
                #print(guess)
                returnValue <- 'Below 1.\nPlease make a selection between 1 and 100.'
        }
        else if (guess > number) {
                returnValue <- 'Higher than the number.'
        }
        else if (guess < number) {
                returnValue <- 'Lower than the number.'
        }
        else if (guess == number) {
                returnValue <- 'Correct!'
        }
        returnValue
}
shinyServer( 
        function(input, output) {
                output$inputValue <- renderPrint({as.numeric(input$guess)})
                #output$outputValue <- renderText({numberGuessed(input$guess, number)})
                output$outputValue <- renderText({
                        if (input$goButton == 0) "You have not guessed a number yet"
                        else if (input$goButton >= 1) numberGuessed(as.numeric(input$guess), number)
                })
        }
)