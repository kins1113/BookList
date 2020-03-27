package com.book.bookList.common;

public class WebUtility {
	public static final int BLOCK_SIZE=10;
	public static int RECORD_COUNT_PER_PAGE=10;
	public static int ZIPCODE_RECORD_COUNT_PER_PAGE=10;
	
	
	public static String RandomNum() {
		StringBuffer buffer=new StringBuffer();
		for(int i=0;i<=6;i++) {
			int n=(int) (Math.random()*10);
			buffer.append(n);
		}
		return buffer.toString();
	}
	
}
