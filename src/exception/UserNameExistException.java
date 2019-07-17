package exception;

public class UserNameExistException extends Exception {

	public UserNameExistException() {
		super();
	}

	public UserNameExistException(String message, Throwable cause, boolean enableSuppression,
			boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public UserNameExistException(String message, Throwable cause) {
		super(message, cause);
	}

	public UserNameExistException(String message) {
		super(message);
	}

	public UserNameExistException(Throwable cause) {
		super(cause);
	}
	
	
}
