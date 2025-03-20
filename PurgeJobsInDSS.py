import dataiku
import os
import shutil
from datetime import datetime, timedelta

def delete_old_folders(path, days_old):
    """
    Delete folders older than a specified number of days in the given path.
    """
    if not os.path.exists(path):
        print(f"The path {path} does not exist.")
        return

    now = datetime.now()
    threshold = now - timedelta(days=days_old)

    folders = [f for f in os.listdir(path) if os.path.isdir(os.path.join(path, f))]
    for folder in folders:
        folder_path = os.path.join(path, folder)
        folder_mtime = datetime.fromtimestamp(os.path.getmtime(folder_path))
        
        if folder_mtime < threshold:
            print(f"Deleting folder: {folder_path} (Last Modified: {folder_mtime})")
            try:
                shutil.rmtree(folder_path)
            except Exception as e:
                print(f"Failed to delete {folder_path}: {e}")
        else:
            print(f"Skipping folder: {folder_path} (Last Modified: {folder_mtime})")

# Define the path and age threshold
jobs_path = "/datadrive/dataiku/dss_data/jobs"
days_old = 30

# Call the function to delete old folders
delete_old_folders(jobs_path, days_old)

print("Folder cleanup completed.")
