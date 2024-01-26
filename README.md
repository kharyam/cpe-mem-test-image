# CPU / Memory Allocating Container

This repo defines a container image that will allocate a specified amount of CPU and memory for a specified period of time before sleeping

The container can be configured using the following environment variables:

| Env Variable| Default | Description |
| ----------- | ------- | -------------------------------------------------------------------- |
| DELAY       | 10      |  How long (seconds) to wait before allocating memory and CPU         |
| MEMORY      | 512m    | The amount of memory the container should allocate                   |
| CPUS        | 1       |  The number of CPUS the container should fully utilize               |
| TIME        | 30      |  How long (seconds) the container should use the requested resources |



Example Usage:

```bash
# Build the image using podman
podman build -t cpumem:latest  .

# Create a container from the image. In this case the image will have a max
# of 5 CPUs (--cpus 5) and 5GB of RAM (-m 5g).  The container will not allocate 
# any resources until 10 seconds (-e DELAY=10) have elapsed.  The container will allocate 
# 5GB of RAM (-e MEMORY=500m) when it starts and will fully utilize 5 CPUS (-e CPUS=5)
# for a total of 30 seconds (-e TIME=30).  After 30 seconds the cpu load will return to
# 0 and memory will be de-allocted.
podman run -it --rm --cpus 5 -m 5g -e DELAY=10 -e MEMORY=5000m -e CPUS=5 -e TIME=30  cpumem:latest 
```