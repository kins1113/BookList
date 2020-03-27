package com.book.bookList.bookinfoDTO;

public class BookinfoDTO {
	private int bookNo;
	private String bookName;
	private String author;
	private String publisher;
	private int price;
	private String readCheck;
	
	@Override
	public String toString() {
		return "BookinfoDTO [bookNo=" + bookNo + ", bookName=" + bookName + ", author=" + author + ", publisher="
				+ publisher + ", price=" + price + ", readCheck=" + readCheck + "]";
	}
	public int getBookNo() {
		return bookNo;
	}
	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getReadCheck() {
		return readCheck;
	}
	public void setReadCheck(String readCheck) {
		this.readCheck = readCheck;
	}
	
	
	
}
