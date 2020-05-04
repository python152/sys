
# ELK

- [ELK](#elk)
  - [Basic Examples](#basic-examples)
    - [Check cluster health](#check-cluster-health)
    - [Check at the shard level](#check-at-the-shard-level)
    - [PUT to create new entry](#put-to-create-new-entry)
    - [GET to retrieve an entry](#get-to-retrieve-an-entry)
    - [Partial retrieval](#partial-retrieval)
    - [HEAD for checking existence](#head-for-checking-existence)
    - [Delete single document](#delete-single-document)
    - [Delete index](#delete-index)


## Basic Examples


### Check cluster health
  
```sh
curl -XGET 'http://localhost:9200/_cluster/health?pretty=true'
```

### Check at the shard level

This has more details at the shard level.

```sh
curl -XGET 'http://localhost:9200/_cluster/health?level=shards&pretty=true'
```


### PUT to create new entry

```sh
curl -XPUT "http://localhost:9200/foo/bar/9999" -d '
{
    "name": "Oliver",
    "id": 9999,
    "department": "sales"
}
'
```

Expected `201 created` response, with `_index` as `foo`, `_type` as `bar`, and
`_id` as 9999. 

Note that `type` mapping is deprecated. See [Elastic Documentation](https://www.elastic.co/guide/en/elasticsearch/reference/current/removal-of-types.html) for more information.

### GET to retrieve an entry

```sh
curl -XGET "http://localhost:9200/foo/bar/9999"
```



### Partial retrieval

```sh
curl -XGET "http://localhost:9200/foo/bar/9999?_source=name,department"
```


### HEAD for checking existence

```sh
curl -i -XHEAD http://localhost:9200/foo/bar/9999?pretty
```

### Delete single document

```sh
curl -XDELETE localhost:9200/indexName/type/doc_id
```

### Delete index

```sh
curl -XDELETE localhost:9200/indexName
```

