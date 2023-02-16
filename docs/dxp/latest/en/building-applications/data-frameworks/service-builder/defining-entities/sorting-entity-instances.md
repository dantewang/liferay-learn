---
uuid: aedfff98-59cf-4d1b-a773-74df3db8842f
---
# Sorting Entity Instances

Often, you want to retrieve multiple instances of a given entity and list them in a particular order. The `service.xml` file lets you specify the default order of your entities. 

Suppose you want to return entities by their creation date. It's easy to specify these default orderings:

```xml
<order>
    <order-column name="createDate" order-by="desc" />
</order>
```

You can enter `asc` or `desc` for ascending or descending order. 

Now you know how to order your service entities. 
