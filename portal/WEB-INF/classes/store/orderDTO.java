package store;

public class orderDTO {
	
	private int orderID;
	private String userName;
	private String productID;
	private String productName;
	private int productAmount =0;
	private String userID;
	private Boolean payConfirm;
	private int tpamount;
	public int getTpamount() {
		return tpamount;
	}
	public void setTpamount(int tpamount) {
		this.tpamount = tpamount;
	}
	public int getOrderID() {
		return orderID;
	}
	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getProductID() {
		return productID;
	}
	public void setProductID(String productID) {
		this.productID = productID;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductAmount() {
		return productAmount;
	}
	public void setProductAmount(int productAmount) {
		this.productAmount = productAmount;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public Boolean getPayConfirm() {
		return payConfirm;
	}
	public void setPayConfirm(Boolean payConfirm) {
		this.payConfirm = payConfirm;
	}
	
	
}
