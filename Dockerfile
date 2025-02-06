# Does exactly the same job as Dockerfile.ps1

# Use the latest Ubuntu image
FROM ubuntu:latest

# Install dependencies & Terraform
RUN apt update && apt install -y wget unzip \ 
    && wget -O terraform.zip https://releases.hashicorp.com/terraform/1.6.0/terraform_1.6.0_linux_amd64.zip \ 
    && unzip terraform.zip && mv terraform /usr/local/bin/ \ 
    && rm terraform.zip && mkdir -p /opt/mydir \ 
    && echo "Container Setup Complete" > /opt/mydir/testfile.txt

# Set working directory
WORKDIR /opt/mydir

# Define entrypoint
ENTRYPOINT ["/bin/bash"]

# To execure this build scripts we use the docker command like with the examples written below
# # Build the image
# docker build -t my_terraform_image -f Dockerfile .

# # Run the container
# docker run -it --rm my_terraform_image

# By the time this script has been ran, it will hae downloaded the latest ubuntu image, installed terraform, written a change to the file system, saved the state of te image into a new Docker image version with the name provided in the script.

