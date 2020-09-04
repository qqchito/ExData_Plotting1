#Code to initialize a PNG file to save the plot

init_png <- function(file, w, h) {
  
  #Call to png function to save the plot to
  png(file = file, width = w, height = h)
  
}