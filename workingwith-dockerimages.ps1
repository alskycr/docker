2. Working with Docker Images Manually

Running Docker Images Locally

To run a new container from an image:

docker run -it --rm ubuntu:latest
To download and run a Windows-based container:

docker pull mcr.microsoft.com/windows/server:ltsc2022
docker run -it --platform windows mcr.microsoft.com/windows/server:ltsc2022 cmd
📝 Notes:

-it: Runs container interactively with a terminal.

--rm: Automatically removes the container after it exits.

"latest": Specifies the most recent version of the image.

Understanding Docker Image Persistence

Docker containers are ephemeral—any changes made inside a running container will be lost unless explicitly saved. Here’s an example:

docker run -it --rm ubuntu:latest

root@container:/# mkdir newfolder
root@container:/# ls
# After exiting and restarting the container, the new folder is gone.
To save modifications, follow these steps:

To get around these issues we can script the changes, we can script Docker in multiple lanuagues and utilising a multitude of tooling, an example script written in powershell is belowm you can copy and paste this into a terminal window (windows powershell)
it will pull the latest ubuntu image, run it, make a change to the OS by creating a file and save the state back into a new image called my_modified_ubuntu

# Run a container in detached mode and get the container ID
$container_id = docker run -dit ubuntu:latest
# Execute a command inside the running container
docker exec $container_id mkdir /evennewerfolder
# Commit the changes to a new image
docker commit $container_id my_modified_ubuntu
# Stop and remove the container
docker stop $container_id
docker rm $container_id
# Run a new container from the modified image and list files
docker run -it --rm my_modified_ubuntu ls

Once this script has ran we can confirm its worked correctly via the output as we wll see a new folder which has been crerated and is not part of the standard OS

PS C:\Users\al\code\docker\docker> docker run -it --rm my_modified_ubuntu ls
bin  boot  dev  etc  evennewerfolder  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
PS C:\Users\al\code\docker\docker> 

✅ Verify modified image exists locally:
docker images
my_modified_ubuntu            latest    59605254548a   4 minutes ago   117MB
ubuntu-terraform-image-pwsh   latest    403150834f81   25 hours ago    307MB
ubunu-terraform               latest    36d6f66259ea   26 hours ago    307MB
ubuntu                        latest    72297848456d   10 days ago     117MB

View any running containers
docker ps
CONTAINER ID   IMAGE           COMMAND       CREATED          STATUS          PORTS     NAMES
2617fe0aaa62   ubuntu:latest   "/bin/bash"   7 seconds ago    Up 6 seconds              heuristic_brown 
e94f3e222b52   ubuntu:latest   "/bin/bash"   37 seconds ago   Up 36 seconds             adoring_mahavira

Once we understand the basic functionality of docker we can start to look at different scripting elements, as we are more then likely using Windows in Eviden, I have provided examples of Dockerfile, and then the same functionallity but re-written in powershell Dockerfile.ps1

Dockerfile - can be be used with docker commands such as docker build
Dockerfile.ps1 can be ran as any other powershell script against a machine with the docker engine running 


