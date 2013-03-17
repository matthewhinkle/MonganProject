package com.mikehershey.cs480.project.data.access;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.UUID;

import zcd.commons.reflect.PropertyType;

import me.zcd.commons.iostore.FieldValue;

import com.google.appengine.api.users.User;
import com.mikehershey.cs480.project.AppContext;
import com.mikehershey.cs480.project.data.DesiredItem;

/**
 * Nice methods to deal with desired items.
 * 
 * (not for mongan:this doesn't require abstraction as ObjectStore is already providing
 * a persistence layer abstraction)
 *
 * @author mikehershey
 */
public enum DesiredItems {
	INSTANCE;
	
	public DesiredItem get(String productKey, User user) {
		DesiredItem ret = null;
		List<DesiredItem> results = AppContext.INSTANCE.getDesiredItemStore().query().equals(new FieldValue("productKey", productKey, PropertyType.String)).equals(new FieldValue("userId", user.getUserId(), PropertyType.String)).execute();
		if(results != null && results.size() > 0) {
			if(results.size() > 1) {
				throw new IllegalStateException("Shouldn't be able to get more then 1 desired item for the same product!");
			}
			return results.get(0);
		}
		return ret;
	}
	
	public Collection<DesiredItem> get(User user) {
		List<DesiredItem> results = AppContext.INSTANCE.getDesiredItemStore().query().equals(new FieldValue("userId", user.getUserId(), PropertyType.String)).execute();
		if(results != null && results.size() > 0) {
			return results;
		}
		return new ArrayList<DesiredItem>();
	}
	
	public DesiredItem upsert(DesiredItem desired) {
		if(desired.getKey() == null || desired.getKey().isEmpty()) {
			final String uuid = UUID.randomUUID().toString();
			desired.setKey(uuid);
		}
		AppContext.INSTANCE.getDesiredItemStore().put(desired.getKey(), desired);
		return desired;
	}
	
}
