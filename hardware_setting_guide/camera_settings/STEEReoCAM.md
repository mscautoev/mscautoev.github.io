
# STEEReoCAM

  

STEEReoCAM is a Stereo Vision camera for NVIDIA® Jetson TX2/AGX Xavier platform from e-con Systems, a leading Embedded Product Design Services company which specializes in the advanced camera solutions. It is based on OV2311 - global shutter monochrome image sensor from OmniVision.

  
  

## Getting Started

  

Prerequisities:

- Host PC with 18.04 (64-bit) to flash the binaries in Jetson TX2/AGX Xavier development kit.

- Jetpack version 4.2.2 (Strongly recommand), if you have some trouble in Jetpack version, see (optional).

  

  
---
### Driver installation

  

Download the release package in [e-CAM20_Stereo_CUMI2311_TX2_JETSON_L4T32.2.1_20-NOV-2019_R01.tar.gz](https://developer.e-consystems.com/Downloads?key=%2FNFuH5utEk1wl66zKXGpeorAyfT92svSC0APPC49AvKds0FJ4uG9llnXgyBiMjrjFlwZ%2BMzmUIlZNqqU5xNa5E4CsiJg0eThkjboYODYCiDo18Xe%2BQBKeni45cynunEScxrxERLqOeTvmnR8ML7IaukaYTv5fqZTo8zG%2FL4xW%2FUuDd77ZtGFu2KkIvVtWFX8qdJ%2F0JnaeoSlCWHn7gF3QuZOj99cIp5M%2BBvSYS9jvZzMLm22s61Y77ujzjZOiHwndiL4ZfgY4bPdRHmjF5nwy%2BJeAoGMer4%2Bt6VQOtqN7bU%3D"), and copy that into the home directory of the Jetson Xavier.

- Extract the release package in the Jetson Xavier to obtain the binaries.

```
$ tar -xampf e-CAM20_Stereo_CUMI2311_TX2_JETSON_<L4T_Version>_<release_date>_<release_version>.tar.gz
$ cd e- CAM20_Stereo_CUMI2311_TX2_JETSON_<L4T_Version>_<releas e_date>_<release_version>
```

- Run the following commands to install the binaries.

```
$ sudo chmod a+x ./install_binaries_<version>.sh
$ sudo ./install_binaries_<version>.sh
```

This script will reboot the Jetson Xavier automatically after installing the binaries successfully.

- Run the following command to check if the driver has been installed successfully.

```
$ ls /dev/video*
```

The output message appears as shown below.

```
video0
```

---

### Installing TaraXL SDK

  

This section describes the steps to install SDK on Jetson Xavier.

>The release package contains accelerated SDK binary that can run on NVIDIA® TX2 board. Before installing SDK, please check whether CUDA is installed.

  

Run the following command to confirm whether CUDA framework is available in your device.
`#nvcc -V`

The steps to install SDK on NVIDIA Jetson Xavier are as follows:
1. Download the [STEEReoCAM_TaraXL_SDK_xxx_Jetson.tar](https://developer.e-consystems.com/Downloads?key=%2FNFuH5utEk1wl66zKXGpeoTVGhp%2F8zKT90Fgw%2FyOOufcAiZX%2FwS9yfYjw3JmD2UZjHxO2UmBsc%2BMUqfMCtiOewKsUecGhHoM348lJS5hgMAvr%2BYBGYdcMrReAllibRiwyazbJqDm%2BIO5mARJBQho2N0muE8YL0JxmsQsg5S2mHxsBV%2BSQ5gZ621YkGcYM9gJ9ax%2BD8mvA6br3LM91HG7eBfRm%2FPq%2F%2FC5zDq%2BYHFydYdLDJYM%2FsSnddA3HUXyVk91XspHuoFVaCgXbVWY3f2viN920S89tCavSnj3rjDPttg%3D) on your Jetson kit.
2. Extract that file to a suitable location.
3. Go to location of the extracted package, and run the following command with execute permissions on this file, before running the Makefile. Running this command will install all the necessary dependencies to develop applications with TaraXL camera and the accelerated SDK.
	```
	$ sudo ./configure.sh
	```
	
4.  Run the following commands to install the built libraries into a specific path **/usr/local/taraxl-skd** and add that path to the required configuration files.
	```
	$ sudo make
	$ sudo make install
	```
5. Run the following command to reload the shell for using the modified encironment variables.
	```
	$ source ~/.bashrc
	```

  
---
### (Optional) How to flash old version of Jetpack

  

In order to flash Jetpack 4.2.2 on your Xavier, you should follow as below.

  

- Step 1. Install SDK mannager on your host PC. Download [sdkmanager_1.3.0-7105](https://developer.nvidia.com/sdkmanager-130-7105-amd64  "sdkmanager-1.3.0-7105") and install.

> sudo apt install ./sdkmanager_1.3.0-7105_amd64.deb

- Step 2. After installing the SDK manager in yout host PC, follow the instructions in the link below to run the SDK manager and flash the Jetson kit with Jetpack 4.2.2.

https://docs.nvidia.com/sdk-manager/install-with-sdkm-jetson/index.html

However, if Jetpack 4.2.2 does not appear in your SDK manager, open your terminal and command as below.

> sdkmanager --archivedversions

  
  
  
  ---


## ROS extensions

  

The TaraXL - See3CAM_StereoA is a UVC compliant USB 3.0 SuperSpeed Stereo vision camera from e-con Systems, a leading embedded Product Design Services company which specializes in the advanced camera solutions.

  

---
### Getting started

Prerequisites
-   Ubuntu 18.04
-   [TARAXL SDK 3.2.2](https://developer.e-consystems.com/)  and its dependency  [CUDA](https://developer.nvidia.com/cuda-downloads)
-   [ROS Melodic](http://wiki.ros.org/melodic/Installation/Ubuntu)

---
### Build the program

The taraxl-ros-package is a catkin package. It depends on the following ROS packages:

-   roscpp
-   rosconsole
-   sensor_msgs
-   stereo_msgs
-   image_transport
-   dynamic_reconfigure

Open a terminal and build the package:

```
cd ~/catkin/src
git clone https://github.com/econsystems/taraxl-ros-package
git clone https://github.com/econsystems/vision_opencv.git
cd ~/catkin
catkin_make
source ./devel/setup.bash
```

For more information, please follow up the below wiki page

[http://wiki.ros.org/taraxl-ros-package](http://wiki.ros.org/taraxl-ros-package)

---
### Published Topics

```
/taraxl/left/image_rect - Rectified left image
/taraxl/right/image_rect - Rectified right image
/taraxl/left/image_raw - Unrectified left image
/taraxl/right/image_raw - Unrectified right image 
/taraxl/stereo/disparity/image - Disparity image
/taraxl/depth/image - Depth image 
/taraxl/stereo/pointcloud - pointcloud
/taraxl/imu/data_raw - Raw IMU data - linear acceleration and angular velocity
/taraxl/imu/inclination - IMU inclination data w.r.t 3 axes x,y and z
/taraxl/left/calib/raw - Calibration informations for unrectified left image
/taraxl/right/calib/raw - Calibration informations for unrectified right image
/taraxl/left/calib/rect - Calibration informations for rectified left image
/taraxl/right/calib/rect - Calibration informations for rectified right image
```
---

### Dynamic Reconfiguration Settings for TaraXL

```
 brightness : Controls brightness of the image (1-7)
 exposure : Manual exposure value (10-1000000)
 accuracy : Accuracy of the disparity image (0 - HIGH FRAME RATE, 1 - HIGH ACCURACY, 2 - ULTRA ACCURACY) 
 autoExposure : Enable auto exposure 
 pointcloudQuality : Quality of pointcloud(1 - HIGHEST, 2 - MEDIUM, 3 - STANDARD) 
```
---

### Dynamic Reconfiguration Settings for STEEReoCam

```
 brightness : Controls brightness of the image (1-10 - Works only when auto exposure is enabled) 
 exposure : Manual exposure value (1-7500)
 accuracy : Accuracy of the disparity image (0 - HIGH FRAME RATE, 1 - HIGH ACCURACY, 2 - ULTRA ACCURACY) 
 autoExposure : Enable auto exposure 
 gain : Controls the gain of the camera(1-240) 
 pointcloudQuality : Quality of pointcloud(1 - HIGHEST, 2 - MEDIUM, 3 - STANDARD) 
```
---

### Test Package

Open a terminal and enter the following command :

```
 roslaunch taraxl_ros_package taraxl.launch
```

To visualize TaraXL/STEEReoCAM image topics

```
rqt_image_view
```

To visualize TaraXL/STEEReoCAM dispariy image topic

```
rosrun image_view disparity_view image:=/taraxl/stereo/disparity/image
```

To visualize TaraXL/STEEReoCAM pointcloud topic

```
rosrun rviz rviz
```

To view imu data

```
rostopic echo /taraxl/imu/data_raw
rostopic echo /taraxl/imu/inclination
```

To view calibration parameters for unrectified Frames

```
rostopic echo /taraxl/left/calib/raw 
rostopic echo /taraxl/right/calib/raw 
```

To view calibration parameters for rectified Frames

```
rostopic echo /taraxl/left/calib/rect
rostopic echo /taraxl/right/calib/rect 
```

Dynamic reconfiguration

```
rosrun rqt_reconfigure rqt_reconfigure
```

Last modified: 06/04/21. Edited by Minsu Cho (chominsu3998@kaist.ac.kr).