# Sorted Sets

Ordered collection of unique strings

## Redis Sorted Sets

* Floating point score
* Manipulation by value, position, score, or lexicography

### Set Commands

* Union
* Intersection

### Adding elements

  ```ZADD KEY [NX|XX] [CH] [INCR] SCORE MEMBER [SCORE MEMBER ...]```

### Get the elements of a set

```ZRANGE key start stop [WITHSCORES]```

```ZREVRANGE key start stop [WITHSCORES]```

```ZRANGEBYSCORE key min max [WITHSCORES] [LIMIT offset count]```

```ZRANGEBYLEX key min max [LIMIT offset count]```

### Get the score and rank of an element

```ZRANK key member```

```ZREVRANK key member```

```ZSCORE key member```

### Count the number of members between a range of scores

```ZCOUNT key min max```

### Remove members from set

```ZREM key member [member ...]```

```ZREMRANGEBYLEX```

```ZREMRANGEBYRANK```

```ZREMRANGEBYSCORE```

### Set based operations

* you can only store the result in another set
* only intersection and union
* ```ZINTERSTORE destination numkeys key [key ...] [WEIGHTS weight [weight]] [AGGREGATE SUM|MIN|MAX]```
* ```ZUNIONSTORE destination numkeys key [key ...] [WEIGHTS weight [weight]] [AGGREGATE SUM|MIN|MAX]```

## Use cases

* Leaderboards
* Priority Queue

```bash
127.0.0.1:6379> zadd "stadiums:Serie A" 1 "San Siro"
(integer) 1
127.0.0.1:6379> zadd "stadiums:Serie A" 5 "San Paolo" 3 "Allianz Arena" 2 "Olimpico" 4 "Luigi Ferraris"
(integer) 4
127.0.0.1:6379> zrange "stadiums:Serie A" 0 -1
1) "San Siro"
2) "Olimpico"
3) "Allianz Arena"
4) "Luigi Ferraris"
5) "San Paolo"
127.0.0.1:6379> zadd "stadiums:Serie A" 1 "Giuseppe Meazza"
(integer) 1
127.0.0.1:6379> zrange "stadiums:Serie A" 0 -1
1) "Giuseppe Meazza"
2) "San Siro"
3) "Olimpico"
4) "Allianz Arena"
5) "Luigi Ferraris"
6) "San Paolo"
127.0.0.1:6379> zrange "stadiums:Serie A" 0 -1 withscores
 1) "Giuseppe Meazza"
 2) "1"
 3) "San Siro"
 4) "1"
 5) "Olimpico"
 6) "2"
 7) "Allianz Arena"
 8) "3"
 9) "Luigi Ferraris"
10) "4"
11) "San Paolo"
12) "5"
127.0.0.1:6379> zscore "stadiums:Serie A" "San Siro"
"1"
127.0.0.1:6379> zrank "stadiums:Serie A" "San Siro"
(integer) 1
127.0.0.1:6379> zrank "stadiums:Serie A" "Giuseppe Meazza"
(integer) 0
127.0.0.1:6379> zrevrank "stadiums:Serie A" "Giuseppe Meazza"
(integer) 5
127.0.0.1:6379> zcount "stadiums:Serie A" 2 5
(integer) 4
127.0.0.1:6379> zrem "stadiums:Serie A" "Giuseppe Meazza"
(integer) 1
127.0.0.1:6379> zrange "stadiums:Serie A" 0 -1
1) "San Siro"
2) "Olimpico"
3) "Allianz Arena"
4) "Luigi Ferraris"
5) "San Paolo"
127.0.0.1:6379> zrangebylex "stadiums:Serie A" - +
1) "San Siro"
2) "Olimpico"
3) "Allianz Arena"
4) "Luigi Ferraris"
5) "San Paolo"
127.0.0.1:6379> zrangebylex "stadiums:Serie A" [a [Z
(empty list or set)
127.0.0.1:6379> zrangebylex "stadiums:Serie A" - [Z
1) "San Siro"
2) "Olimpico"
3) "Allianz Arena"
4) "Luigi Ferraris"
5) "San Paolo"
127.0.0.1:6379> zrangebylex "stadiums:Serie A" - +
1) "San Siro"
2) "Olimpico"
3) "Allianz Arena"
4) "Luigi Ferraris"
5) "San Paolo"
127.0.0.1:6379> zrevrange "stadiums:Serie A" 0 -1
1) "San Paolo"
2) "Luigi Ferraris"
3) "Allianz Arena"
4) "Olimpico"
5) "San Siro"
127.0.0.1:6379> zrangebyscore "stadiums:Serie A" 0 -1
(empty list or set)
127.0.0.1:6379> zrangebyscore "stadiums:Serie A" 0 10
1) "San Siro"
2) "Olimpico"
3) "Allianz Arena"
4) "Luigi Ferraris"
5) "San Paolo"
127.0.0.1:6379> zadd q-1 10 a 20 b 30 c 40 d
(integer) 4
127.0.0.1:6379> zrange q-1 0 -1
1) "a"
2) "b"
3) "c"
4) "d"
127.0.0.1:6379> zadd q-1 30 a
(integer) 0
127.0.0.1:6379> zadd q-1 30 ab
(integer) 1
127.0.0.1:6379> zrange q-1 0 -1
1) "b"
2) "a"
3) "ab"
4) "c"
5) "d"
127.0.0.1:6379> zrangebyscore q-1 0 -1
(empty list or set)
127.0.0.1:6379> zrangebyscore q-1 0 100
1) "b"
2) "a"
3) "ab"
4) "c"
5) "d"
127.0.0.1:6379> zrangebylex q-1 - +
1) "b"
2) "a"
3) "ab"
4) "c"
5) "d"
127.0.0.1:6379> zrange q-1 0 -1
1) "b"
2) "a"
3) "ab"
4) "c"
5) "d"
127.0.0.1:6379> zrange q-1 0 -1 withscores
 1) "b"
 2) "20"
 3) "a"
 4) "30"
 5) "ab"
 6) "30"
 7) "c"
 8) "30"
 9) "d"
10) "40"
127.0.0.1:6379> zrevrange q-1 0 2
1) "d"
2) "c"
3) "ab"
127.0.0.1:6379>
```