#!/bin/bash

# Create sounds directory if it doesn't exist
mkdir -p assets/sounds

# Download background music (cheerful, kid-friendly loop)
curl -L "https://github.com/opengameart/opengameart/raw/master/audio/background_music.mp3" -o assets/sounds/background_music.mp3

# Download correct sound (positive ding)
curl -L "https://github.com/opengameart/opengameart/raw/master/audio/correct.mp3" -o assets/sounds/correct.mp3

# Download wrong sound (gentle buzz)
curl -L "https://github.com/opengameart/opengameart/raw/master/audio/wrong.mp3" -o assets/sounds/wrong.mp3

# Download level complete sound (celebration)
curl -L "https://github.com/opengameart/opengameart/raw/master/audio/level_complete.mp3" -o assets/sounds/level_complete.mp3

# Download game over sound (gentle ending)
curl -L "https://github.com/opengameart/opengameart/raw/master/audio/game_over.mp3" -o assets/sounds/game_over.mp3

# Make the script executable
chmod +x download_sounds.sh 