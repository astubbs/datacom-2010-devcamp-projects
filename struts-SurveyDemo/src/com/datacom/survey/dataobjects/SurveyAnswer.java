package com.datacom.survey.dataobjects;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

@Entity
@NamedQueries(
		{         
			@NamedQuery(
					name="surveyAnswer.findAll",
					query="select h from SurveyAnswer h"
			),
			@NamedQuery(
					name="surveyAnswer.findSpecific",
					query="select h from SurveyAnswer h where id=:id"
			),
			@NamedQuery(
					name="surveyAnswer.delete",
			        query="delete from SurveyAnswer where id=:id" 
			)  
		}
	)

public class SurveyAnswer {
	
	private int id;
	private String answer;
	private Survey survey;
	private SurveyQuestion question;
	
	
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", updatable = false, nullable = false)

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	@ManyToOne( cascade = {CascadeType.PERSIST, CascadeType.MERGE} )
	public Survey getSurvey() {
		return survey;
	}
	public void setSurvey(Survey survey) {
		this.survey = survey;
	}
	@ManyToOne( cascade = {CascadeType.PERSIST, CascadeType.MERGE} )
	public SurveyQuestion getQuestion() {
		return question;
	}
	public void setQuestion(SurveyQuestion question) {
		this.question = question;
	}
}
