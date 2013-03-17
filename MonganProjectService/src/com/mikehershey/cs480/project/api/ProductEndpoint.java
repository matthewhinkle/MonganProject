package com.mikehershey.cs480.project.api;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.inject.Named;

import com.google.api.server.spi.config.Api;
import com.google.api.server.spi.config.ApiMethod;
import com.mikehershey.cs480.project.AppContext;
import com.mikehershey.cs480.project.data.Product;
import com.mikehershey.cs480.project.data.access.Products;
import com.mikehershey.cs480.project.upc.UpcResolver;
import com.mikehershey.cs480.project.upc.UpcResolver.InvalidUpcException;

@Api(name = "product")
public class ProductEndpoint {

	@ApiMethod(name = "search.upc")
	public Collection<Product> requestByUpc(@Named("upc") String upc) {
		//first maybe we already have it in our database
		Collection<Product> p = Products.INSTANCE.getProductByUpc(upc);
		if(p != null && p.size() > 0) {
			return p;
		}
		//Ok lets query all of our providers and return possible results.
		List<Product> ret = new ArrayList<Product>();
		for(UpcResolver resolver : AppContext.INSTANCE.getUpcResolvers()) {
			try {
				ret.add(resolver.findProductByBarcode(upc));
			} catch (InvalidUpcException e) {
			}
		}
		return ret;
	}
	
	@ApiMethod(name = "search.name")
	public Collection<Product> requestByName(@Named("name") String name) {
		Collection<Product> products = Products.INSTANCE.getProductsLikeName(name);
		return products;
	}
	
	@ApiMethod(name = "insert")
	public Product insert(Product product) {
		return Products.INSTANCE.addProduct(product);
	}
	
	@ApiMethod(name = "update")
	public Product update(Product product) {
		return Products.INSTANCE.updateProduct(product);
	}

}
