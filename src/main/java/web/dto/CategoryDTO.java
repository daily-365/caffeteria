package web.dto;

public class CategoryDTO {
/*
	 CATENAME                                 NOT NULL VARCHAR2(20)
	 CATECODE                                 NOT NULL VARCHAR2(30)
	 CATECODEREF                                       VARCHAR2(30)
	*/
	
	private String cateName;
	private String cateCode;
	private String cateCodeRef;
	
    private int cateLevel;

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	public String getCateCode() {
		return cateCode;
	}

	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}

	public String getCateCodeRef() {
		return cateCodeRef;
	}

	public void setCateCodeRef(String cateCodeRef) {
		this.cateCodeRef = cateCodeRef;
	}

	public int getcateLevel() {
		return cateLevel;
	}

	public void setcateLevel(int cateLevel) {
		this.cateLevel = cateLevel;
	}

	@Override
	public String toString() {
		return "CategoryVO [cateName=" + cateName + ", cateCode=" + cateCode + ", cateCodeRef=" + cateCodeRef
				+ ", cateLevel=" + cateLevel + "]";
	}
	
    
}