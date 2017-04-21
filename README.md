## NIOT-E-TIJCX-GB-RE
### netIOT Edge gateway for Automation networks as Docker host

netIOT Edge devices from Hilscher securely connect automation networks with cloud or IoT directed application. On the OT network side they are in cyclic I/O data exchange with a PLC while communicating with IoT-capable field devices directly at the same time over IOT protocols such as MQTT or OPC UA. On the IT network side they exchange those key field data with intelligent higher-level applications of cyber-physical systems and M2M solutions.

The Edge Gateway NIOT-E-TIJCX-GB-RE comes with support out of the box for using Docker as a host. This feature enables gateway users to expand the range of default functions with their own dockerized applications. 

### The image

The image provided hereunder is an example of how to use the gateway's display port for own applications.

#### Debian OS

The base for the image root filesystem is the [Debian OS](https://hub.docker.com/_/debian/) derivative jessie.

#### Display server X.org

The gateway's host Linux OS is of type headless and has no display server installed by default. 

This is why the image comes with a display server [X.org](https://en.wikipedia.org/wiki/X.Org_Server).

#### Desktop environment Xfce

On top of the display server the desktop environment [Xfce](https://www.xfce.org/?lang=en) is used in this image as example.

### Container prerequisites
#### Host devices

The display server needs access to the following gateway's host devices:
 * console tty0 
 * console tty2 
 * frame buffer fb0
 * inputs such as mouse/keyboard

### Container start

Pulling the image from Docker Hub may take up to 5 minutes average. 

#### On NIOT-E-TIJCX-GB-RE

STEP 1. Open NIOT-E-TIJCX-GB-RE's landing page under `https://<gateways's ip address>`. 

STEP 2. Click the Docker tile to open the [Portainer.io](http://portainer.io/) Docker management user interface. 

STEP 3. Enter the following parameters under **Containers > Add Container**

* **Image**: `hilschernetiotedge/netiot-edge-desktop-dvi`

* **Restart policy"**: `always`

* **Runtime > Devices > add device**: `Host "/dev/tty0" -> Container "/dev/tty0"`and`Host "/dev/tty2" -> Container "/dev/tty2"`and`Host "/dev/fb0" -> Container "/dev/fb0"`and`Host "/dev/input" -> Container "/dev/input"`

STEP 4. Press the button **Actions > Start container**

### GitHub sources
The image is built from the GitHub project [netIOT-Edge-desktop-dvi](https://github.com/hilschernetiotedge/netIOT-Edge-desktop-dvi). It complies with the [Dockerfile](https://docs.docker.com/engine/reference/builder/) method to build a Docker image [automated](https://docs.docker.com/docker-hub/builds/). 


### References:

* https://github.com/hilschernetiotedge/netIOT-Edge-desktop-dvi
* https://docs.docker.com/engine/reference/builder/
* http://portainer.io/
* https://hub.docker.com/_/debian
* https://en.wikipedia.org/wiki/X.Org_Server
* https://www.xfce.org/?lang=en
* https://docs.docker.com/docker-hub/builds/
    
[![N|Solid](http://www.hilscher.com/fileadmin/templates/doctima_2013/resources/Images/logo_hilscher.png)](http://www.hilscher.com)  Hilscher Gesellschaft für Systemautomation mbH  www.hilscher.com

