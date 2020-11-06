package repository;

import model.Products;

import java.util.List;

public interface IProductRepository {
    List<Products> getAllProducts();
    void saveProduct(Products products);
    void updateProduct(Products products);
    Products findByName(String name);
}
