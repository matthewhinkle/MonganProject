package com.mikehershey.cs480.project.upc;

import com.google.api.client.googleapis.services.GoogleClientRequestInitializer;
import com.google.api.services.shopping.ShoppingRequestInitializer;
import com.mikehershey.cs480.project.data.Product;

public class GoogleProductSearch implements UpcResolver {

	public static final GoogleClientRequestInitializer KEY_INITIALIZER =
		      new ShoppingRequestInitializer("AIzaSyCwtZ_eLYriGUIScujAAI_Ed4WDTBfB_wk");

	@Override
	public Product findProductByBarcode(String barcode) throws InvalidUpcException {
		//google sucks.
		return null;
	}

	
	
}
