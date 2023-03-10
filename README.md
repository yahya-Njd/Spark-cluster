## Creating and Building Docker Images for JupyterLab and Spark Nodes in a Cluster

The four components which make up the cluster are the JupyterLab IDE, the Spark master node, and two Spark worker nodes. The user is able to access the master node using the GUI provided by Jupyter notebooks, and is able to submit Spark commands. The master node then takes the input, distributes the workload to the workers nodes, and sends the results back to the IDE. All the components are connected through a network, and data is shared between them through a shared mounted volume.


![Spark Cluster](https://raw.githubusercontent.com/yahya-Njd/Spark-cluster/master/images/img2.png)

We need to create, build and compose the Docker images for JupyterLab and Spark nodes to make the cluster. We will use the following Docker image hierarchy:
### To get images from Dockerhub: https://hub.docker.com/repositories/yahyanjd


![Spark Cluster](https://raw.githubusercontent.com/yahya-Njd/Spark-cluster/master/images/img1.png)

Now that the cluster is up, we can create our first PySpark application by launching the JupyterLab (IDE) and creating a Python Jupyter notebook. To create the PySpark application, a connection to the Spark master node must be established using a Spark session object and the following parameters:

![Spark Cluster](https://raw.githubusercontent.com/yahya-Njd/Spark-cluster/master/images/img3.png)

### spark.executor.memory: The amount of memory to be allocated to each executor, in MB.
### spark.driver.memory: The amount of memory to be allocated to the driver, in GB.
