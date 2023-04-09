package org.zerock.wecart.exception;

public class ControllerException extends Exception {

	private static final long serialVersionUID = 1L;
	
	public ControllerException (String message) {
		super(message);
	} // constructor #1
	
	public ControllerException (Exception originalException) {
		super(originalException);
	} // constructor #2
}
