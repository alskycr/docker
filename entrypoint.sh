#!/bin/bash
# -----------------------------
# **ENTRYPOINT SCRIPT GUIDE**
# -----------------------------
# This script is designed to be used as an entrypoint for a Docker container.
# It simply executes an interactive shell (`$SHELL`) when the container starts.

# **1. Naming the File**
# The script must be named `entrypoint.sh`, or another name can be used as long as
# it matches the ENTRYPOINT instruction in the Dockerfile.

# **2. File Permissions**
# Before using this script, you must make it executable. Otherwise, the container will fail to run it.
# To do this, use the following command:
# chmod +x entrypoint.sh

# **3. Script Behavior**
# `exec "$SHELL"`:
# - `exec` replaces the current process with a new one (`$SHELL`).
# - `$SHELL` represents the default shell (usually `/bin/bash` or `/bin/sh`).
# - This ensures that when the container starts, an interactive shell is available.

# **4. Using in a Dockerfile**
# To use this script as the entrypoint in a Docker container:
# - Copy it into the container: `docker cp entrypoint.sh <container_id>:/path/to/entrypoint.sh`
# - Set it as the entrypoint in the Dockerfile:
#
#   ```dockerfile
#   COPY entrypoint.sh /opt/mydir/entrypoint.sh
#   RUN chmod +x /opt/mydir/entrypoint.sh
#   ENTRYPOINT ["/opt/mydir/entrypoint.sh"]
#   ```
#
# - When the container starts, it will execute this script, launching an interactive shell.

# **5. Running the Container**
# After building the Docker image with the script as the entrypoint, run it using:
# docker run -it --rm my_terraform_image
#
# This will start the container and drop you into a shell session.

# -----------------------------
# **START OF SCRIPT**
# -----------------------------

exec "$SHELL"

# -----------------------------
# **END OF SCRIPT**
# -----------------------------
