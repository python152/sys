
# ELK


## Basic Examples


### Check cluster health
  
```
curl -XGET 'http://localhost:9200/_cluster/health?pretty=true'
```

### Check at the shard level

This has more details at the shard level.

```
curl -XGET 'http://localhost:9200/_cluster/health?level=shards&pretty=true'
```


### PUT to create new entry

```
curl -XPUT "http://localhost:9200/foo/bar/9999" -d '
{
    "name": "Oliver",
    "id": 9999,
    "department": "sales"
}
'
```

Expected `201 created` response, with `_index` as `foo`, `_type` as `bar`, and
`_id` as 9999. Note that `type` mapping is deprecated. See [Elastic](https://www.elastic.co/guide/en/elasticsearch/reference/current/removal-of-types.html) for more information.

### GET to retrieve an entry

```
curl -XGET "http://localhost:9200/foo/bar/9999"
```



### Partial retrieval

```
curl -XGET "http://localhost:9200/foo/bar/9999?_source=name,department"
```


### HEAD for checking existence

```
curl -i -XHEAD http://localhost:9200/foo/bar/9999?pretty
```

