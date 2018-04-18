---
title: Домашняя страница
permalink: index.html
sidebar: evomain
topnav: topnav
---

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

## Section

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

Примеры

{% include tabs.html %}

```java
const products = await new ProductQuery()
        .alcoholByVolume.between(40, 70)
        .intersection(new ProductQuery()
            .price.greater(100, true)
            .or().tareVolume.greater(10)
            .union(new ProductQuery()
                .price.lower(5)
                .and().name.like("Водка")
            )
        ).sortOrder(new ProductSortOrder()
            .price.asc()
            .alcoholByVolume.desc()
            .tareVolume.asc()
        ).limit(1000)
        .execute();
```
```kotlin
const products = await new ProductQuery()
        .alcoholByVolume.between(40, 70)
        .intersection(new ProductQuery()
            .price.greater(100, true)
            .or().tareVolume.greater(10)
            .union(new ProductQuery()
                .price.lower(5)
                .and().name.like("Водка")
            )
        ).sortOrder(new ProductSortOrder()
            .price.asc()
            .alcoholByVolume.desc()
            .tareVolume.asc()
        ).limit(1000)
        .execute();
```
