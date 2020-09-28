
get_HSV_database <- function(directory) {
      # Obtain a dataframe of the average Hue, Saturation and Value of each
      # image (movie frame) stored in the given temp directory
      require(imager)
      require(progress)
      number_of_frames <- length(list.files(directory))
         # number of image files in the directory (equals the total number of
         # frames in the movie.)
      movie_HSV_database <- data.frame("Hue" = numeric(number_of_frames),
                                      "Saturation" = numeric(number_of_frames),
                                      "Value" = numeric(number_of_frames))
         # create blank dataframe that will store the average H, S, V numbers
         # for each frame.
      
      progress <- progress_bar$new(total = number_of_frames)
      progress$tick(0)
      
      for (frame in 1:number_of_frames) {
            # iterate over each image
            image_file <- paste0(directory,"/","image_",sprintf("%06d", frame),".jpg")
            image <- load.image(image_file)
            image_rgb <- data.frame("R" = round(as.vector(image[,,1])*255,0),
                                  "G" = round(as.vector(image[,,2])*255,0),
                                  "B" = round(as.vector(image[,,3])*255,0))
            image_hsv <- rgb2hsv(image_rgb[,1], image_rgb[,2], image_rgb[,3])
            movie_HSV_database[frame, 1] = round(mean(image_hsv[,1])*360,0)
            movie_HSV_database[frame, 2] = round(mean(image_hsv[,2])*100,0)
            movie_HSV_database[frame, 3] = round(mean(image_hsv[,3])*100,0)
            progress$tick()
      }
      
      return(movie_HSV_database)
}