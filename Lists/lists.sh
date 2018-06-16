docker exec -it redis redis-cli
lpush orders:4x100m-womens-final jane:4 bill:8 charlie:6
LLEN orders:4x100m-womens-final
lrange orders:4x100m-womens-final 0 -1
lrange orders:4x100m-womens-final 0 2
lrange orders:4x100m-womens-final 0 1
lrange orders:4x100m-womens-final 0 3
rpush waitlist:basketball-mens-qual brian:2 kate:7 kevin:9
lrange waitlist:basketball-mens-qual 0 -1
rpop orders:4x100m-womens-final
lpop waitlist:basletball-mens-qual
lpop waitlist:basketball-mens-qual
lrange orders:4x100m-womens-final 0 2
lindex orders:4x100m-womens-final 0
rindex orders:4x100m-womens-final 0
linsert orders:4x100m-womens-final BEFORE charlie:6 christina:18
lrange orders:4x100m-womens-final 0 2
lset orders:4x100m-womens-final 3 trisha:20
lset orders:4x100m-womens-final 2 trisha:20
lrange orders:4x100m-womens-final 0 2
lrem orders:4x100m-womens-final charlie:6
lrem orders:4x100m-womens-final 0 charlie:6
lrange orders:4x100m-womens-final 0 -1
lindex orders:4x100m-womens-final 1