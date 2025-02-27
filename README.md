## Getting Started
این پروژه از Docker Compose برای راه‌اندازی یک Redis Cluster با 6 گره استفاده می‌کند، که شامل 3 گره Master و 3 گره Replica است. سرویس‌ها شامل redis_1 تا redis_6  و cluster_initiator برای ایجاد کلاستر هستند. پس از راه‌اندازی، خوشه با دستور redis-cli --cluster create پیکربندی می‌شود. همچنین، سرویس redis_commander برای مدیریت و مشاهده داده‌ها از طریق رابط وب در پورت 5050 در دسترس است. این پروژه برای راه‌اندازی و مدیریت Redis Cluster به صورت خودکار طراحی شده است.


## docker swarm 
## Create cluster initiator for docker swarm 
```
docker build -t redis-cluster-initiator:latest -f Dockerfile .
```

## deploy stack 
```
docker stack deploy -c docker-compose.yml redis-cluster
```



```
docker compose up 
```

### Installing  memtier-benchmark For benchmark

Pre-compiled binaries are available for these platforms from the packages.redis.io Redis APT
repository. To configure this repository, use the following steps:

```
sudo apt install lsb-release curl gpg

curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list

sudo apt-get update
```

Once configured, to install memtier_benchmark use:

```
sudo apt-get install memtier-benchmark
```

### Running bench mark

```
memtier_benchmark \
  --cluster-mode \
  --server=174.10.0.2 \
  --port=6379 \
  --test-time=60 \
  --data-size=1024 \
  --pipeline=256 \
  --clients=1000 \
  --ratio=1:0 \
  --threads=4 \
  --rate-limiting=10000 \

```