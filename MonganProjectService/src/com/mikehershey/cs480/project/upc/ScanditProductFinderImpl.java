package com.mikehershey.cs480.project.upc;

import com.google.gson.Gson;
import com.mikehershey.cs480.project.data.Product;
import com.mikehershey.cs480.project.utils.HttpClient;

public class ScanditProductFinderImpl implements UpcResolver {

	private static final String URL = "https://api.scandit.com/v2/products/%s?key=cd_X_TOepvSlPsyhUxDcmgXo3yJhnWLeEZJsJn4HWK4";

	@Override
	public Product findProductByBarcode(String barcode) throws InvalidUpcException {
		String url = String.format(URL, barcode);
		Gson gson = new Gson();
		ScanditResponse response = gson.fromJson(HttpClient.getContentsOfURL(url), ScanditResponse.class);
		Product ret = new Product();
		ret.setUpcCode(barcode);
		ret.setProductName(response.basic.name);
		return ret;
	}
	
	public static class ScanditResponse {
		ScanditBasicResponse basic;
	}
	
	public static class ScanditBasicResponse {
		String name;
	}

}
