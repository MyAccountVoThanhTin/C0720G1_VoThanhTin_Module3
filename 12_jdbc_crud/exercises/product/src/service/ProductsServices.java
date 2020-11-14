package service;

import model.Products;
import repository.ProductsRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductsServices implements IProductsServices {
    ProductsRepository productsRepository = new ProductsRepository();
    @Override
    public List<Products> getAllProducts() {
        return productsRepository.getAllProducts();
    }

    @Override
    public void saveProduct(Products products) {
        productsRepository.saveProduct(products);
    }

    @Override
    public void updateProduct(Products products) {

    }

    @Override
    public List<Products> finByName(String name) {
        return   productsRepository.findByName(name);
    }

    @Override
    public void deleteProduct(int id) {
        productsRepository.deletePRoduct(id);
    }

    @Override
    public Products getProduct(int id) {
        return productsRepository.getProduct(id);
    }

    @Override
    public void createProduct(Products products) {
        productsRepository.createProduct(products);
    }

    @Override
    public List<Products> sort(String name) {
        return productsRepository.sort(name);
    }


}
