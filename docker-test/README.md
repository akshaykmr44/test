## Docker

Based on the following conditions, set up a Dockerfile for the Java application downloaded from https://s3.amazonaws.com/tidal-fileshare-generic/187a5272-6044-4da6-af73-872efa342f1e/gs-spring-boot-0.1.0.jar

* It should use Java 1.8
* The command to launch the application is: `java -jar gs-spring-boot-0.1.0.jar`
* The default port should be 80 (use the `SERVER_PORT` environment variable)
* Expose the default port
* There should be an environment variable for `NAME` with default `unknown`

Optional: Set up a Docker Compose file that spins up the Java application, with a containerized nginx proxy in front of it.

Steps to Run the file:

Install dockeron the system and run the below command.

Put the jar into the same folder where the dockerfile is present.

Command to run the docker file
docker build --file Dockerfile /path/of/the/folder/where/docker/file/is/present
Example : docker build --file Dockerfile /Users/akskumar/Documents/Docker
