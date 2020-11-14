package repository;

import model.Products;

import java.util.List;

public interface IProductRepository {
    List<Products> getAllProducts();
    void saveProduct(Products products);
    void updateProduct(Products products);
    List<Products> findByName(String name);
    void deletePRoduct(int id);
    Products getProduct(int id);
    void createProduct(Products products);
    List<Products> sort(String name);
}
