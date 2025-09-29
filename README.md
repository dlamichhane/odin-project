# How to estimate the resources

# Requirements

Total users - 10M
Daily Active users (DAU) - 1M active users/Daily
Peak concurrent users - 10% of DAU = 100k

# 1. Throughtput

-> QPS = DAU / seconds per day = 1000000/24*60*60 (100k) = 10 requests per second (Average request per seconds)
-> Peak QPS = 2x-10x _ Average requests per second i.e 10 (factor)_ 10 = 100 requests per seconds

# 2 Read / Write Ratio

- Social Media = 90% reads and 10% writes
  i.e 90 reads and 10 writes

# 3. Traffic Estimates (data in/out )

## Write

-> 100 QPS (write)* (1kb of post/write) = 100 KB/sec = 100*24*60*60 = 8.6 GB/day

## Read

-> 900 \* 2 KB/sec = 1800 KB/sec = 155 GB/Day

## 3. Storage Estimation

-> Storage/year = Writes/day _ 365 = 8.6 _ 365 = 3.0 TB

## Factor in

- indexes = 20% -30%
- replication = 3x durability
- future growth - x (2-3)

## 4. Memory estimates (for cache)

- items to cache = active users _ items per user _ hit rate
  = 1M _ 20 _ 80% = 16M items
- size per item = key (32 bytes) + cache data (512 bytes) + metadata (64 bytes) = ~ 600 bytes

Total Memory = 16 M \* 600 bytes = 9600000000 bytes = 10 GB

## Factor in replication and overhead

- replication 3 = 10 \* 10 GB = 30 GB
- Eviction policy: Use 20-30% buffer = 30 GB + 9 GB = 39 GB

-> If we have a server of 16 GB, then we require 39 GB / 16 GB = 3 servers
