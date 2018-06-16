zadd "stadiums:Serie A" 1 "San Siro"
zadd "stadiums:Serie A" 5 "San Paolo" 3 "Allianz Arena" 2 "Olimpico" 4 "Luigi Ferraris"
zrange "stadiums:Serie A" 0 -1
zadd "stadiums:Serie A" 1 "Giuseppe Meazza"
zrange "stadiums:Serie A" 0 -1
zrange "stadiums:Serie A" 0 -1 withscores
zscore "stadiums:Serie A" "San Siro"
zrank "stadiums:Serie A" "San Siro"
zrank "stadiums:Serie A" "Giuseppe Meazza"
zrevrank "stadiums:Serie A" "Giuseppe Meazza"
zcount "stadiums:Serie A" 2 5
zrem "stadiums:Serie A" "Giuseppe Meazza"
zrange "stadiums:Serie A" 0 -1
zrangebylex "stadiums:Serie A" - +
zrangebylex "stadiums:Serie A" [a [Z
zrangebylex "stadiums:Serie A" - [Z
zrangebylex "stadiums:Serie A" - +
zrevrange "stadiums:Serie A" 0 -1
zrangebyscore "stadiums:Serie A" 0 -1
zrangebyscore "stadiums:Serie A" 0 10
zadd q-1 10 a 20 b 30 c 40 d
zrange q-1 0 -1
zadd q-1 30 a
zadd q-1 30 ab
zrange q-1 0 -1
zrangebyscore q-1 0 -1
zrangebyscore q-1 0 100
zrangebylex q-1 - +
zrange q-1 0 -1
zrange q-1 0 -1 withscores
zrevrange q-1 0 2
