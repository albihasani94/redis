docker exec -it redis redis-cli
set customer:1000 fred
get customer:1000
scan 0 match customer:*
del key customer
scan 0 match customer:*
del key customer:1000
scan 0 match customer:*
set inventory:100-meters-womens-final 1000 NX
set inventory:100-meters-womens-final "Sold Out" NX
get inventory:100-meters-womens-final
set inventory:100-meters-womens-final 0 XX
get inventory:100-meters-womens-final
set inventory:4x100m-womens-final 1000
get inventory:4x100m-womens-final
decrby inventory:4x100m-womens-final 1
get inventory:4x100m-womens-final
type inventory:4x100m-womens-final
object encoding inventory:4x100m-womens-final
set inventory:4x100m-womens-final "Sold Out"
type inventory:4x100m-womens-final
object encoding inventory:4x100m-womens-final
decrby inventory:4x100m-womens-final 1
set inventory:4x100m-womens-final 0