# Hashes

Hashes can be viewed as a way to store and retrieve an object

## Redis Hashes

* key with named field
* single level
* provide commands on those fields
* dynamically add and remove fields
* stored extremely efficiently

A hash can be comprised only of strings, not other data structures.

How is hash manipulated?

```HSET key field value [field value ...]```

Removing the hash fields

```HDEL key field [field ...]```

> When the key is removed all the key-value pairs are also removed

Incrementing hash fields

```HINCRBY key field increment```
```HINCRBYFLOAT key field increment```

Setting a key value

```HSET key field value```
```HSETNX key field value```

Field access

```bash
HGET key field
HGETALL key
HSCAN key cursor [MATCH pattern] [COUNT count]
HMGET key field [field ...]
HKEYS key
HVALS key
```

Use Cases

* Rate Limiting
* Session cache