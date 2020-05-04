
# ELK

- [ELK](#elk)
  - [Meta operations](#meta-operations)
    - [Check cluster health](#check-cluster-health)
    - [Check at the shard level](#check-at-the-shard-level)
    - [List all index(s)](#list-all-indexs)
    - [Document counts](#document-counts)
  - [Create, Delete and Retrieval](#create-delete-and-retrieval)
    - [PUT to create new entry](#put-to-create-new-entry)
    - [Bulk API](#bulk-api)
    - [GET to retrieve an entry](#get-to-retrieve-an-entry)
    - [Partial retrieval](#partial-retrieval)
    - [HEAD for checking existence](#head-for-checking-existence)
    - [Delete single document](#delete-single-document)
    - [Delete index](#delete-index)
  

## Meta operations

### Check cluster health
  
```sh
curl -XGET 'http://localhost:9200/_cluster/health?pretty=true'
```

### Check at the shard level

This has more details at the shard level.

```sh
curl -XGET 'http://localhost:9200/_cluster/health?level=shards&pretty=true'
```

### List all index(s)

```sh
curl -XGET 'http://localhost:9200/_cat/indices?v'
```

`?v` is to print out headers, the default is `false`.

[Click here for more
information](https://www.elastic.co/guide/en/elasticsearch/reference/current/cat-indices.html)

### Document counts

ElasticSearch provides a count API for this:

```sh
curl -XGET 'http://localhost:9200/_cat/count/foo?v'
```

[Click here for more information](https://www.elastic.co/guide/en/elasticsearch/reference/current/cat.html)

## Create, Delete and Retrieval

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

Note that `type` mapping is deprecated. See [Elastic Documentation](https://www.elastic.co/guide/en/elasticsearch/reference/current/removal-of-types.html) for more information.

### Bulk API

Prepare a text file:

```sh
$ cat ex_create.txt
{ "index" : { "_index" : "test", "_id" : "1" } }
{ "field1" : "value1" }
```

Use `curl` as command line:

```sh
$ curl -s -H "Content-Type: application/x-ndjson" -XPOST localhost:9200/_bulk 
  --data-binary "@ex_create"; echo
```
* `-s` for silent output
* `-H` extra header
* Note second line is optional source, but for index operation, you need it;
  otherwise, it will complain empty document.
* `ndjson` is new line terminated format. You need `\n` for each line and *last line*.

```sh
$ cat ex_delete
{"delete": {"_index": "test", "_id": "1"}}

```


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

