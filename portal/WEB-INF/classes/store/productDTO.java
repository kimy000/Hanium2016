package store;

public class productDTO {
	private String productID;
	private String storeID;
	private String productName;
	private int price;
	private String imageUrl;
	private int amount;
	public String getProductID() {
		return productID;
	}
	public void setProductID(String productID) {
		this.productID = productID;
	}
	public String getStoreID() {
		return storeID;
	}
	public void setStoreID(String storeID) {
		this.storeID = storeID;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public boolean isBestMenu() {
		return BestMenu;
	}
	public void setBestMenu(boolean bestMenu) {
		BestMenu = bestMenu;
	}
	private boolean BestMenu;
	
}
