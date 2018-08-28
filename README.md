##SRE take-home test

## Terraform

Write a simple AWS configuration using Terraform (https://www.terraform.io/docs/index.html). Just the required resources - don't configure the provider.

* All resources should have sensible naming and descriptions. All should be tagged with key: `Service`, value: `test_service`.
* Do not create or associate any instances. The environment will just be set up ready for instances to be deployed.
* Everything will be using EC2 VPC (not EC2 Classic). Use the VPC id `vpc-11111111`.

The following resources should be configured:

### ELB security group (`aws_security_group`)

* Allow unrestricted access to port 443 (HTTPS)
* Allow all egress

### ELB (`aws_elb`)

* Subnets: `subnet-aaaaaaaa`, `subnet-bbbbbbbb`
* Access logs to `tidal-logs` S3 bucket, prefix `elb/<name>`, every 5 minutes (Where `<name>` is the name you give the ELB)
* Listen on port 443 HTTPS, direct to the instances on port 8080 HTTP. Certificate `arn:aws:iam::123456789012:server-certificate/certName`
* Health check to `/health` every 10s. Healthy/Unhealthy threshold 3. Timeout 2s.
* Security group: The ELB security group

### Application security group (`aws_security_group`)

* Allow access from the ELB security group on port 8080 (hint: use an ingress rule with security_groups)
* Allow all egress

## Docker

Based on the following conditions, set up a Dockerfile for the Java application downloaded from https://s3.amazonaws.com/tidal-fileshare-generic/187a5272-6044-4da6-af73-872efa342f1e/gs-spring-boot-0.1.0.jar

* It should use Java 1.8
* The command to launch the application is: `java -jar gs-spring-boot-0.1.0.jar`
* The default port should be 80 (use the `SERVER_PORT` environment variable)
* Expose the default port
* There should be an environment variable for `NAME` with default `unknown`

Optional: Set up a Docker Compose file that spins up the Java application, with a containerized nginx proxy in front of it.

## Code challenge

Write a small application in the language of your choice, including a brief description of how you approached the solution, any assumptions made, and how to build and run it. Choose one of the following:

* The Timer-o-botic: A small API service that returns the current time, the application's own wall-clock uptime and the total amount of wall-clock and/or cpu time spent processing requests, encoded in a JSON structure returned when queried with a HTTP GET on endpoint /uptime.
* The Measure-o-matic: A small program that reads newline-separated strings from stdin until EOF, and outputs the length of the longest string.
* The Crypt-o-tragic: A small program that reads newline-separated strings from stdin, rotates each 8-bit byte of the string by 4 bits, encodes the resulting bytes as hex and writes the result to stdout.

## Deploying applications

Changes to application code are pushed upstream, automatically launching triggers for pull requests, integration, testing, etc – eventually resulting in a build. From the point of completing the build, the deployment process kicks in. Briefly describe some of your thoughts around getting from a completed build, to the build running in production. Some topics to consider:

* Does a developer's responsibility end with their code push, or when the application is in production, or somewhere in between?
* Should every step be automated, or should there be manual steps involved to ensure a successful deployment?
* Who or what should decide how the application is scaled?
* What transitions might make sense when it comes to bringing the build through integration testing, running in staging, promoting to production, rolling back, etc?

## Infrastructure as code

Briefly describe some of your thoughts around the term "infrastructure as code". Some topics to consider:

* What is the scope of the term "infrastructure", and how can the scope vary depending on who you ask? Going from lower levels and up, consider things like networks and routes, user accounts and policies, compute resources, build pipelines, testing rigs, etc.
* What's a natural home for infrastructure code, in the application's code repository, or somewhere separate? Do different aspects of infrastructure belong in different places?
* Should developers be empowered to manage their application's underlying infrastructure, or should it be handled by a separate role, or something in between?

## Code vs state, configuration and environment

Briefly describe some of your thoughts around the coupling of an application's code and its state, run-time configuration and environment. For example, an application that manages user sessions can store session information to a persistent SQL data store; its configuration can include scaling details such as a baseline node count, scale-out/in policies, etc; its environment can include things like database passwords, endpoint hostnames, etc. Some topics to consider:

* An application might save state to a storage volume or a local database, and these volumes can be easy to make persistent. But what are the drawbacks?
* Run-time configuration, for example a Kubernetes Deployment or Service object definition file, can be tracked in the application's code repository. What are benefits or drawbacks of such coupling?
* What are good ways of handling a database schema change? Should it remain coupled to the application's code to ensure that they are modified in tandem, or should they be decoupled?
* What are good ways of handling secrets in environment variables? How would they conflict with the "codify everything" mantra?
