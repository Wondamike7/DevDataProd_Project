--- 
title       : Baseball Statistics 101
subtitle    : An introduction to baseball and its data
author      : Michael Moskowitz
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax, quiz, bootstrap]    # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
logo        : baseball_logo.png
---

## Purpose

The purpose of this presentation is to pitch my new Shiny App titled "Baseball 101."

People new to the sport of baseball may find the data and statistics surrounding it to be daunting. My app offers an interactive introduction to some simple baseball statistics.

--- &radio

## Pop Quiz!

If a batter has 100 at-bats and gets 50 hits, 25 of which are home runs, the rest singles, what is his slugging percentage? 

1. 0.500
2. 0.250
3. _1.250_
4. 42

*** .hint 
Slugging percentage is calculated as $total bases / at-bats$

*** .explanation 
The formula is $total bases / at-bats$ 
With 25 home runs and 25 singles, the batter got 125 total bases (25*4 + 25), and had 100 at-bats, so his slugging percentage is 1.250.

---

## How the app works

The user inputs some data for a baseball player and clicks 'Show Results' and the application produces both the player's batting average and slugging percentage.

Using the example from the previous slide (ignoring doubles and triples), the underlying code would calculate:

```r
hits <- 50; hr <- 25; atbats <- 100;
bavg <- hits/atbats
slgpct <- (hr*4+(hits-hr)*1)/atbats
paste("The batting average is",sprintf('%1.3f',bavg))
```

```
## [1] "The batting average is 0.500"
```

```r
paste("The slugging percentage is",sprintf('%1.3f',slgpct))
```

```
## [1] "The slugging percentage is 1.250"
```

---

## Additional notes
The application includes a documentation tab to help the user navigate. 

The 'Show Results' button will always activate the Results tab.

There are validation measures to ensure that the batter's data are legitimate. Specifically, the number of hits cannot exceed the number of at bats, and the total number of hits must be greater than or equal to the sum of the different types of hits (home run, double, triple).
