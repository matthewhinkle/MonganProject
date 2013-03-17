package com.mikehershey.cs480.project.upc;

import com.google.gson.Gson;
import com.mikehershey.cs480.project.data.Product;
import com.mikehershey.cs480.project.utils.HttpClient;

public class UpcDatabaseImpl implements UpcResolver {

	private static String baseUrl = "http://upcdatabase.org/api/json/1ba9b7550b250f75c27a136377f1cfe1/";
	
	public static class UpcDatabaseResponse {
		
		private boolean valid;
		private String itemname;
		private String description;
		private int price;

		/**
		 * @return the valid
		 */
		public boolean isValid() {
			return valid;
		}

		/**
		 * @param valid the valid to set
		 */
		public void setValid(boolean valid) {
			this.valid = valid;
		}

		/**
		 * @return the itemname
		 */
		public String getItemname() {
			return itemname;
		}

		/**
		 * @param itemname the itemname to set
		 */	
		public void setItemname(String itemname) {
			this.itemname = itemname;
		}

		/**
		 * @return the description
		 */
		public String getDescription() {
			return description;
		}

		/**
		 * @param description the description to set
		 */
		public void setDescription(String description) {
			this.description = description;
		}

		/**
		 * @return the price
		 */
		public int getPrice() {
			return price;
		}

		/**
		 * @param price the price to set
		 */
		public void setPrice(int price) {
			this.price = price;
		}
		
	}

	@Override
	public Product findProductByBarcode(String barcode) throws InvalidUpcException {
		Gson gson = new Gson();
		UpcDatabaseResponse response = gson.fromJson(HttpClient.getContentsOfURL(baseUrl + barcode), UpcDatabaseResponse.class);
		if(!response.isValid()) {
			throw new InvalidUpcException();
		}
		Product ret = new Product();
		ret.setPriceTime100(response.getPrice() * 100);
		ret.setProductDiscription(response.getDescription());
		ret.setProductName(response.getItemname());
		ret.setUpcCode(barcode);
		return ret;
	}

}
