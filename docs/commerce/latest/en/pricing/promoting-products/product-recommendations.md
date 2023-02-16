---
toc:
  - ./product-recommendations/using-product-recommendations.md
  - ./product-recommendations/understanding-recommendation-types.md
uuid: d483669d-426f-464f-9cc7-7329e66b3f99
---
# Product Recommendations

{bdg-primary}`Subscription`

```{toctree}
:maxdepth: 1

product-recommendations/using-product-recommendations.md
product-recommendations/understanding-recommendation-types.md
```

Liferay supports both content- and user-based product recommendations. You can display these using Product and Order data from your Liferay instance.

To get started, see [Using Product Recommendations](./product-recommendations/using-product-recommendations.md). 

There are five types of product recommendations. Each can be used in different Site contexts to engage your customers with relevant Products at every stage of their shopping experience.

* **Content-Based Product Recommendations:** Recommends Products similar to the currently viewed Product.
* **User Personalized Recommendations:** Recommends Products based on the purchase history of similar customers
* **Context Aware User Personalized Recommendations:** Recommends Products of similar categories and the buying history of similar customers
* **"You May Also Like" Recommendations:** Recommends Products based on the purchase history of all customers
* **Also-Bought Product Recommendations:** Recommends Products frequently purchased with the viewed Product

```{important}
Customer similarity is currently determined by their purchase histories only. Two customers are similar if they have both purchased the same product.
```

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} Using Product Recommendations
:link: ./product-recommendations/using-product-recommendations.md
:::

:::{grid-item-card} Understanding Recommendation Types
:link: ./product-recommendations/understanding-recommendation-types.md
:::
::::
