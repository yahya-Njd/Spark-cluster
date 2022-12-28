## Creating and Building Docker Images for JupyterLab and Spark Nodes in a Cluster

The four components which make up the cluster are the JupyterLab IDE, the Spark master node, and two Spark worker nodes.

The user is able to access the master node using the GUI provided by Jupyter notebooks, and is able to submit Spark commands. The master node then takes the input, distributes the workload to the workers nodes, and sends the results back to the IDE.

All the components are connected through a network, and data is shared between them through a shared mounted volume.


![Spark Cluster](https://raw.githubusercontent.com/yahya-Njd/Spark-cluster/master/images/img2.png)


We need to create, build and compose the Docker images for JupyterLab and Spark nodes to make the cluster. We will use the following Docker image hierarchy:

![Hierarchy](https://raw.githubusercontent.com/yahya-Njd/Spark-cluster/master/images/img1.png)

### We can get images from Docker Hub: https://hub.docker.com/repositories/yahyanjd
Or we can build it from the docker files in the `Dockerfiles` directory

You can use the following command to build the images using Docker:

```bash
make build-docker
```
Or you can use Podman to build the images with this command:
```bash
make build-podman
```

To launch the cluster, use one of the following commands:
```bash
make run-podman
make run-docker
```
And to stop it, use one of the following commands:

```bash
make stop-podman
make stop-docker
```

Now that the cluster is up, we can create our first PySpark application by launching the JupyterLab (IDE) and creating a Python Jupyter notebook. To create the PySpark application, a connection to the Spark master node must be established using a Spark session object and the following parameters:

![Spark Cluster](https://raw.githubusercontent.com/yahya-Njd/Spark-cluster/master/images/img3.png)

- spark.executor.memory: The amount of memory to be allocated to each executor, in MB.
- spark.driver.memory: The amount of memory to be allocated to the driver, in GB.

