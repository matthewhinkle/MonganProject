package com.mikehershey.cs480.project;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import me.zcd.commons.iostore.IndexedObjectStore;
import me.zcd.commons.ostore.appengine.AppEngineObjectStore;

import com.mikehershey.cs480.project.data.DesiredItem;
import com.mikehershey.cs480.project.data.Product;
import com.mikehershey.cs480.project.upc.UpcDatabaseImpl;
import com.mikehershey.cs480.project.upc.UpcResolver;
import com.mikehershey.cs480.project.upc.ScanditProductFinderImpl;

/**
 * Singleton app context
 *
 * @author mikehershey
 */
public enum AppContext {
    INSTANCE;
   
    public Collection<UpcResolver> getUpcResolvers() {
    	List<UpcResolver> ret = new ArrayList<UpcResolver>();
    	ret.add(new UpcDatabaseImpl());
    	ret.add(new ScanditProductFinderImpl());
    	return ret;
    }
    
    public IndexedObjectStore<DesiredItem> getDesiredItemStore() {
    	return new AppEngineObjectStore<DesiredItem>("desiredItem", DesiredItem.class);
    }
    
    public IndexedObjectStore<Product> getProductStore() {
    	return new AppEngineObjectStore<Product>("products", Product.class);
    }
    
}