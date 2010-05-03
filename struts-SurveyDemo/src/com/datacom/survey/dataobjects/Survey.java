package com.datacom.survey.dataobjects;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;


@Entity
@NamedQueries(
		{         
			@NamedQuery(
					name="survey.findAll",
					query="select h from Survey h order by h.startDate asc"
			),
			@NamedQuery(
					name="survey.findSpecific",
					query="select h from Survey h where id=:id"
			),
			@NamedQuery(
					name="survey.delete",
			        query="delete from Survey where id=:id" 
			)  
		}
	)
public class Survey {

	private int id;
	private Date startDate;
	private int score;
	private List<SurveyAnswer> answers;
	
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", updatable = false, nullable = false)
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@OneToMany(mappedBy="survey", cascade=CascadeType.ALL)
	public List<SurveyAnswer> getAnswers() {
		return answers;
	}
	public void setAnswers(List<SurveyAnswer> answers) {
		this.answers = answers;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	
	
}
