package com.datacom.survey.action;

import java.util.List;

import com.datacom.survey.dataobjects.SurveyQuestion;
import com.datacom.survey.services.SurveyQuestionService;
import com.opensymphony.xwork2.ActionSupport;

public class SurveyQuestionAction extends ActionSupport{

	private int id;
	private SurveyQuestion question;
	private List<SurveyQuestion> questions;
	
	private static String READ = "read";
	
	public String execute() throws Exception {
		questions = SurveyQuestionService.getSurveyQuestions();
		
		return SUCCESS;
	}
	
	public String read() throws Exception {
		question = SurveyQuestionService.getSurveyQuestion(id);
		
		return READ;
	}
	
	public String edit() throws Exception {
		question = SurveyQuestionService.getSurveyQuestion(id);
		
		return INPUT;
	}
	
	public String create() throws Exception {
		question = new SurveyQuestion();
		
		return INPUT;
	}
	
	public String update() throws Exception {
		SurveyQuestionService.updateSurveyQuestion(question);
		
		return execute();
	}
	
	public String delete() throws Exception {
		SurveyQuestionService.deleteSurveyQuestion(id);
		
		return execute();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public SurveyQuestion getQuestion() {
		return question;
	}

	public void setQuestion(SurveyQuestion question) {
		this.question = question;
	}

	public List<SurveyQuestion> getQuestions() {
		return questions;
	}

	public void setQuestions(List<SurveyQuestion> questions) {
		this.questions = questions;
	}
	
	
}
