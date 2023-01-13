package com.yg.dto;

public class BoardDetailDTO {
	private int bno;
	private String title;
	private String content;
	private String writer;
	private String name;
	private String writedate;
	
	public BoardDetailDTO(int bno, String title, String content, String writer, String name, String writedate) {
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.name = name;
		this.writedate = writedate;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getWritedate() {
		return writedate;
	}

	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	
	
}







