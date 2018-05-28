INFO
------------
It is an extension for [TestIt toolkit](https://github.com/GertKanter/testit) which allows to test autonomous platform navigating in the confined area.<br/>
It also includes turtlebot example of how TestIt toolkit can be used.

SETUP
-----------
First, one has to check if [Docker](https://www.docker.com/) has been installed. Then you need to save instructions from docker directories with names “Dockerfile” and type “File”. You can either download it here (https://github.com/arturgummel/dtrontestit) or clone the repository. 

Finally, build the Testit base image by typing:<br/>
`$ docker build –no-cache -t testit:latest .` <br/>

To build SUT and testing images type next commands: <br/>
`$ docker build --no-cache -t testit_tb_sut .`<br/>
`$ docker build --no-cache -t testit_tb_testit .`<br/>

Executing the example
-----------
After a successful installation run TestIt base image with Docker:<br/>
`$ docker run --name testit -v /var/run/docker.sock:/var/run/docker.sock -it testit bash`<br/>
It is necessary to mount Docker socket to run Docker commands inside the container.

Navigate to the “catkin_ws” directory and source files:<br/>
`$ cd /catkin_ws`<br/>
`$ source devel/setup.bash`

To start TestIt daemon, type next command:<br/>
`$ roslaunch dtron turtlebot.launch`

The file for navigation with simple *move_base* action server is specified by default. But it can be changed by passing the path to the configuration file in the parameter.

For example, if we want to test topological navigation:<br/>
`$ roslaunch dtron turtlebot.launch config:=/catkin_ws/src/testit/dtron/turtlebot/cfg/config_top_nav.yaml`

To set the state and to bring up open new terminal and type:<br/>
`$ rosrun testit testit_command.py bringup`

And finally, to start the test type:<br/>
`$ rosrun testit testit_command.py test`

It is possible to monitor what happens in containers by passing the container identifier to the parameter:

`$ docker attach CONTAINER-ID`

Executing the Stage example
-----------
Navigate to the “catkin_ws” directory and source files:<br/>
`$ cd /catkin_ws`<br/>
`$ source devel/setup.bash`

To start TestIt daemon, type next command:<br/>
`$ roslaunch dtron turtlebot.launch config:=/catkin_ws/src/testit/dtron/turtlebot/cfg/config_stage.yaml`<br/>

To set the state and to bring up open new terminal and type:<br/>
`$ rosrun testit testit_command.py bringup`

And finally, to start the test type:<br/>
`$ rosrun testit testit_command.py test`
