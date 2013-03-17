package com.mikehershey.cs480.project.data.access;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.UUID;

import zcd.commons.reflect.PropertyType;
import me.zcd.commons.iostore.FieldValue;

import com.mikehershey.cs480.project.AppContext;
import com.mikehershey.cs480.project.data.Product;
import com.mikehershey.cs480.project.utils.LevenshteinDistance;

/**
 * Methods to access products from the database
 * 
 * (not for mongan:this doesn't require abstraction as ObjectStore is already providing
 * a persistence layer abstraction)
 *
 * @author mikehershey
 */
public enum Products {
	INSTANCE;
	
	private LevenshteinDistance levenshteinDistance = new LevenshteinDistance();
	
	public Collection<Product> getProductByUpc(String upc) {
		List<Product> products = AppContext.INSTANCE.getProductStore().query().equals(new FieldValue("upcCode", upc, PropertyType.String)).execute();
		return products; 
	}
	
	public Collection<Product> getProductsLikeName(String name) {
		List<Product> ret = new ArrayList<Product>();
		Collection<Product> products = AppContext.INSTANCE.getProductStore().scan();
		int distance = 0;
		while(ret.size() < 3 && !(ret.size() >= products.size())) {
			for(Product product : products) {
				if(levenshteinDistance.levenshteinDistance(name, product.getProductName()) == distance) {
					ret.add(product);
				}
			}
			distance++;
			if(distance > 10) {
				break;
			}
		}
		return ret;
	}
	
	public Product addProduct(Product product) {
		final String uuid = UUID.randomUUID().toString();
		product.setKey(uuid);
		AppContext.INSTANCE.getProductStore().put(uuid, product);
		return product;
	}
	
	public Product updateProduct(Product product) {
		AppContext.INSTANCE.getProductStore().put(product.getKey(), product);
		return product;
	}
	
}
