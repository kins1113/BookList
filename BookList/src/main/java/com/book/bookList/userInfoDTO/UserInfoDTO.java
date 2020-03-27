package com.book.bookList.userInfoDTO;

public class UserInfoDTO {
	private int no;
	private String name;
	private String birthday;
	private String tel;
	private String location;
	private String gender;
	
	public UserInfoDTO() {
		super();
	}

	public UserInfoDTO(int no, String name, String birthday, String tel, String location, String gender) {
		super();
		this.no = no;
		this.name = name;
		this.birthday = birthday;
		this.tel = tel;
		this.location = location;
		this.gender = gender;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "UserInfoDTO [no=" + no + ", name=" + name + ", birthday=" + birthday + ", tel=" + tel + ", location="
				+ location + ", gender=" + gender + "]";
	}
	
	
	
}
