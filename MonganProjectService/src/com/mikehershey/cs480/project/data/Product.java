package com.mikehershey.cs480.project.data;

import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;

@PersistenceCapable
public class Product {

	@Persistent
	private String key;

	@Persistent
	private String upcCode;
	
	@Persistent
	private String productName;
	
	@Persistent
	private int priceTime100;
	
	@Persistent
	private String imageUrl;
	
	@Persistent
	private String productDiscription;
	
	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	/**
	 * @return the upcCode
	 */
	public String getUpcCode() {
		return upcCode;
	}

	/**
	 * @param upcCode the upcCode to set
	 */
	public void setUpcCode(String upcCode) {
		this.upcCode = upcCode;
	}

	/**
	 * @return the productName
	 */
	public String getProductName() {
		return productName;
	}

	/**
	 * @param productName the productName to set
	 */
	public void setProductName(String productName) {
		this.productName = productName;
	}

	/**
	 * @return the priceTime100
	 */
	public int getPriceTime100() {
		return priceTime100;
	}

	/**
	 * @param priceTime100 the priceTime100 to set
	 */
	public void setPriceTime100(int priceTime100) {
		this.priceTime100 = priceTime100;
	}

	/**
	 * @return the imageUrl
	 */
	public String getImageUrl() {
		return imageUrl;
	}

	/**
	 * @param imageUrl the imageUrl to set
	 */
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	/**
	 * @return the productDiscription
	 */
	public String getProductDiscription() {
		return productDiscription;
	}

	/**
	 * @param productDiscription the productDiscription to set
	 */
	public void setProductDiscription(String productDiscription) {
		this.productDiscription = productDiscription;
	}
	
}
