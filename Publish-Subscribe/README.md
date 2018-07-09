# Publish/Subscribe

- Simple syndication
  - PUBLISH channel message
  - SUBSCRIBE channel [channel ...]
  - UNSUBSCRIBE [channel [channel ...]]
- Patterned syndication
  - PSUBSCRIBE pattern [pattern ...]
  - PUNSUBSCRIBE [pattern [pattern ...]]
- Admin
  - PUBSUB subcommand ]argument [argument ...]]

## Client 1

```bash
subscribe channel1
```

## Client 2

```bash
publish channel1 hello
```

## Output on Client 1

```bash
Reading messages... (press Ctrl-C to quit)
1) "subscribe"
2) "channel1"
3) (integer) 1
1) "message"
2) "channel1"
3) "hello"
```

## Multiple Channels

## Client 1 #1

```bash
subscribe channel1 channel2
Reading messages... (press Ctrl-C to quit)
1) "subscribe"
2) "channel1"
3) (integer) 1
1) "subscribe"
2) "channel2"
3) (integer) 2
1) "message"
2) "channel1"
3) "hii"
1) "message"
2) "channel2"
3) "bye"
```

## Client 2 #1

```bash
127.0.0.1:6379> publish channel1 hello
(integer) 1
127.0.0.1:6379> publish channel2 world
(integer) 0
127.0.0.1:6379> publish channel1 hii
(integer) 1
127.0.0.1:6379> publish channel2 bye
(integer) 1
127.0.0.1:6379>
```

## Patterned Publish/Subscribe

- PUBSUB
  - CHANNELS [pattern]
  - NUMSUB [channel1 .. channeln]
  - NUMPAT

- PSUBSCRIBE pattern [pattern]
  - ?
  > h?llo subscribes to hello, hallo and hxllo
  - \*
  > h*llo subscribes to hllo and heeeello
  - [...]
  > h[ae]llo subscribes to hello and hallo, but not hillo
  - ^
  > ^hell subscribes to hell but not hel

### Client 1 #2

```bash
127.0.0.1:6379> publish tvshows GoT/7.0
(integer) 1
127.0.0.1:6379> publish tvshows:verybest Hannibal/10.0
(integer) 2
127.0.0.1:6379> pubsub numsub tvshows tvshows:verybest
1) "tvshows"
2) (integer) 0
3) "tvshows:verybest"
4) (integer) 1
127.0.0.1:6379> pubsub numpat
(integer) 1
127.0.0.1:6379>
```

### Client 2 #2

```bash
127.0.0.1:6379> subscribe tvshows:verybest
Reading messages... (press Ctrl-C to quit)
1) "subscribe"
2) "tvshows:verybest"
3) (integer) 1
1) "message"
2) "tvshows:verybest"
3) "Hannibal/10.0"
```

### Client 3 #2

```bash
127.0.0.1:6379> psubscribe tvshows*
Reading messages... (press Ctrl-C to quit)
1) "psubscribe"
2) "tvshows*"
3) (integer) 1
1) "pmessage"
2) "tvshows*"
3) "tvshows"
4) "GoT/7.0"
1) "pmessage"
2) "tvshows*"
3) "tvshows:verybest"
4) "Hannibal/10.0"
```

## Recap

- Admin
  - PUBSUB subcommand [argument [argument ...]]
- Patterned Syndication
  - PSUBSCRIBE pattern [pattern ...]
  - PUNSUBSCRIBE [pattern [pattern ... ]]