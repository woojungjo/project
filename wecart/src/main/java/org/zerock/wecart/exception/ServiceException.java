package org.zerock.wecart.exception;

public class ServiceException extends Exception {

	private static final long serialVersionUID = 1L;
	
	public ServiceException (String message) {
		super(message);
	} // constructor #1
	
	public ServiceException (Exception originalException) {
		super(originalException);
	} // constructor #2
}
