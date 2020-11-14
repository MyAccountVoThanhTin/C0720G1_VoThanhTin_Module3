package service;

import model.Products;

import java.util.List;

public interface IProductsServices {
    List<Products> getAllProducts();
    void saveProduct(Products products);
    void updateProduct(Products products);
    List<Products> finByName(String name);
    void deleteProduct(int id);
    Products getProduct(int id);
    void createProduct(Products products);
    List<Products> sort(String name);
}
