
create_movie_stills <- function(movie_file_dir, movie_file_name, temp_pic_dir, fps) {
      # create a directory of still images/frames from a movie.
      
      # ffmpeg command line application will be used to create stills.
      # AV package was tried initially, but processing all the movies would
      # have taken years to complete. ffmpeg is significantly faster, but does
      # require separate install on each system in order to run this code.
      # See: https://ffmpeg.org/
      
      movie_path <- paste0("\"", movie_file_name, "\"")
      temp_path <- paste0("\"", getwd(), "/", temp_pic_dir, "/", "image_%06d.png", "\"")
      system(paste0("ffmpeg ", "-i ", movie_path, " -vf ", "fps=", fps, " ", temp_path, " -loglevel quiet -nostats"))
         # -loglevel quiet suppresses notes.
         # -nostats suppresses "frame=" stats.
      
      return()
}