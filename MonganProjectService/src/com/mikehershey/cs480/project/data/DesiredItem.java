package com.mikehershey.cs480.project.data;

import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;

@PersistenceCapable
public class DesiredItem {

	@Persistent
	private String key;
	
	@Persistent
	private String productKey; 
	
	@Persistent
	private String userId;
	
	@Persistent
	private long desired;
	
	@Persistent
	private long owned;

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getProductKey() {
		return productKey;
	}

	public void setProductKey(String productKey) {
		this.productKey = productKey;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public long getDesired() {
		return desired;
	}

	public void setDesired(long desired) {
		this.desired = desired;
	}

	public long getOwned() {
		return owned;
	}

	public void setOwned(long owned) {
		this.owned = owned;
	}
	
}
