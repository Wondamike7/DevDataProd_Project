library(shiny)

shinyUI(fluidPage(

  titlePanel("Baseball Stats 101"),

  sidebarLayout(
    
    sidebarPanel(
## Want to eventually build a dynamic UI that lets the user choose batter or pitcher, but start with easier example... 
# radioButtons("radio", label = h4("Batter or Pitcher Statistics?"),
#		choices = list("Batter" = 1, "Pitcher" = 2), selected = 1)
## need something with uiOutput, which creates an R object in raw html...

	
	h3("Input the batter's data"),
	numericInput('atbats', 'At Bats',1, min=1, step=1),
	numericInput('hits', 'Hits', 0, min=0, step=1),
	numericInput('hrs', 'Home Runs', 0, min=0, step=1),
	numericInput('trpls','Triples',0,min=0,step=1),
	numericInput('dbls','Doubles',0,min=0,step=1),
	actionButton("click", "Show Results")
	
	),
	
    mainPanel(

		tabsetPanel(id = "tabset", selected="Instructions",
	
			tabPanel("Instructions",
				h2("Purpose of this app:"),
				p("This app is intended to provide an introduction to baseball statistics for those unfamiliar with the sport. 
					The app asks the user to input some basic data about a batter, and returns two common baseball statistics,
					the batting average and the slugging percentage."),
				
				p("Batting average is calculated as the number of times a batter gets a hit divided by the total number of at-bats. 
					This statistic falls between 0.000 and 1.000."),
				p("Slugging percentage is calculated as the total bases a batter achieves divided by the total number of at-bats, 
					with a home run accounting for four bases, a triple three, a double two, and a single one. In this app, I calculate the number of singles as the difference between
					the number of hits and the sum of home runs, triples and doubles. This statistic can range betwen 0.000 and 4.000"),
				
				h2("How to use this app:"),
				p("Please input a number of at-bats, hits, home runs, triples, and doubles and then click 'Show Results'."),
				p("Please be patient as the app may take time to switch tabs and show you the results."),
				p("The application will return the values you entered, and calculate your statistics in the 'Results' tab."),
				p("There are some validation rules to ensure you get accurate statistics; please read any error messages, update your inputs and try again."),
				p("Thanks for using!")

			),

			tabPanel("Results",
				h3("Your inputs:"),
				textOutput('text'),
				
				h3("Basic batter statistics"),
				h4("Batting average:"),
				verbatimTextOutput('ba'),
				h4("Slugging percentage:"),
				verbatimTextOutput('slg')

				)
		)
	)
)))