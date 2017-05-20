package user;

public class UserDTO {
	private String userID;
	private String userPasswd;
	private String userName;
	private String userMail;
	private String ANDROID_ID;
	private String userAgesection;
	private String userInteresting;
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPasswd() {
		return userPasswd;
	}
	public void setUserPasswd(String userPasswd) {
		this.userPasswd = userPasswd;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getUserMail() {
		return userMail;
	}
	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}
	public String getANDROID_ID() {
		return ANDROID_ID;
	}
	public void setANDROID_ID(String ANDROID_ID) {
		this.ANDROID_ID = ANDROID_ID;
	}
	public String getUserAgesection() {
		return userAgesection;
	}
	public void setUserAgesection(String userAgesection) {
		this.userAgesection = userAgesection;
	}
	public String getUserInteresting() {
		return userInteresting;
	}
	public void setUserInteresting(String userInteresting) {
		this.userInteresting = userInteresting;
	}
}
