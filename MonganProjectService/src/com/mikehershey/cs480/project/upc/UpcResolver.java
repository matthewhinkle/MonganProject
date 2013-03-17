package com.mikehershey.cs480.project.upc;

import com.mikehershey.cs480.project.data.Product;

public interface UpcResolver {

	public static class InvalidUpcException extends Exception {
		private static final long serialVersionUID = 1L;

		public InvalidUpcException() {
			super();
		}

		public InvalidUpcException(String message, Throwable cause) {
			super(message, cause);
		}

		public InvalidUpcException(String message) {
			super(message);
		}

		public InvalidUpcException(Throwable cause) {
			super(cause);
		}
		
	}
	
	public Product findProductByBarcode(String barcode) throws InvalidUpcException;
	
}
