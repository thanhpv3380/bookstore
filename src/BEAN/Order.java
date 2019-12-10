package BEAN;

import java.util.Date;

public class Order extends Users{
	private int id_order;
	private String name;
	private String phone;
	private String address;
	private Date date_send;
	private Date date_receive;
	private float money;
	public Order() {
		super();
	}
	public int getId_order() {
		return id_order;
	}
	public void setId_order(int id_order) {
		this.id_order = id_order;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getDate_send() {
		return date_send;
	}
	public void setDate_send(Date date_send) {
		this.date_send = date_send;
	}
	public Date getDate_receive() {
		return date_receive;
	}
	public void setDate_receive(Date date_receive) {
		this.date_receive = date_receive;
	}
	public float getMoney() {
		return money;
	}
	public void setMoney(float money) {
		this.money = money;
	}
}
