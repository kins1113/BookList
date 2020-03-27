package com.book.bookList.categorieDTO;

public class CategorieDTO {
	private int cateNo;
	private String cateName;
	private String cateInfo;
	private String useCk;
	
	public CategorieDTO() {
		super();
	}

	public CategorieDTO(int cateNo, String cateName, String cateInfo, String useCk) {
		super();
		this.cateNo = cateNo;
		this.cateName = cateName;
		this.cateInfo = cateInfo;
		this.useCk = useCk;
	}

	public int getCateNo() {
		return cateNo;
	}

	public void setCateNo(int cateNo) {
		this.cateNo = cateNo;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	public String getCateInfo() {
		return cateInfo;
	}

	public void setCateInfo(String cateInfo) {
		this.cateInfo = cateInfo;
	}

	public String getUseCk() {
		return useCk;
	}

	public void setUseCk(String useCk) {
		this.useCk = useCk;
	}

	@Override
	public String toString() {
		return "CategorieDTO [cateNo=" + cateNo + ", cateName=" + cateName + ", cateInfo=" + cateInfo + ", useCk="
				+ useCk + "]";
	}


	
	
}
