# Hashes

Hashes can be viewed as a way to store and retrieve an object

## Redis Hashes

* key with named field
* single level
* provide commands on those fields
* dynamically add and remove fields
* stored extremely efficiently

A hash can be comprised only of strings, not other data structures.

### How is hash manipulated

```HSET key field value [field value ...]```

### Removing the hash fields

```HDEL key field [field ...]```

> When the key is removed all the key-value pairs are also removed

### Incrementing hash fields

```HINCRBY key field increment```
```HINCRBYFLOAT key field increment```

### Setting a key value

```HSET key field value```
```HSETNX key field value```

### Field access

```bash
HGET key field
HGETALL key
HSCAN key cursor [MATCH pattern] [COUNT count]
HMGET key field [field ...]
HKEYS key
HVALS key
```

### Use Cases

* Rate Limiting
* Session cache

```bash
127.0.0.1:6379> hset event:judo capacity 12000 location "Nippon Budokan" ticket_price:gold 100 availability:gold:8000
(error) ERR wrong number of arguments for HMSET
127.0.0.1:6379> hset event:judo capacity 12000 location "Nippon Budokan" ticket_price:gold 100 availability:gold 8000
(integer) 4
127.0.0.1:6379> hexists event:judo capacity
(integer) 1
127.0.0.1:6379> hget event:judo timezone
(nil)
127.0.0.1:6379> hget event:judo location
"Nippon Budokan"
127.0.0.1:6379> hincrby event:judo availability:gold -10
(integer) 7990
127.0.0.1:6379> hscan event:judo 0 match availability:*
1) "0"
2) 1) "availability:gold"
   2) "7990"
127.0.0.1:6379> hset event:judo ticket_price:silver 80 availability:silver 10000

(integer) 2
127.0.0.1:6379> hscan event:judo 0 match availability:*
1) "0"
2) 1) "availability:gold"
   2) "7990"
   3) "availability:silver"
   4) "10000"
127.0.0.1:6379> hscan event:judo 0 match ticket_price:*
1) "0"
2) 1) "ticket_price:gold"
   2) "100"
   3) "ticket_price:silver"
   4) "80"
127.0.0.1:6379> hset event:judo timesone JST
(integer) 1
127.0.0.1:6379> hget event:judo timezone
(nil)
127.0.0.1:6379> hdel event:judo timezone
(integer) 0
127.0.0.1:6379> hexists event:judo timezone
(integer) 0
127.0.0.1:6379> hsetnx key event:judo capacity 50000
(error) ERR wrong number of arguments for 'hsetnx' command
127.0.0.1:6379> hsetnx event:judo capacity 50000
(integer) 0
127.0.0.1:6379> hget event:judo capacity
"12000"
127.0.0.1:6379> hgetall event:judo
 1) "capacity"
 2) "12000"
 3) "location"
 4) "Nippon Budokan"
 5) "ticket_price:gold"
 6) "100"
 7) "availability:gold"
 8) "7990"
 9) "ticket_price:silver"
10) "80"
11) "availability:silver"
12) "10000"
13) "timesone"
14) "JST"
127.0.0.1:6379> hkeys event:judo
1) "capacity"
2) "location"
3) "ticket_price:gold"
4) "availability:gold"
5) "ticket_price:silver"
6) "availability:silver"
7) "timesone"
127.0.0.1:6379> hvals event:judo
1) "12000"
2) "Nippon Budokan"
3) "100"
4) "7990"
5) "80"
6) "10000"
7) "JST"
127.0.0.1:6379> hmget event:judo capacity timesone
1) "12000"
2) "JST"
127.0.0.1:6379> hdel event:judo timesone
(integer) 1
127.0.0.1:6379> hget event:judo timesone
(nil)
127.0.0.1:6379>
```
