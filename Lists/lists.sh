albihasani94@albi-PC:~/Desktop/redis$ docker exec -it redis redis-cli
127.0.0.1:6379> lpush orders:4x100m-womens-final jane:4 bill:8 charlie:6
(integer) 3
127.0.0.1:6379> LLEN orders:4x100m-womens-final
(integer) 3
127.0.0.1:6379> lrange orders:4x100m-womens-final 0 -1
1) "charlie:6"
2) "bill:8"
3) "jane:4"
127.0.0.1:6379> lrange orders:4x100m-womens-final 0 2
1) "charlie:6"
2) "bill:8"
3) "jane:4"
127.0.0.1:6379> lrange orders:4x100m-womens-final 0 1
1) "charlie:6"
2) "bill:8"
127.0.0.1:6379> lrange orders:4x100m-womens-final 0 3
1) "charlie:6"
2) "bill:8"
3) "jane:4"
127.0.0.1:6379> rpush waitlist:basketball-mens-qual brian:2 kate:7 kevin:9
(integer) 3
127.0.0.1:6379> lrange waitlist:basketball-mens-qual 0 -1
1) "brian:2"
2) "kate:7"
3) "kevin:9"
127.0.0.1:6379> rpop orders:4x100m-womens-final
"jane:4"
127.0.0.1:6379> lpop waitlist:basletball-mens-qual
(nil)
127.0.0.1:6379> lpop waitlist:basketball-mens-qual
"brian:2"
127.0.0.1:6379> lrange orders:4x100m-womens-final 0 2
1) "charlie:6"
2) "bill:8"
127.0.0.1:6379> lindex orders:4x100m-womens-final 0
"charlie:6"
127.0.0.1:6379> rindex orders:4x100m-womens-final 0
(error) ERR unknown command 'rindex'
127.0.0.1:6379> linsert orders:4x100m-womens-final BEFORE charlie:6 christina:18

(integer) 3
127.0.0.1:6379> lrange orders:4x100m-womens-final 0 2
1) "christina:18"
2) "charlie:6"
3) "bill:8"
127.0.0.1:6379> lset orders:4x100m-womens-final 3 trisha:20
(error) ERR index out of range
127.0.0.1:6379> lset orders:4x100m-womens-final 2 trisha:20
OK
127.0.0.1:6379> lrange orders:4x100m-womens-final 0 2
1) "christina:18"
2) "charlie:6"
3) "trisha:20"
127.0.0.1:6379> lrem orders:4x100m-womens-final charlie:6
(error) ERR wrong number of arguments for 'lrem' command
127.0.0.1:6379> lrem orders:4x100m-womens-final 0 charlie:6
(integer) 1
127.0.0.1:6379> lrange orders:4x100m-womens-final 0 -1
1) "christina:18"
2) "trisha:20"
127.0.0.1:6379> lindex orders:4x100m-womens-final 1
"trisha:20"
127.0.0.1:6379>