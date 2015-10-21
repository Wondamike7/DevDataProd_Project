library(shiny)

batting_avg <- function(atbats, hits) round(hits/atbats,3)
slg_pct <- function(atbats, hits, hrs, dbls, trpls) {
	numer <- hrs*4 + trpls*3 + dbls*2 + (hits-hrs-dbls-trpls)
	denom <- atbats
	round(numer/denom,3) ## this part doesn't seem to be doing anything...
}

## Had to add 'session' to function for the updateTabsetPanel
shinyServer(function(input, output, session) {
	## Used action button instead of submit button.
	## The first click activates all the effects below, making them reactive after the first click. Not sure how to keep them tied to the button...
	observeEvent(input$click, {
		# Trying to switch tabset on click
		updateTabsetPanel(session, "tabset", selected = "Results")
	})
		
		output$atbats <- renderText({input$atbats})
		output$hits <- renderText({input$hits})
		output$hrs <- renderText({input$hrs})
		output$dbls <- renderText({input$dbls})
		output$trpls <- renderText({input$trpls})
		
		output$text <- renderText({
			paste("You have selected", input$atbats, "at bats,",input$hits,"hits,",input$hrs,"home runs,",input$trpls,"triples, and ",input$dbls,"doubles.")
		})
	
		output$ba <- renderText({
			validate(
				need(input$atbats>input$hits,"Number of hits cannot exceed number of at bats")
			)
			## this was how I got it to always print 3 digits, which is how the result is usually shown
			sprintf('%1.3f',batting_avg(input$atbats, input$hits))
		})
		
		output$slg <- renderText({
			validate(
				need(input$atbats>=input$hits,"Number of hits cannot exceed number of at bats"),
				need(input$hits>=(input$hrs+input$trpls+input$dbls),"Sum of types of hits cannot exceed total number of hits")
			)
			
			sprintf('%1.3f',slg_pct(input$atbats, input$hits, input$hrs, input$trpls, input$dbls))
		})
	})

