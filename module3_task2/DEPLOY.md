# Hugo Website Deployment  

This project is a Hugo-powered static site managed using GNU Make.:  

## 1. What is in the archive and how to unarchive it?  

The awesome-website.zip archive contains the following:  

* awesome-api binary: The compiled application binary.  
* dist/: The directory containing the generated static website files (this may include HTML, CSS, JavaScript, and assets required by the website).  

# To unarchive the ZIP file:  

* **Download the archive to your desired location.**  

* **Unarchive the file using the following command:**  

  ```sh
  unzip awesome-website.zip -d /path/to/destination  

## 2. What are the commands to start and stop the application?  

The awesome-api application can be run as a background process, and you can easily manage its lifecycle using the following commands.  

# To start the application:  

* **Navigate to the directory where awesome-api is located:**  

  ```sh
  cd /path/to/extracted/directory  

* **Run the awesome-api binary:**  

  ```sh
  ./awesome-api &  

This will start the application in the background. The application will listen for incoming requests on its default port  

# To stop the application:  

* **Find the PID of the running application:**  

  ```sh
  ps aux | grep awesome-api  

* **Stop the application by killing its PID:**  

  ```sh
  kill <PID>  

## 3. How to customize where the application logs are written?  

By default, the awesome-api application writes logs to stdout (the terminal/console output). You can customize where logs are written by setting the LOG_PATH environment variable.  

# To specify a custom log file location:  

* **Set the LOG_PATH environment variable to your desired file path.**  

  ```sh
  export LOG_PATH="/path/to/your/logfile.log"  

* **Restart the application to begin logging to the new location.**  

* **Alternatively, you can specify the log path when starting the application:**  

  ```sh
  LOG_PATH="/path/to/your/logfile.log" ./awesome-api &  

This will ensure that logs are written to the specified log file instead of the default stdout.  

## 4. How to “quickly” verify that the application is running (healthcheck)?  

To quickly verify that the awesome-api application is running and healthy, you can perform a healthcheck by sending an HTTP request to the application’s health endpoint.  

# Step-by-Step to Verify Application Status:  

* **Check if the application is running**  

* **Verify health with curl**  

  ```sh
  curl http://localhost:8080/health

* **If the application is running and healthy, you should receive a response like:**  

  ```sh
  {"status":"ok"}
  
* **Verify using system status (optional):**  

  ```sh
  ps aux | grep awesome-api
