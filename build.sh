# -- Software Stack Version

SPARK_VERSION="3.2.2"
HADOOP_VERSION="3.2"
JUPYTERLAB_VERSION="3.4.6"

# -- Building the Images

docker build \
  -f ./Dockerfiles/cluster-base.Df \
  -t cluster-base .

docker build \
  --build-arg spark_version="${SPARK_VERSION}" \
  --build-arg hadoop_version="${HADOOP_VERSION}" \
  -f ./Dockerfiles/spark-base.Df \
  -t spark-base .

docker build \
  -f ./Dockerfiles/spark-master.Df \
  -t spark-master .

docker build \
  -f ./Dockerfiles/spark-worker.Df \
  -t spark-worker .

docker build \
  --build-arg spark_version="${SPARK_VERSION}" \
  --build-arg jupyterlab_version="${JUPYTERLAB_VERSION}" \
  -f ./Dockerfiles/jupyter.Df \
  -t jupyterlab .
