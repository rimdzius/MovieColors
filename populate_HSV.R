
populate_HSV <- function(database, fps, start_position, stop_position) {
      # Add HSV values to database of movies.
   
      temp_pic_dir <- "temp_movie_frames"
      
      for (movie in start_position:stop_position) {
            # iterate over movies in the database.
         movie_file_dir <- database[movie, 3]
         
         
         if(dir.exists(temp_pic_dir)) { 
            unlink(temp_pic_dir, recursive = TRUE, force = TRUE)
            # delete any existing folder/images
         }
         dir.create(temp_pic_dir)
            # create a temporary folder for the still frames.
         
         
         movie_file_name <- movie_file_name(movie_file_dir)
         if(movie_file_name == 0) { next }
            # if movie file does not exist, move on to the next.
         
         
         create_movie_stills(movie_file_dir,
                             movie_file_name,
                             temp_pic_dir,
                             fps)
            # create the images in the temporary directory.
         
         
         movie_HSV_database <- get_HSV_database(temp_pic_dir,
                                                movie,
                                                stop_position-start_position+1)
         database[[movie, "HSV_raw"]] <- movie_HSV_database
            # call function to create the HSV value for each movie still and
            # store this dataframe into the database.
            # This is non-normalized frames, so every movie will have a different
            # number of frames.
         database[movie, 5] <- mean(movie_HSV_database[,1])
         database[movie, 6] <- mean(movie_HSV_database[,2])
         database[movie, 7] <- mean(movie_HSV_database[,3])
            # Also add an overall mean of the Hue Saturation and Value for each
            # movie. These are a single value across the entire movie, not frame
            # by frame.
         
         unlink(temp_pic_dir, recursive = TRUE, force = TRUE)
            # delete the temporary directory of images.
      }
      
      return(database)
}