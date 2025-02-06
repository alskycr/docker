# docker

# **How to Use This Tutorial**

## **Overview**
This tutorial guides you through **installing, configuring, and using Docker, Terraform, and Azure Container Registry (ACR)**. By following the steps in this guide, you will learn how to:
- Install **Docker, Terraform, and Azure CLI** on Windows and Linux.
- Create and manage **Docker containers**.
- Modify and save **Docker images**.
- Deploy **Azure Container Registry (ACR) with Terraform**.
- Tag and push **Docker images** to ACR.
- Set up an **entrypoint script** for container automation.
- Use **essential Docker and Terraform commands**.

This tutorial assumes you have **basic command-line experience** and an **active Azure account**.

---

## **1. Install Required Tools**
Before starting, you need to install **Docker, Terraform, and Azure CLI**. The tutorial provides **Windows PowerShell and Linux commands** to set up these tools. 

### **Steps**
- If you are using **Windows**, run the `windowscomponents.ps1` script as an administrator.
- If you are using **Linux**, execute the provided installation commands.

📌 **Verify installations before proceeding:**
- Run `docker --version`, `terraform --version`, and `az --version` to confirm everything is installed.

---

## **2. Running Docker Containers**
After installing Docker, you will learn how to start containers:
- Run a **Ubuntu container** interactively.
- Run a **Windows Server container** (if using Windows).

📌 **Key Concepts:**
- **Containers are temporary** unless explicitly saved.
- The `docker run` command launches a container.
- The `--rm` flag automatically deletes the container when it stops.

---

## **3. Persisting Changes in Docker Images**
By default, any changes inside a container are lost when it stops. This section teaches you how to:
1. Start a container.
2. Modify the file system inside the container.
3. Save the changes by committing a new Docker image.
4. Restart the modified container.

📌 **This ensures that the modified environment is reusable.**

---

## **4. Deploying Azure Container Registry (ACR) with Terraform**
You will now set up an **Azure Container Registry (ACR)** to store Docker images in the cloud.

### **Steps**
1. Save the provided Terraform code as `acr.tf`.
2. Run:
   ```
   terraform init
   terraform apply
   ```
3. Verify deployment with:
   ```
   az acr list --output table
   ```

📌 **This creates an ACR in Azure, which will store and manage your container images.**

---

## **5. Building and Running Docker Images**
The tutorial includes a **Dockerfile** to automate container setup. You will:
- Use `docker build` to create a custom image.
- Use `docker run` to launch a container from the image.

📌 **This step ensures you have a reproducible environment for your containers.**

---

## **6. Tagging and Pushing Docker Images to ACR**
Once your **ACR is deployed and Docker images are built**, you need to:
1. **Log in to ACR**: `az acr login --name <acr-name>`
2. **Tag your image**: `docker tag my_docker_image <acr-name>.azurecr.io/my_docker_image:latest`
3. **Push the image to ACR**: `docker push <acr-name>.azurecr.io/my_docker_image:latest`
4. **Verify the upload**: `az acr repository show-tags --name <acr-name> --repository my_docker_image --output table`

📌 **This uploads your Docker image to ACR, making it available for deployment.**

---

## **7. Setting Up an Entrypoint Script**
The tutorial includes `entrypoint.sh`, which runs automatically when the container starts.

### **Steps**
1. Save the script as `entrypoint.sh`.
2. Make it executable with:  
   ```
   chmod +x entrypoint.sh
   ```
3. Set it as the container entrypoint.

📌 **This allows your container to start with predefined behavior.**

---

## **8. Quick Reference Commands**
This tutorial provides essential **Docker and Terraform commands** to help you manage your environment.

### **Docker**
- List running containers: `docker ps`
- Build an image: `docker build -t myimage .`
- Run a container: `docker run -it myimage`
- Stop a container: `docker stop <container_id>`
- Remove an image: `docker rmi <image_id>`
- Clean up: `docker system prune -a`

### **Terraform**
- Initialize Terraform: `terraform init`
- Plan changes: `terraform plan`
- Deploy: `terraform apply`
- Destroy resources: `terraform destroy`

---

## **Final Notes**
- Follow the tutorial **step by step** to ensure a smooth setup.
- All commands are **provided in the guide**, and each step **builds on the previous one**.
- The goal is to give you a **fully functional Docker environment** that integrates with **Azure Container Registry**.

By the end of this tutorial, you will have a **repeatable and scalable containerized workflow** using Docker, Terraform, and Azure.
