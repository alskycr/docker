# -----------------------------------------------
# **8. Tagging and Pushing Docker Images to Azure Container Registry (ACR)**
# -----------------------------------------------
# 
# **Overview**
# Once we have deployed the Azure Container Registry (ACR) and built our Docker images,
# we need to **tag** and **push** them to the ACR. This allows the images to be stored in 
# the private registry, making them accessible for deployment in Azure services like 
# Kubernetes, Azure Container Instances, and other container-based workloads.
#
# **Why Tag and Push?**
# - **Tagging** associates an image with a specific repository and version inside ACR.
# - **Pushing** uploads the image from our local machine to the ACR, making it available
#   for use in cloud environments.
#
# **Prerequisites**
# - A deployed **Azure Container Registry (ACR)**.
# - A locally built Docker image that needs to be stored in ACR.
# - **Azure CLI** installed and authenticated.
# -----------------------------------------------

# **Step 1: Login to Azure Container Registry**
# This authenticates our machine with the ACR, allowing us to push images.
az acr login --name dockertutorialacr123

# **Step 2: Verify the ACR Connection**
# Lists all repositories inside the registry to confirm successful login.
az acr repository list --name dockertutorialacr123 --output table

# **Step 3: Tag the Docker Image**
# The format for tagging an image to ACR:
# docker tag <local-image-name> <acr-name>.azurecr.io/<repository-name>:<tag>
# Example:
docker tag my_docker_image dockertutorialacr123.azurecr.io/my_docker_image:latest

# **Step 4: Verify the Image is Tagged Correctly**
# Lists Docker images on the local machine and filters for ACR-tagged images.
docker images | Where-Object { $_.Repository -like "dockertutorialacr123.azurecr.io/*" }

# **Step 5: Push the Tagged Image to ACR**
# This uploads the image to our private Azure Container Registry.
docker push dockertutorialacr123.azurecr.io/my_docker_image:latest

# **Step 6: Verify Image is Successfully Uploaded**
# Lists all images stored in the ACR.
az acr repository show-tags --name dockertutorialacr123 --repository my_docker_image --output table

# -----------------------------------------------
# **Summary of Process**
# 1. **Login to ACR** → Authenticate with Azure CLI.
# 2. **Check ACR Access** → Ensure we can list repositories.
# 3. **Tag Image** → Assign the correct registry name and version.
# 4. **Verify Tagging** → Confirm local image tagging is correct.
# 5. **Push Image** → Upload the image to ACR.
# 6. **Confirm Upload** → List available tags in ACR to ensure success.
# -----------------------------------------------

# **Next Steps**
# - Once pushed, the image can be pulled and used in Azure Kubernetes Service (AKS),
#   Azure Container Instances (ACI), or App Services.
# - Example of pulling the image from ACR:
#   docker pull dockertutorialacr123.azurecr.io/my_docker_image:latest
#
# This completes the process of tagging and pushing Docker images to ACR.
