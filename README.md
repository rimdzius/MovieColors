# MovieColors

## Question:
Can you predict a movie's genre(s) based on the hues and saturation levels of the frames?

## Description:
When you think of a sterotypical movie of a given genre, certain themes may come to mind. A horror movie setting is probably dark and gloomy. A western is typically set in a desert/arid environment. Action movies are going to be filled with fast-moving fight scenes or explosions. Science Fiction movies often take place in space. From this, it seems like certain movies/genres may have similar themes: a horror movie may generally have darker colors (deeper saturation), and a western may have lighter and redder tones. If you open up each frame of a movie and record the average color (hue & saturation), can one take that information and predict the movie's genre(s)?

This is based on the idea of Charlie Clark's [The Colors of Motion](https://thecolorsofmotion.com/). However, I am using my own code and movie database, and not utilizing his work.

## Project Details:
I will be utilizing my own extensive movie database that I have recently digitzed.

### Project Steps:
1. Create a database of the movie metadata, including: 
    - Movie Name
    - Release Year
    - Director
    - Genre
    - Sub-genre (1)
    - Sub-genre (2)
    - Runtime
2. Collect and clean the data
    - Open each movie file, open each frame and record the hue and saturation levels
    - Store these levels with the database above.
    - The runtime / number of frames will need to be normalized across all movies in order to properly compare.
3. Explore and analyze the data
    - Explore the similarities of genres and subgenres
    - Explore the similarities of directors
    - Create a list of trilogies, and explore any similarities within a trilogy and between other trilogy sequences.
4. Create a predictive model
5. Create a Visualization
    - Allow a user to select a movie/movies and a genre/genres and compare the average color bands, providing a value for how close it matches.
    - Allow a user to randomize or modify a color band, and give a determination on which genre(s) that would best match.

### Initial Concerns:
- A lot of processing is required. A 2-hour movie (7,200 seconds * 24 frames per second) will have around 172,800 frames. Each frame needs to be opened, calculate the average values, and closed. This could take an incredible amount of time to complete.
- Movie runtimes all vary and trying to compress the data into a normalized runtime may be difficult.
- My database of movies is composed of qualities from 480p (SD) to 2160p (4k). The higher the quality, the more pixels, the more processing will be required.
- Most movies are 24 frames per second (FPS). But some may be 30, 60 or even 120. Obviously the higher FPS, the more frames that will be required to process.
