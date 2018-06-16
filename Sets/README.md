# Sets

Unordered collection of unique strings **only**

## Redis Sets

* Allow for set operations
  * Difference
  * Intersect
  * Union
* Are not nested

### Actions on Sets

* Add a set member

```SADD key member [member...]```

* List set members

```SMEMBERS key```

* List set members starting at cursor matching pattern

```SSCAN key cursor [MATCH pattern] [COUNT count]```

* Check Existence

```SISMEMBER key member```

* Remove Elements

```SREM key member [member ...]```
```SPOP key [count]```

### Set Operations

* UNION
* INTERSECT
* DIFFERENCE

### Set Operations (Continued)

* SDIFF
  * SDIFFSTORE
* SINTER
  * SINTERSTORE
* SUNION
  * SUNIONSTORE

```bash
albihasani94@albi-PC:~$ docker exec -it redis redis-cli
127.0.0.1:6379> sadd venues "Olympic Stadium" "Nippon Budokan" "Tokyo Stadium"
(integer) 3
127.0.0.1:6379> smembers venues
1) "Tokyo Stadium"
2) "Nippon Budokan"
3) "Olympic Stadium"
127.0.0.1:6379> sadd venues "Olympic Stadium"
(integer) 0
127.0.0.1:6379> sscan venues 0 match *
1) "0"
2) 1) "Tokyo Stadium"
   2) "Nippon Budokan"
   3) "Olympic Stadium"
127.0.0.1:6379> sismember venues "San Siro"
(integer) 0
127.0.0.1:6379> sismember venues "Nippon Budokan"
(integer) 1
127.0.0.1:6379> srem venues "Nippon Budokan"
(integer) 1
127.0.0.1:6379> spop venues
"Olympic Stadium"
127.0.0.1:6379> sscan venues 0 match *
1) "0"
2) 1) "Tokyo Stadium"
127.0.0.1:6379> sadd "venue:italy" "San Siro" "Olimpico" "Udinese Stadium"
(integer) 3
127.0.0.1:6379> sadd "venue:championsl" "Allianz Arena" "San Siro" "Wembley" "Olimpico"
(integer) 4
127.0.0.1:6379> sinter "venue:italy" "venue:championsl"
1) "Olimpico"
2) "San Siro"
127.0.0.1:6379> sdiff "venue:italy" "venue:championsl"
1) "Udinese Stadium"
127.0.0.1:6379> sdiff "venue:championsl" "venue:italy"
1) "Allianz Arena"
2) "Wembley"
127.0.0.1:6379> sunion "venue:italy" "venue:championsl"
1) "Olimpico"
2) "Allianz Arena"
3) "San Siro"
4) "Udinese Stadium"
5) "Wembley"
127.0.0.1:6379>
```