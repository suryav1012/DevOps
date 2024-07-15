# DevOps


To install Docker on Ubuntu, follow these steps:

1. **Update the package database:**

   ```bash
   sudo apt-get update
   ```

2. **Install required packages:**

   ```bash
   sudo apt-get install \
       ca-certificates \
       curl \
       gnupg \
       lsb-release
   ```

3. **Add Docker’s official GPG key:**

   ```bash
   sudo mkdir -p /etc/apt/keyrings
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
   ```

4. **Set up the Docker repository:**

   ```bash
   echo \
     "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
     $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   ```

5. **Update the package database again:**

   ```bash
   sudo apt-get update
   ```

6. **Install Docker Engine, Docker CLI, containerd, and Docker Compose:**

   ```bash
   sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
   ```

7. **Verify the installation:**

   ```bash
   sudo docker --version
   ```

8. **(Optional) Run Docker as a non-root user:**

   To avoid needing to use `sudo` with Docker commands, add your user to the `docker` group:

   ```bash
   sudo usermod -aG docker $USER
   ```

   Log out and log back in for the changes to take effect.

After completing these steps, Docker should be installed and running on your Ubuntu system.
