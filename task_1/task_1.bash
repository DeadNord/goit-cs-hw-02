#!/bin/bash

# Define an array of website URLs to check for availability
sites=("https://google.com" "https://facebook.com" "https://twitter.com")

# Define the log file name
logfile="task_1/website_status.log"

# Clear the log file before adding new results
> "$logfile"

# Function to check website availability
check_site() {
    status_code=$(curl -L -s -o /dev/null -w "%{http_code}" "$1")
    
    if [ "$status_code" -eq 200 ]; then
        echo "$1 is UP (HTTP Status: $status_code)"
        echo "$1 is UP (HTTP Status: $status_code)" >> "$logfile"
    else
        echo "$1 is DOWN (HTTP Status: $status_code)"
        echo "$1 is DOWN (HTTP Status: $status_code)" >> "$logfile"
    fi
}

# Loop through the sites and check each one
for site in "${sites[@]}"; do
    check_site "$site"
done

# Inform the user that the results have been logged
echo "Results have been logged to $logfile"
