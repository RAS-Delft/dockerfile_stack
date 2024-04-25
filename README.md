# dockerfile_stack
Common dockerfiles that are used on our robotic vessels made accessible

Terminal1
```
git clone --branch deployment_test1 https://github.com/RAS-Delft/dockerfile_stack.git && \
docker build dockerfile_stack/test1 --tag turtleboat1:latest && \
docker run turtleboat1:latest
```


Terminal2
```
export ROS_DOMAIN_ID=69
ros2 topic list
```

To stop the container:
```
docker stop $(docker ps --filter ancestor=turtleboat1 --format="{{.ID}}")
```
