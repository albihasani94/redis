# Scenario 1
## Client 1
subscribe channel1 channel2

## Client 2
publish channel1 hello
publish channel2 world
publish channel1 hii
publish channel2 bye

# Scenario 2
## Client 1
publish tvshows GoT/7.0
publish tvshows:verybest Hannibal/10.0
pubsub numsub tvshows tvshows:verybest
pubsub numpat

## Client 2
subscribe tvshows:verybest

## Client 3
psubscribe tvshows*
