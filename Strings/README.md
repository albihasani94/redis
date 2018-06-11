# Strings

Strings are the simplest data type that can be associated with the key.

## Redis Strings

* Text data
* Integers and FP Numbers
* Binary data
* Maximm of 512MB

Internally, Redis stores the encoding of the value

* > DATATYPE: STRING
* > ENCODING: INT

### Manipulating Strings

* DECRBY key decrement
* INCRBY key increment

```bash
docker exec -it redis_redis_1 redis-cli
127.0.0.1:6379> set inventory:4x100m-womens-final 1000
OK
127.0.0.1:6379> get inventory:4x100m-womens-final
"1000"
127.0.0.1:6379> decrby inventory:4x100m-womens-final
(error) ERR wrong number of arguments for 'decrby' command
127.0.0.1:6379> decrby inventory:4x100m-womens-final 1
(integer) 999
127.0.0.1:6379> get inventory:4x100m-womens-final
"999"
127.0.0.1:6379> type inventory:4x100m-womens-final
string
127.0.0.1:6379> object encoding inventory:4x100m-womens-final
"int"
127.0.0.1:6379> set inventory:4x100m-womens-final "Sold Out"
OK
127.0.0.1:6379> type inventory:4x100m-womens-final
string
127.0.0.1:6379> object encoding inventory:4x100m-womens-final
"embstr"
127.0.0.1:6379> decrby inventory:4x100m-womens-final 1
(error) ERR value is not an integer or out of range
127.0.0.1:6379> set inventory:4x100m-womens-final 0
OK
127.0.0.1:6379>
```