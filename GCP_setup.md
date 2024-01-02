# GCP Setup for remote development

This guide explains how I setup a Google Cloud Platform (GCP) instance running 4 CPUs and 16GB of RAM- i.e. a basic, modest remote instance for development, rather than any kind of Machine Learning (ML) workhorse. I recommend using a gmail which has a free credit on it to start with.

This was used to test & deploy kubernetes-based FastAPI/uvicorn containers that served a simple ML API. The cluster this was Azure-based. 

## Preview of Daily Usage

### Startup process

1. Start GCP Instance from [Google Compute Engine console](https://console.cloud.google.com/compute/instances)
2. Double click a shortcut to fetch the instance's IP address
3. Start
    1. via CMD prompt: `ssh INSTANCE_NAME`
    2. via VS Code: 
        1. Press ctl+shft+p
        2. Select Remote-SSH 
        3. Select your instance

NOW that we've seen where we'll end up (a very simple workflow!), let's see how it gets setup. The setup is not too bad but requires *some* effort:

## Full GCP Setup Process

### Get `gcloud` up and running
1. Setup your GCP project with billing [(see instructions)](https://cloud.google.com/resource-manager/docs/creating-managing-projects)

2. Install `gcloud`, the command line interface (CLI) for interacting with Google's cloud infrastructure ([see instructions](https://cloud.google.com/sdk/docs/install))

    1. run `gcloud version` to confirm that it's installed and working

    2. run `gcloud components update` to make sure everything is up to date

3. Make sure gcloud has you registered correctly, and that your project is set

    - `gcloud auth list` to see who is authorized on your computer. The one with the * next to it is the currently active account. 

        ![gcloud auth list](./imgs/T1-%20google%20auth%20list.png)

    - `gcloud auth login` to login using your browser
    - `gcloud config set account 'your-email@example.com'` to set your account if the correct one is not currently selected
    - `gcloud config set project 'your-project-id'` to set your specific project if the current project is not currently selected


**Your google cloud CLI should now be up, running and ready to create your instance from your own computer's command line!**

### Create the instance

4. Plan your instance characteristics

    1. Here is where all the customization will take place. Your instance needs may be different, so customize your settings accordingly. 

    2. Some major things to watch out for based on my initial attempts: 

        1. Figure out the specs you need. I wanted a 4 CPU, 16GB RAM machine for basic setup of a Kubernetes cluster (not running the cluster, but deploying TO it). 

        2. You'll need to find the combination of (GEOGRAPHY x COMPUTE) that meets your needs. This is more annoying than you might think! 

    3. [This guide](https://cloud.google.com/compute/docs/machine-resource) goes over google compute machine resources. They have different names/categories, like C, N, and E, each meant for different things. In the end, the E2 machine type located in the us-central-1c region worked the best for my needs. 

5. Use `gcloud compute instances create YOUR_INSTANCE_NAME` with all of the arguments you've settled on [(see docs)](https://cloud.google.com/sdk/gcloud/reference/compute/instances/create).

    1. Figure out the arguments you'll need to supply to the `create` command. 

        1. For machine type, you can use `gcloud compute machine-types list` with different options to find the machine type you want. You can filter by geography/region.

        2. For image type you can use `gcloud compute images list` [(see here)](https://cloud.google.com/sdk/gcloud/reference/compute/images/list)

        3. **You can always delete and remake your instance**, so don't worry too much about getting ALL the parameters right the first time.
    
    2. Enter in your command! This was my command in the end after settling on Ubuntu 22.04 with a 160GB boot disk and an E2 instance with 4 CPUs and 16GB of RAM, located in the US Central 1C region:

        ```powershell
        gcloud compute instances create INSTANCE_NAME \
            --image-family=ubuntu-2204-lts \
            --image-project=ubuntu-os-cloud \
            --boot-disk-size=160GB \
            --machine-type=e2-custom-4-16384 \
            --zone=us-central1-c
        ```

### Setup SSH

6. Setup SSH via the gcloud command (run from your own computer): `gcloud compute ssh USER_NAME@INSTANCE_NAME --zone=YOUR_ZONE` [`(see documentation here)`](https://cloud.google.com/sdk/gcloud/reference/compute/ssh)

    1. This creates your ssh key and registers it with your instance.
    
    2. Once this is made, you should be ready.

7. **Automate IP fetching** using PowerShell and a .bat shortcut (this is NOT the absolute best way to do this but it works!):

    1. Save this in your .ssh folder. NOTE: change the INSTANCE_NAME and USER_NAME to fit your setup (and make sure the IdentityFile is in that location). I saved this file as **...\.ssh\updateConfig.ps1**:

        ```powershell
        # Debug: Print 'Fetching IP'
        Write-Host "Fetching IP"

        # Fetch the IP Address from gcloud utility via cmd.exe
        $ip = cmd.exe /c "gcloud compute instances describe INSTANCE_NAME --zone=us-central1-c --format=`"get(networkInterfaces[0].accessConfigs[0].natIP)`""

        # Debug: Print the fetched IP
        Write-Host "Fetched IP: $ip"

        # Create SSH Config Text
        $sshConfig = @"
        Host INSTANCE_NAME
            HostName $ip
            User USER_NAME
            IdentityFile ~/.ssh/google_compute_engine
        "@

        # Debug: Print 'Saving Config'
        Write-Host "Saving Config"

        # Save the SSH Config
        [System.IO.File]::WriteAllLines("$env:USERPROFILE\.ssh\config", $sshConfig, [System.Text.Encoding]::UTF8)

        # Debug: Print 'Config Saved'
        Write-Host "Config Saved"
        ```
    
    2. Make a batch script to run the powershell script (saved as **...\.ssh\RunUpdateSSHConfig.bat**; replace the [PATH_TO_SSH]): 

        ```bat
        powershell -ExecutionPolicy Bypass -File "[PATH_TO_SSH]\updateConfig.ps1"
        ```

    3. Make a shortcut to the batch file & put it on your desktop. 

### Actual Usage (this is your normal workflow for starting)

8. Start Instance from Google Compute Engine console

    1. Select your instance

    2. Press **Start / Resume**

    3. Wait for the instance to have an External IP (refresh a couple times maybe)

9. Run the **RunUpdateSSHConfig.bat** shortcut from above to resolve the IP address of your instance

10. Access via Windows CMD:

    1. ssh INSTANCE_NAME

11. Access via VS Code:

    1. **ctl + shft + p** (command palette)
    
    2. **Remote-SSH: Connect to Host...**

    3. Select **INSTANCE_NAME**

## All Done!

The daily usage is **extremely easy**, and even setting up a new instance is simple once you've settled on the machine type, region, and image.

