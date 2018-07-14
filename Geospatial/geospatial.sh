GEOADD geopoints 139.75 25.693 "Nippon Budokan"
geoadd geopoints 139.766 35.666 "Olympic Stadium"
zrange geopoints 0 -1 withscores
geopos geopoints "Nippon Budokan" "Olympic Stadium"
geohash geopoints "Nippon Budokan" "Olympic Stadium"
geodist geopoints "Nippon Budokan" "Olympic Stadium" m
georadius geopoints 139.818 35.648 30 km withdist
georadiusbymember geopoints "Nippon Budokan" 17 km withcoord
georadiusbymember geopoints "Nippon Budokan" 300 km withcoord
georadiusbymember geopoints "Nippon Budokan" 1000 km withcoord
georadiusbymember geopoints "Nippon Budokan" 10000 km withcoord

# RedisLab
GEORADIUSBYMEMBER geo:venues "Imperial Palace Garden" 4 km
geodist geo:venues "National Stadium" "Ariake Arena" mi
geodist geo:venues "National Stadium" "Ariake Arena" mi
geodist geo:events:Football "Olympic Stadium" "International Stadium Yokohama" km