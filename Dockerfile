
# docker build --build-arg RAS_GH_KEY=${RAS_GH_KEY} . -t mainframe:latest

# Use the official ROS 2 Iron image as the base image
FROM ros:iron-ros-base

ARG RAS_GH_KEY="default"

# Set the environment variable to later allow gh access
#ENV RAS_GH_KEY = $RAS_GH_KEY

# Install additional packages
RUN apt-get update && apt-get install -y \
    net-tools \
    iputils-ping \
    ros-iron-xacro \
    gh 


# Copy the ras_github token ($RAS_GH_KEY on host) into the container as mytoken.txt

RUN git clone https://ras-delft-user:${RAS_GH_KEY}@github.com/RAS-Delft/USV_formation_control_1 

# Copy the boid_ros_pkg directory into container ros2_ws/src
#COPY boid_ros_pkg/. /ros2_ws/src/boid_ros_pkg

# Copy entrypoint.sh into container and make it executable
#COPY boid/entrypoint.sh /entrypoint.sh
#RUN chmod +x /entrypoint.sh

# 

# Build the workspace
RUN . /opt/ros/iron/setup.sh 
    # && \
    #cd /ros2_ws && \
    #colcon build

# Source ros when accessed via bash: (e.g. through `docker exec -it boid_1 /bin/bash`)
#RUN echo ". /entrypoint.sh" >> /root/.bashrc

# Set tasks to be run upon container startup
CMD echo "ROS 2 container has been started"
    #. /entrypoint.sh && \
    #ros2 launch boid_ros_pkg single_boid.launch.py boid_name:=${BOID_NAME}