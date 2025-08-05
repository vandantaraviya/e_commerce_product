# e_commerce_product

A modern Flutter-based e-commerce product browser application.  
This project demonstrates clean architecture, remote API integration, image caching, and efficient
state management using `Provider`.

---

## 🧰 Packages Used

| Package                                                                          | Purpose                                                        |
|----------------------------------------------------------------------------------|----------------------------------------------------------------|
| [`http`](https://pub.dev/packages/http) `^1.4.0`                                 | To make HTTP requests and fetch product data from a remote API |
| [`cached_network_image`](https://pub.dev/packages/cached_network_image) `^3.4.1` | To efficiently load and cache product images                   |
| [`provider`](https://pub.dev/packages/provider) `^6.1.5`                         | For state management of products, favorites, and cart data     |

---

## 🗂️ State Management Approach

The app uses the **`Provider`** package to manage and expose application state across widgets.  
Main state classes include:

- **ProductProvider**:  
  Handles product listing, cart management, and favorite toggling.