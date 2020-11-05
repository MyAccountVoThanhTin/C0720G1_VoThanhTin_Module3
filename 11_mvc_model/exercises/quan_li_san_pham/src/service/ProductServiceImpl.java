package service;

import model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements ProductService {
    private static Map<Integer,Product> listProduct;
    static {
        listProduct = new HashMap<>();
        listProduct.put(1,new Product(1,"banh","10000","VN"));
        listProduct.put(2,new Product(2,"banh","10000","VN"));
        listProduct.put(3,new Product(3,"banh","10000","VN"));
        listProduct.put(4,new Product(4,"banh","10000","VN"));
        listProduct.put(5,new Product(5,"banh","10000","VN"));
    }
    @Override
    public List<Product> showAllProduct() {
        return new ArrayList<>(listProduct.values());
    }

    @Override
    public void saveProduct(Product product) {
        listProduct.put(product.getId(),product);
    }

    @Override
    public void deleteProduct(int id) {
        listProduct.remove(id);
    }

    @Override
    public Product findByName(String name) {
        Product product1 = null;
        List<Product> list = new ArrayList<>(listProduct.values());
        for (Product product: list){
            if(name.equals(product.getName())){
                product1 = new Product(product.getId(),product.getName(),product.getCost(),product.getNsx());
            }
        }
        return listProduct.get(product1.getId());
    }

    @Override
    public Product showDetails(int id) {
        return null;
    }
    public Product findById(int id){
        return listProduct.get(id);
    }
}
