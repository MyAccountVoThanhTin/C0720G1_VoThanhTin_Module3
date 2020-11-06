package service;

import model.Products;

import java.util.List;

public interface IProductsServices {
    List<Products> getAllProducts();
    void saveProduct(Products products);
    void updateProduct(Products products);
    Products findByName(String name);
}
