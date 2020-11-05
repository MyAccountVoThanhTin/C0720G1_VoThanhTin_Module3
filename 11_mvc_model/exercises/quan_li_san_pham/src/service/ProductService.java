package service;

import model.Product;

import java.util.List;

public interface ProductService {
    List<Product> showAllProduct();
    void saveProduct(Product product);
    void deleteProduct(int id);
    Product findByName(String name);
    Product showDetails(int id);
    Product findById(int id);
}
