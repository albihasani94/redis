docker exec -it redis redis-cli
sadd venues "Olympic Stadium" "Nippon Budokan" "Tokyo Stadium"
sadd venues "Olympic Stadium"
sscan venues 0 match *
sismember venues "San Siro"
sismember venues "Nippon Budokan"
srem venues "Nippon Budokan"
spop venues
sscan venues 0 match *
sadd "venue:italy" "San Siro" "Olimpico" "Udinese Stadium"
sadd "venue:championsl" "Allianz Arena" "San Siro" "Wembley" "Olimpico"
sinter "venue:italy" "venue:championsl"
sdiff "venue:italy" "venue:championsl"
sdiff "venue:championsl" "venue:italy"
sunion "venue:italy" "venue:championsl"