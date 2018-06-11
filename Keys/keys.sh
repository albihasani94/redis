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
set seat-hold Row:A:Seat:4 PX 50000
set seat-hold Row:A:Seat:4 EX 50
get seat-hold
pexpire seat-hold 1
get seat-hold
set seat-hold Row:A:Seat:4 ex 50
ttl seat-hold
ttl seat-hold
pttl seat-hold
persist seat-hold
ttl seat-hold