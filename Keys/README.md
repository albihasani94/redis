# Keys

Majority of Redis commands operate on keys.

## Redis keys

* Unique
* Binary safe
* Key names can be up to 512MB
* Length vs Readability

```bash
docker exec -it redis_redis_1 redis-cli
127.0.0.1:6379> set customer:1000 fred
OK
127.0.0.1:6379> get customer:1000
"fred"
127.0.0.1:6379> scan 0 match customer:*
1) "0"
2) 1) "customer:1000"
127.0.0.1:6379> del key customer
(integer) 0
127.0.0.1:6379> scan 0 match customer:*
1) "0"
2) 1) "customer:1000"
127.0.0.1:6379> del key customer:1000
(integer) 1
127.0.0.1:6379> scan 0 match customer:*
1) "0"
2) (empty list or set)
127.0.0.1:6379> set inventory:100-meters-womens-final 1000 NX
OK
127.0.0.1:6379> set inventory:100-meters-womens-final "Sold Out" NX
(nil)
127.0.0.1:6379> get inventory:100-meters-womens-final
"1000"
127.0.0.1:6379> set inventory:100-meters-womens-final 0 XX
OK
127.0.0.1:6379> get inventory:100-meters-womens-final
"0"
```

```EXISTS key [key]```
> may be used before using SET to verify existence

NX
> they key does not exist before it's set.
> the second time the key is left unchanged

XX
>the key must exist before it's set

## Key Expiration

* Expiration times can be set
* Expiration can be changed by the user
* Expiration can be removed

### TTL Commands

#### SET

* EXPIRE key seconds
* EXPIREAT key timestamp
* PEXPIRE key milliseconds
* PEXPIREAT key milliseconds-timestamp

#### Examine

* TTL key
* PTTL key

```bash
127.0.0.1:6379> set seat-hold Row:A:Seat:4 PX 50000
OK
127.0.0.1:6379> set seat-hold Row:A:Seat:4 EX 50
OK
127.0.0.1:6379> get seat-hold
"Row:A:Seat:4"
127.0.0.1:6379> pexpire seat-hold 1
(integer) 1
127.0.0.1:6379> get seat-hold
(nil)
127.0.0.1:6379> set seat-hold Row:A:Seat:4 ex 50
OK
127.0.0.1:6379> ttl seat-hold
(integer) 47
127.0.0.1:6379> ttl seat-hold
(integer) 39
127.0.0.1:6379> pttl seat-hold
(integer) 35812
127.0.0.1:6379> persist seat-hold
(integer) 1
127.0.0.1:6379> ttl seat-hold
(integer) -1
127.0.0.1:6379>
```