# Use the official Webots image as a base
FROM cyberbotics/webots:latest

# Set up environment variables for graphics
ENV DISPLAY=:0
ENV QT_X11_NO_MITSHM=1

# Create a working directory
WORKDIR /usr/src/app

# Copy your project files into the container
COPY . .

# Compile the controller (since it's C code)
RUN cd controllers/ure_can_grasper && make

# Command to run Webots in "headless" or "minimally graphical" mode
# --stdout and --stderr help see logs in the docker terminal
ENTRYPOINT ["webots", "--batch", "--mode=fast", "--stdout", "--stderr", "worlds/ure.wbt"]