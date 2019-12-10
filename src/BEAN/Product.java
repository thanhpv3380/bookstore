package BEAN;

public class Product {
	private int id_product;
	private String name;
	private String img;
	private float price;
	private String detail;
	private int amount;
	private String dimension;
	private int weight;
	private String author;
	private String publisher;
	private String categoryprod;
	private int year;
	private int id_author;
	private int id_publisher;
	private int id_categoryprod;
	public int getId_product() {
		return id_product;
	}
	public void setId_product(int id_product) {
		this.id_product = id_product;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getDimension() {
		return dimension;
	}
	public void setDimension(String dimension) {
		this.dimension = dimension;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getCategoryprod() {
		return categoryprod;
	}
	public void setCategoryprod(String categoryprod) {
		this.categoryprod = categoryprod;
	}
	public int getId_author() {
		return id_author;
	}
	public void setId_author(int id_author) {
		this.id_author = id_author;
	}
	public int getId_publisher() {
		return id_publisher;
	}
	public void setId_publisher(int id_publisher) {
		this.id_publisher = id_publisher;
	}
	public int getId_categoryprod() {
		return id_categoryprod;
	}
	public void setId_categoryprod(int id_categoryprod) {
		this.id_categoryprod = id_categoryprod;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	
}
