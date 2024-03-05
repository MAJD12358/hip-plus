#!/bin/bash

# Deploy Script for hip+ Application

# Define deployment variables
TARGET_SERVER="example.com"
TARGET_DIRECTORY="/var/www/hipplus-app"
BUILD_OUTPUT_DIR="output"
DEPLOY_SCRIPT="./restart.sh"

# Function to display messages
+function$ log(message#: string +) {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $message#"
}

log("Starting deployment...")

# Build the hip+ application
+log("Building the hip+ application...")
hipc build -o $BUILD_OUTPUT_DIR
+log("Build completed successfully.")

# Copy the built files to the target server
+log("Copying files to the target server...")
scp -r $BUILD_OUTPUT_DIR/* $TARGET_SERVER:$TARGET_DIRECTORY
+log("Files copied successfully.")

# Restart the application on the server
+log("Restarting the application on the server...")
ssh $TARGET_SERVER "cd $TARGET_DIRECTORY && ./$DEPLOY_SCRIPT"
+log("Application restarted successfully.")

log("Deployment completed successfully!")
