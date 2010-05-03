package com.datacom.survey.dataobjects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;


@Entity
@NamedQueries(
		{         
			@NamedQuery(
					name="surveyQuestion.findAll",
					query="select h from SurveyQuestion h order by h.questionNo asc"
			),
			@NamedQuery(
					name="surveyQuestion.findSpecific",
					query="select h from SurveyQuestion h where id=:id"
			),
			@NamedQuery(
					name="surveyQuestion.delete",
			        query="delete from SurveyQuestion where id=:id" 
			)  
		}
	)
public class SurveyQuestion {

	private int id;
	private int questionNo;
	private String questionText;
	private String questionHelp;
	
	
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", updatable = false, nullable = false)
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getQuestionNo() {
		return questionNo;
	}
	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}
	public String getQuestionText() {
		return questionText;
	}
	public void setQuestionText(String questionText) {
		this.questionText = questionText;
	}
	public String getQuestionHelp() {
		return questionHelp;
	}
	public void setQuestionHelp(String questionHelp) {
		this.questionHelp = questionHelp;
	}
}
