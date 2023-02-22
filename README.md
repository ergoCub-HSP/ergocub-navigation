# ergocub-navigation
Navigation stack for the ErgoCub project
New Docker ready `simonemiche/ergocub_ros2:ecub_first_year_demo` to use `ergoCubGazeboV1`. To run it just change the TAG variable in the `run.sh`

# Run the First Year Demo Docker
To use the demo is enough to execute the `run.sh` script present in this repo (if you are using windows you have to modify the run script to allow the use of gpu)     

If you don't have Docker installed, follow this [link](https://docs.docker.com/get-docker/) on how to install it

## Executing the commands
Once the docker is running, type `terminator` to launch a terminal window.

The docker has aliases for simplify the execution of longer and tedious commands (tip: use TAB to autocomplete the command)

### Simulation Setup
Type in order each one of the following instruction in a separate terminal:
* `0_yarpserver` to launch the yarp server
* `1_clock_export` followed by `2_start_sim_world`: Gazebo will launch with a pre-loaded warehouse world. In Gazebo go to the Insert tab and select the stickBot robot and place it in the simulated world.
* `3_reset_offsets` to open the rpc port and type in `resetOffset all` (use TAB for autocomplete)
* `ports_merge_yarp` for merging the ports needed by the navigation stack in a single one
* `4_walking_mod` will launch the walking controller
* `5_walking_coordinator`to open the RPC port for interfacing with walking controller. Type the following two commands (in order):
  ```
  >> prepareRobot
  >> startWalking
  ```
### Navigation Stack Setup
## ergoCubGazeboV1 -> from image tag `ecub_first_year_demo` (default)
Type in order each one of the following instruction in a separate terminal:

* `launch_localization_setup` starts the map server and AMCL.
* `launch_robot_setup` starts Rviz and necessary ros2 nodes for scan filtering, odometry, TFs and frame projection.
* `launch_planner_trigger` for synchronizing the nav2 stack BT with the walking-controller.
* `launch_navigation` launches the rest of the nav2 stack, with the global planner, costmaps and BT navigator
* `launch_talker` is the node that transforms and converts the global path to the walking-controller.
* (optional) `ros2 launch ergoCub_ros2 footprints_viewer.launch.py` for viewing the planned footprints on RViz.

## Stickbot Setup -> from image tag `first_year_demo`
IMPORTANT: you have to source the proper ros2 workspaces for EACH terminal. Type the commands `ros2_setup` and `nav2_setup`.
Type in order each one of the following instruction in a separate terminal with the commands `ros2_setup` and `nav2_setup`:
* `ros2 launch ergoCub_ros2 setup_localization.launch.py` starts the map server and AMCL.
* `ros2 launch ergoCub_ros2 setup_robot.launch.py` starts Rviz and necessary ros2 nodes for scan filtering, odometry, TFs and frame projection.
* `ros2 run ergoCub_ros2 planner_trigger_server` for synchronizing the nav2 stack BT with the walking-controller.
* `ros2 launch ergoCub_ros2 nav2_stack.launch.py` launches the rest of the nav2 stack, with the global planner, costmaps and BT navigator
* `ros2 run ergoCub_ros2 async_walking_controller_talker` is the node that transforms and converts the global path to the walking-controller.

## Use the Navigation Stack
Once all the previous commands have been successfully launched, you'll face RViz interface
![Screenshot from 2023-02-22 18-28-29](https://user-images.githubusercontent.com/86918431/220708393-9714f04c-4bd0-4ab9-9bc1-f3fd8ffade80.png)

Then select the button ![Screenshot from 2023-02-22 18-30-32](https://user-images.githubusercontent.com/86918431/220708895-2224bb3b-e04e-4700-887b-adee79572faf.png) to set the initial position of the robot and click on the position on the map.
You will see the initialization of AMCL with the green particle swarm around the robot.

![Screenshot from 2023-02-22 18-31-35](https://user-images.githubusercontent.com/86918431/220709132-d0c03cce-b0ac-4066-9a85-fc9dd37b1a3c.png)

To navigate, select the button ![Screenshot from 2023-02-22 18-30-46](https://user-images.githubusercontent.com/86918431/220709487-d8178780-fb66-452f-902f-f8850e2dfddb.png) and then the goal pose that you want on the map.

