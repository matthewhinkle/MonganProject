package com.mikehershey.cs480.project.api;

import java.util.Collection;

import javax.inject.Named;

import com.google.api.server.spi.ServiceException;
import com.google.api.server.spi.config.Api;
import com.google.api.server.spi.config.ApiMethod;
import com.google.appengine.api.users.User;
import com.mikehershey.cs480.project.AppContext;
import com.mikehershey.cs480.project.data.DesiredItem;
import com.mikehershey.cs480.project.data.access.DesiredItems;

@Api(
		name = "useritems", 
		scopes = {"https://www.googleapis.com/auth/userinfo.email"},
		clientIds = {"com.google.api.server.spi.Constant.API_EXPLORER_CLIENT_ID", "284201423717.apps.googleusercontent.com"}
)
public class DesiredItemEndpoint {

	@ApiMethod(name = "upsert", httpMethod = "GET")
	public DesiredItem upsert(@Named("productKey") String productKey, @Named("desired") long desired, @Named("have") long have, User user) throws ServiceException {
		//auth check
		if(user == null) {
			throw new com.google.api.server.spi.ServiceException(403, "Not Autenticated");
		}
		//quest for existing desired items
		DesiredItem item = DesiredItems.INSTANCE.get(productKey, user);
		if(item == null) {
			item = new DesiredItem();
			item.setUserId(user.getUserId());
			item.setProductKey(productKey);
		}
		item.setDesired(desired);
		item.setOwned(have);
		DesiredItems.INSTANCE.upsert(item);
		return item;
	}

	@ApiMethod(name = "delete")
	public void delete(@Named("productKey") String productKey, User user) throws ServiceException {
		if(user == null) {
			throw new com.google.api.server.spi.ServiceException(403, "Not Autenticated");
		}
		//quest for existing desired items
		DesiredItem item = DesiredItems.INSTANCE.get(productKey, user);
		if(item != null) {
			AppContext.INSTANCE.getDesiredItemStore().delete(item.getKey());
		}
		throw new com.google.api.server.spi.ServiceException(200, "OK");
	}
	
	@ApiMethod(name = "list")
	public Collection<DesiredItem> list(User user) throws ServiceException {
		if(user == null) {
			throw new com.google.api.server.spi.ServiceException(403, "Not Autenticated");
		}
		return DesiredItems.INSTANCE.get(user);
	}

}
