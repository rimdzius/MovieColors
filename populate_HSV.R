
populate_HSV <- function(database, fps, start_position, stop_position) {
      # Add HSV values to database of movies.
      
      suppressMessages(require(progress))
      movies_progress <- progress_bar$new(format = "   evaluating movies [:bar] :percent eta: :eta",
                                          total = stop_position-start_position+1)
      movies_progress$tick(0)
   
      directory <- "temp_movie_frames"
      
      for (movie in start_position:stop_position) {
         # iterate over movies in the database.
         if(dir.exists(directory)) { 
            unlink(directory, recursive = TRUE, force = TRUE)
            dir.create(directory)
         }
            # create a temporary folder for the still frames.
         
         does_file_exist <- create_movie_stills(database[movie, 3], directory, fps)
            # call function to create the movie stills in the temp directory.
         if(does_file_exist == 0) {
            movies_progress$tick()
            next
         }
         
         HSV_database <- get_HSV_database(directory)
         database[movie, 4] <- HSV_database
            # call function to create the HSV value for each movie still and
            # store this dataframe into the database.
            # This is non-normalized frames, so every movie will have a different
            # number of frames.
         database[movie, 5] <- mean(HSV_database[,1])
         database[movie, 6] <- mean(HSV_database[,2])
         database[movie, 7] <- mean(HSV_database[,3])
            # Also add an overall mean of the Hue Saturation and Value for each
            # movie. These are a single value across the entire movie, not frame
            # by frame.
         
         unlink(directory, recursive = TRUE, force = TRUE)
            # delete the temporary directory of images.
         movies_progress$tick()
      }
      
      return(database)
}