\name{plotly_arules}
\Rdversion{1.1}
\alias{plotly}
\alias{plotly_arules}
\title{Interactive Scatter Plot for Association Rules using plotly}
\description{
Plot an interactive scatter plot for association rules using \pkg{plotly}.
This function is \bold{deprecated}. Use \code{\link{plot}} with parameter 
\code{engine = "plotly"} instead.
}
\usage{
plotly_arules(x, method = "scatterplot", measure = c("support", "confidence"), 
  shading = "lift", max = 1000, ...)
}
\arguments{
  \item{x}{ an object of class "rules". }
  \item{method}{ currently the methods "scatterplot", "two-key plot"
    and "matrix" are supported.}
  \item{measure}{ measure(s) of interestingness 
  (e.g., "support", "confidence", "lift", "order") used in the visualization as x
  and y-axis.}
  \item{shading}{ measure of interestingness used for color shading.}
  \item{max}{ client side processing in plotly is expensive. We restrict the 
  number of rules to the max best rules (according to the measure used for shading.)}
  \item{\dots}{ The following additional arguments can be used: \code{colors} to specify a color palette, \code{precision}
    to specify the precision used for printing quality measures,
    \code{jitter} to reduce overplotting in scatterplots 
    (defaults to .1 if overplotting would occur), and \code{marker} with 
    a list of markter attributes (e.g., size, symbol and opacity).}
}
\value{
The plotly object (plotly_hash) which can be saved as a htmlwidget.
}
%\details{}
%\references{}
%\seealso{}
\examples{
\dontrun{ 
library(plotly)
data(Groceries)
rules <- apriori(Groceries, parameter=list(support=0.001, confidence=0.8))
rules

# interactive scatter plot visualization
plotly_arules(rules)
plotly_arules(rules, measure = c("support", "lift"), shading = "confidence")
plotly_arules(rules, method = "two-key plot")

# add jitter, change color and markers and add a title
plotly_arules(rules, jitter = 10, 
  marker = list(opacity = .7, size = 10, symbol = 1), 
  colors = c("blue", "green")) %>% layout(title = "Some Grocery Rules")


# save a plot as a html page
p <- plotly_arules(rules)
htmlwidgets::saveWidget(p, "arules.html", selfcontained = FALSE)
browseURL("arules.html")
# Note: selfcontained seems to make the browser slow.

# interactive matrix visualization
plotly_arules(rules, method = "matrix") %>% layout(title = "Reordered Matrix")
}
}
\keyword{ hplot }
