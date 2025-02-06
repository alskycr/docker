# Does exactly the same job as Dockerfile

# Pull the latest Ubuntu image
docker pull ubuntu:latest

# Create a container and keep it running
docker run --name ubuntu-terraform -d ubuntu:latest sleep infinity

# Install dependencies and Terraform inside the container
docker exec ubuntu-terraform bash -c "apt update && apt install -y wget unzip"
docker exec ubuntu-terraform bash -c "wget -O /terraform.zip https://releases.hashicorp.com/terraform/1.6.0/terraform_1.6.0_linux_amd64.zip"
docker exec ubuntu-terraform bash -c "unzip /terraform.zip -d /usr/local/bin/"
docker exec ubuntu-terraform bash -c "rm /terraform.zip"
docker exec ubuntu-terraform bash -c "mkdir -p /opt/mydir"
docker exec ubuntu-terraform bash -c "echo 'this is a change, saved to the container' > /opt/mydir/testfile.txt"

# Copy the entrypoint script into the container and make it executable
docker cp entrypoint.sh ubuntu-terraform:/opt/mydir/entrypoint.sh
docker exec ubuntu-terraform bash -c "chmod +x /opt/mydir/entrypoint.sh"

# Commit the changes to create a new image with the correct entrypoint
docker commit --change "WORKDIR /opt/mydir" --change "ENTRYPOINT [\"/opt/mydir/entrypoint.sh\"]" ubuntu-terraform ubuntu-terraform-image-pwsh

# Remove the temporary container
docker rm -f ubuntu-terraform

# Run a new container from the modified image
docker run --rm -it --name terraform-container-pwsh ubuntu-terraform-image-pwsh /bin/bash

# This script can be executed like any other powershell script .\Dockerfile.ps1
# it will perform exactly the same steps as found within the Dockerfile however appred the image name wth pwsh so we know its been generated with this powershell script.