

movie_colors <- function(start_position = 1, stop_position = NA, fps = 1, database = data.frame(NA)) {
   
      if(is.na(database[[1]])) {
            print('Creating database.')
            database <- initiate_movie_database()
            # Create database of locally stored movies.

            print(paste0('Processing movie metadata.'))
            database <- populate_metadata(database)
            # Add metadata to the movies in the database
      }
   
      if (is.na(stop_position)) { stop_position <- nrow(database) }
      # If number of movies isn't selected, run full database.
   
      database <- populate_HSV(database, fps, start_position, stop_position)
         # Add the HSV data to the selected movies in the database.
      
      return(database)
      
}