

movie_colors <- function(start_position = 1, stop_position = NA, fps = NULL) {
      
      database <- initiate_movie_database()
         # Create database of locally stored movies.
         print('Database created.')
      if (is.na(stop_position)) { stop_position <- nrow(database) }
         # If number of movies isn't selected, run full database.
         print(paste0('Processing ',stop_position-start_position+1,' movie(s).'))
      database <- populate_metadata(database)
         # Add metadata to the movies in the database
         print('Metadata added to the database. Beginning HSV.')
      database <- populate_HSV(database, fps, start_position, stop_position)
         # Add the HSV data to the selected movies in the database.
         print('HSV data added to the database.')
      
      return(database)
      
}