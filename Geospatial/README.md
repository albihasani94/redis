# Geospatial Data

- Storage of Latitude and Longitude pairs

- Retrieval by
  - distance
  - radius

## Storage

- GeoHash for encoding
- 52 bits in length
- Sorted Sets for storage

## Adding geospatial values

- GEOADD key longitude latitude member [longitude latitude member...]

```bash
127.0.0.1:6379> GEOADD geopoints 139.75 25.693 "Nippon Budokan"
(integer) 1
127.0.0.1:6379> geoadd geopoints 139.766 35.666 "Olympic Stadium"
(integer) 1
127.0.0.1:6379> zrange geopoints 0 -1 withscores
1) "Nippon Budokan"
2) "4153846554015376"
3) "Olympic Stadium"
4) "4171232605401085"
127.0.0.1:6379>
```

- GEOHASH key member [member...]
- GEOPOS key member [member...]

```bash
127.0.0.1:6379> geopos geopoints "Nippon Budokan" "Olympic Stadium"
1) 1) "139.75000172853469849"
   2) "25.69299952130710807"
2) 1) "139.76599842309951782"
   2) "35.66599933238997977"
127.0.0.1:6379> geohash geopoints "Nippon Budokan" "Olympic Stadium"
1) "xhe6hj6be40"
2) "xn76uky3xb0"
127.0.0.1:6379>
```

## Searching for Geospatial Objects

- GEODIST key member1 member2 [unit]
- GEORADIUS key longitude latitude radius ...
- GEORADIUSBYMEMBER key member radius ...

```bash
127.0.0.1:6379> geodist geopoints "Nippon Budokan" "Olympic Stadium" m
"1109260.9189"
127.0.0.1:6379> georadius geopoints 139.818 35.648 30 km withdist
1) 1) "Olympic Stadium"
   2) "5.1082"
127.0.0.1:6379> georadiusbymember geopoints "Nippon Budokan" 17 km withcoord
1) 1) "Nippon Budokan"
   2) 1) "139.75000172853469849"
      2) "25.69299952130710807"
127.0.0.1:6379> georadiusbymember geopoints "Nippon Budokan" 300 km withcoord
1) 1) "Nippon Budokan"
   2) 1) "139.75000172853469849"
      2) "25.69299952130710807"
127.0.0.1:6379> georadiusbymember geopoints "Nippon Budokan" 1000 km withcoord
1) 1) "Nippon Budokan"
   2) 1) "139.75000172853469849"
      2) "25.69299952130710807"
127.0.0.1:6379> georadiusbymember geopoints "Nippon Budokan" 10000 km withcoord
1) 1) "Nippon Budokan"
   2) 1) "139.75000172853469849"
      2) "25.69299952130710807"
2) 1) "Olympic Stadium"
   2) 1) "139.76599842309951782"
      2) "35.66599933238997977"
127.0.0.1:6379>
```

## Use Cases

- Finding points nearby
  - GEOADD bars 51.618629 -0.668675 "Royal Standard"
  - GEORADIUS
- Customers in location
  - GEOADD nyc-tribecca
  - GEORADIUSBYMEMBER nyc-tribecca "Arcade Bakery"
- Offers by location
  - GEOADD McCoffee-NYC lat long "2 for 1 promo"
  - GEORADIUS

## Exercises

```bash
redisu# redis-cli
127.0.0.1:6379> GEORADIUSBYMEMBER geo:venues "Imperial Palace Garden" 4 km
1) "Tokyo International Forum"
2) "Imperial Palace Garden"
3) "Nippon Budokan"
4) "Olympic Stadium"
5) "Tokyo Metropolitan Gymnasium"
6) "National Stadium"
127.0.0.1:6379> geodist geo:venues "National Stadium" "Ariake Arena" mi
"5.0953"
127.0.0.1:6379> geodist geo:venues "National Stadium" "Ariake Arena" mi
"5.0953"
127.0.0.1:6379> geodist geo:events:Football "Olympic Stadium" "International Stadium Yokohama" km
"22.6596"
127.0.0.1:6379>
```