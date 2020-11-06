package service;

import model.Products;
import repository.ProductsRepository;

import java.util.List;

public class ProductsServices implements IProductsServices {
    ProductsRepository productsRepository = new ProductsRepository();
    @Override
    public List<Products> getAllProducts() {
        return productsRepository.getAllProducts();
    }

    @Override
    public void saveProduct(Products products) {

    }

    @Override
    public void updateProduct(Products products) {

    }

    @Override
    public Products findByName(String name) {
        return null;
    }
}
