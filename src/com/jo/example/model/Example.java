package com.jo.example.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 样例pojo对象
 * @author Administrator
 *
 */
@Entity
@Table(name="t_example", catalog="journey_info_db")
public class Example implements Serializable
{
	private static final long serialVersionUID = 1L;
	public Example() {
		super();
	}
	@Id
    @Column(name="example_id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer exampleId;
	@Column(name="example_name1")
	private String exampleName1;
	@Column(name="example_name2")
	private String exampleName2;
	@Column(name="example_name3")
	private String exampleName3;
	@Column(name="example_name4")
	private Date exampleName4;
	public Integer getExampleId() {
		return exampleId;
	}
	public void setExampleId(Integer exampleId) {
		this.exampleId = exampleId;
	}
	public String getExampleName1() {
		return exampleName1;
	}
	public void setExampleName1(String exampleName1) {
		this.exampleName1 = exampleName1;
	}
	public String getExampleName2() {
		return exampleName2;
	}
	public void setExampleName2(String exampleName2) {
		this.exampleName2 = exampleName2;
	}
	public String getExampleName3() {
		return exampleName3;
	}
	public void setExampleName3(String exampleName3) {
		this.exampleName3 = exampleName3;
	}
	public Date getExampleName4() {
		return exampleName4;
	}
	public void setExampleName4(Date exampleName4) {
		this.exampleName4 = exampleName4;
	}
	
}
