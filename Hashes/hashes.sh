hset event:judo capacity 12000 location "Nippon Budokan" ticket_price:gold 100 availability:gold 8000
hexists event:judo capacity
hget event:judo timezone
hget event:judo location
hincrby event:judo availability:gold -10
hscan event:judo 0 match availability:*
hset event:judo ticket_price:silver 80 availability:silver 10000
hscan event:judo 0 match availability:*
hscan event:judo 0 match ticket_price:*
hset event:judo timezone JST
hget event:judo timezone
hdel event:judo timezone
hexists event:judo timezone
hsetnx event:judo capacity 50000
hget event:judo capacity
hgetall event:judo
hkeys event:judo
hvals event:judo
hmget event:judo capacity location
