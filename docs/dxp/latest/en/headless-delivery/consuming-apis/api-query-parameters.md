---
uuid: 7b3a2c98-4dcc-4e82-814d-d50ba40070c5
---
# API Query Parameters

Whether you consume [REST APIs](./consuming-rest-services.md) or [GraphQL APIs](./consuming-graphql-apis.md), different query parameters are available to help you filter the responses.

## Fields Parameter

Use this parameter to specify and return only the fields specified. For example, query the countries API to return only the two-letter country code and country name.

### REST API Example

The cURL request:

```bash
curl \
	"http://localhost:8080/o/headless-admin-address/v1.0/countries?fields=a2,name" \
	-u "test@liferay.com:learn"
```

### GraphQL API Example

The GraphQL request:

```graphql
query {
	countries {
	  actions
		items {
		   a2
		   name
		}
      lastPage
      page
      pageSize
      totalCount
  }
} 
```

The JSON response:

```json
{
  "actions" : { },
  "facets" : [ ],
  "items" : [ {
    "a2" : "CD",
    "name" : "democratic-republic-of-congo"
  }, {
    "a2" : "ML",
    "name" : "mali"
  }, {
    "a2" : "BV",
    "name" : "bouvet-island"
  }, {
    "a2" : "UY",
    "name" : "uruguay"
  }, {
    "a2" : "SB",
    "name" : "solomon-islands"
  }, {
    "a2" : "LT",
    "name" : "lithuania"
  }, {
    "a2" : "LV",
    "name" : "latvia"
  }, {
    "a2" : "KN",
    "name" : "st-kitts"
  }, {
    "a2" : "MD",
    "name" : "moldova"
  }, {
    "a2" : "IO",
    "name" : "british-indian-ocean-territory"
  }, {
    "a2" : "NP",
    "name" : "nepal"
  }, {
    "a2" : "SC",
    "name" : "seychelles"
  }, {
    "a2" : "PH",
    "name" : "philippines"
  }, {
    "a2" : "AO",
    "name" : "angola"
  }, {
    "a2" : "MT",
    "name" : "malta"
  }, {
    "a2" : "SL",
    "name" : "sierra-leone"
  }, {
    "a2" : "PT",
    "name" : "portugal"
  }, {
    "a2" : "GG",
    "name" : "guernsey"
  }, {
    "a2" : "DM",
    "name" : "dominica"
  }, {
    "a2" : "NF",
    "name" : "norfolk-island"
  } ],
  "lastPage" : 13,
  "page" : 1,
  "pageSize" : 20,
  "totalCount" : 247
}%             
```

## Filter Parameter

Use this parameter to filter your API responses. Note, not all API endpoints support the `filter` parameter. The endpoints that support it have `filter` listed as an optional parameter in the [API Explorer](./consuming-rest-services.md). For example, you can filter blog postings by title (e.g. `headline eq 'Able'`).

### REST API Example

The cURL request:

```bash
curl \
	"http://localhost:8080/o/headless-delivery/v1.0/sites/20121/blog-postings?fields=articleBody,headline&filter=headline%20eq%20%27Able%27" \
	-u "test@liferay.com:learn"
```

### GraphQL API Example

The GraphQL request:

```graphql
query {
  blogPostings(filter:"headline eq 'Able'",siteKey:"20121")
	{page
     items {
  		articleBody
  		headline
  }
  }
}
```

The JSON response:

```json
"data": {
  "blogPostings": {
    "page": 1,
    "items": [
      {
        "articleBody": "<p>Able able able</p>",
        "headline": "Able"
      }
    ]
  }
}
```

```{note}
As noted above, not all fields support the filtering parameter. Filtering can be applied to fields that are indexed as keywords and not text. To find content by terms contained in fields indexed as text, use the [search](#search-parameter) parameter instead.
```

Different operators can be used in the filtering parameter. 

**Comparison Operators**

| Operator | Description | Example |
| :--- | :--- | :--- |
| `eq` | Equal | `addressLocality eq 'Redmond'` |
|  | Equal null | `addressLocality eq null` |
| `ne` | Not equal | `addressLocality ne 'London'` |
|  | Equal null | `addressLocality ne null` |
| `gt` | Greater than | `price gt 20` |
| `ge` | Great than or equal | `price ge 10` |
| `lt` | Less than | `dateCreated lt 2018-02-13T12:33:12Z` |
| `le` | Less than or equal | `dateCreated le 2012-05-29T09:13:28Z` |

**Logical Operators**

| Operator | Description | Example |
| :--- | :--- | :--- |
| `and`| Logical and | `price le 200 and price gt 3.5` |
| `or` | Logical or | `price le 3.5 or price gt 200` |
| `not` | Logical not | `not (price le 3.5)` |

Note, the `not` operator needs a space character after it.

**Grouping Operator**

| Operator | Description | Example |
| :--- | :--- | :--- |
| `( )` | Precedence grouping | `(price eq 5) or (addressLocality eq 'London')` |

**String Functions**

| Function | Description | Example |
| :--- | :--- | :--- |
| `contains` | Contains | `contains(title,'edmon')` |
| `startswith` | Starts with | `startswith(addressLocality, 'Lond')` |

**Lambda Operators**

Lambda operators evaluate a boolean expression on a collection (e.g, keywords). They must be prepended with a navigation path that identifies a collection.

| Lambda Operator | Description | Example |
| :--- | :--- | :--- |
| `any` | Any | `keywords/any(k:contains(k,'news'))` |

The `any` operator applies a boolean expression to each collection element and evaluates to `true` if the expression is true for any element.

**Operator Combindations and OData Syntax**

Syntax examples and other operator combinations are covered in the [OData standard reference](https://docs.oasis-open.org/odata/odata/v4.01/csprd06/part1-protocol/odata-v4.01-csprd06-part1-protocol.html#sec_BuiltinFilterOperations).

## Flatten Parameter

Use this parameter to retrieve items that exist within a hierarchical structure (i.e. parent and child). For example, fetch parent user groups and its child user groups inside of it (e.g. Raylife Global is the parent organization to the different regional Raylife organizations.).

### REST API Example

The cURL request:

```bash
curl \
	"http://localhost:8080/o/headless-admin-user/v1.0/organizations?fields=id,name&flatten=true" \
	-u "test@liferay.com:learn"
```

### GraphQL API Example

The GraphQL request:

```graphql
query {
	organizations (flatten: true) {
		actions
		items {
		   id
		   name
		}
    lastPage
    page
    pageSize
    totalCount
  }
} 
```

The JSON response:

```json
{
  "actions" : {
   ...
  },
  "facets" : [ ],
  "items" : [ {
    "id" : "46367",
    "name" : "Raylife APAC"
  }, {
    "id" : "46372",
    "name" : "Raylife EMEA"
  }, {
    "id" : "46377",
    "name" : "Raylife LATAM"
  }, {
    "id" : "46382",
    "name" : "Raylife NA"
  }, {
    "id" : "46616",
    "name" : "Raylife Global"
  } ],
  "lastPage" : 1,
  "page" : 1,
  "pageSize" : 20,
  "totalCount" : 5
}%       
```

## Page and Page Size Parameters

Use these parameters to specify which subset of items to return. The `page` parameter specifies which page to return out of all the pages available. The `pageSize` parameter specifies how many items you want per page. For example, query the countries API for a `pageSize=10` and `page=22` (i.e. the 22nd page of items).

### REST API Example

The cURL request:

```bash
curl \
	"http://localhost:8080/o/headless-admin-address/v1.0/countries?fields=a2,name&page=22&pageSize=10" \
	-u "test@liferay.com:learn"
```

### GraphQL API Example

The GraphQL request:

```graphql
query {
	countries (page: 22, pageSize: 10) {
	   actions
		items {
		   a2
		   name
		}
      lastPage
      page
      pageSize
      totalCount
  }
} 
```

The JSON response:

```json
{
  "actions" : { },
  "facets" : [ ],
  "items" : [ {
    "a2" : "KG",
    "name" : "kyrgyzstan"
  }, {
    "a2" : "RE",
    "name" : "reunion-island"
  }, {
    "a2" : "CK",
    "name" : "cook-islands"
  }, {
    "a2" : "ER",
    "name" : "eritrea"
  }, {
    "a2" : "GE",
    "name" : "georgia"
  }, {
    "a2" : "MW",
    "name" : "malawi"
  }, {
    "a2" : "CO",
    "name" : "colombia"
  }, {
    "a2" : "GW",
    "name" : "guinea-bissau"
  }, {
    "a2" : "SN",
    "name" : "senegal"
  }, {
    "a2" : "TW",
    "name" : "taiwan"
  } ],
  "lastPage" : 25,
  "page" : 22,
  "pageSize" : 10,
  "totalCount" : 247
}%
```

## Search Parameter

Use this parameter to filter items by a search term. For example, search the countries API for the search term `united`.

### REST API Example

The cURL request:

```bash
curl \
	"http://localhost:8080/o/headless-admin-address/v1.0/countries?fields=a2,name&search=united" \
	-u "test@liferay.com:learn"
```

### GraphQL API Example

The GraphQL request:

```graphql
query {
	countries (search: "united") {
	   actions
		items {
		   a2
		   name
		}
      lastPage
      page
      pageSize
      totalCount
  }
} 
```

The JSON response:

```json
{
  "actions" : { },
  "facets" : [ ],
  "items" : [ {
    "a2" : "GB",
    "name" : "united-kingdom"
  }, {
    "a2" : "US",
    "name" : "united-states"
  }, {
    "a2" : "UM",
    "name" : "united-states-minor-outlying-islands"
  }, {
    "a2" : "VI",
    "name" : "united-states-virgin-islands"
  }, {
    "a2" : "AE",
    "name" : "united-arab-emirates"
  } ],
  "lastPage" : 1,
  "page" : 1,
  "pageSize" : 20,
  "totalCount" : 5
}%     
```

## Sort Parameter

Use this parameter to specify how you want to sort the items returned (i.e `asc` ascending or `desc` descending order). For example, sort the countries API by name in descending order.

### REST API Example

The cURL request:

```bash
curl \
	"http://localhost:8080/o/headless-admin-address/v1.0/countries?fields=a2,name&sort=name:desc" \
	-u "test@liferay.com:learn"
```

### GraphQL API Example

The GraphQL request:

```graphql
query {
	countries (sort: "name:desc") {
	   actions
		items {
		   a2
		   name
		}
      lastPage
      page
      pageSize
      totalCount
  }
} 
```

The JSON response:

```json
{
  "actions" : { },
  "facets" : [ ],
  "items" : [ {
    "a2" : "ZW",
    "name" : "zimbabwe"
  }, {
    "a2" : "ZM",
    "name" : "zambia"
  }, {
    "a2" : "YE",
    "name" : "yemen"
  }, {
    "a2" : "WS",
    "name" : "western-samoa"
  }, {
    "a2" : "EH",
    "name" : "western-sahara"
  }, {
    "a2" : "WF",
    "name" : "wallis-futuna"
  }, {
    "a2" : "VN",
    "name" : "vietnam"
  }, {
    "a2" : "VE",
    "name" : "venezuela"
  }, {
    "a2" : "VA",
    "name" : "vatican-city"
  }, {
    "a2" : "VU",
    "name" : "vanuatu"
  }, {
    "a2" : "UZ",
    "name" : "uzbekistan"
  }, {
    "a2" : "UY",
    "name" : "uruguay"
  }, {
    "a2" : "VI",
    "name" : "united-states-virgin-islands"
  }, {
    "a2" : "UM",
    "name" : "united-states-minor-outlying-islands"
  }, {
    "a2" : "US",
    "name" : "united-states"
  }, {
    "a2" : "GB",
    "name" : "united-kingdom"
  }, {
    "a2" : "AE",
    "name" : "united-arab-emirates"
  }, {
    "a2" : "UA",
    "name" : "ukraine"
  }, {
    "a2" : "UG",
    "name" : "uganda"
  }, {
    "a2" : "TV",
    "name" : "tuvalu"
  } ],
  "lastPage" : 13,
  "page" : 1,
  "pageSize" : 20,
  "totalCount" : 247
}%      
```

Note, not all API endpoints support the `sort` parameter. The endpoints that support it have `sort` listed as an optional parameter in the [API Explorer](./consuming-rest-services.md).

To sort by more than one parameter, separate the parameter names by commas and put them in order of priority. For example, to sort first by title and then by creation date, append `sort=title,dataCreated` to the request.

To specifiy a descending order for only one parameter, you must explicitly specify ascending sort order (`:asc`) for the other parameters. For example, `sort=headline:desc,dateCreated:asc`.
