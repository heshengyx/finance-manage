package com.myself.finance.security;

import org.apache.shiro.authc.AuthenticationException;

public class IncorrectException extends AuthenticationException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8916053470505275181L;

	public IncorrectException(String message) {
		super(message);
	}

	public IncorrectException(Throwable cause) {
		super(cause);
	}
}
