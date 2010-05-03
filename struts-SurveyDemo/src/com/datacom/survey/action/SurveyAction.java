package com.datacom.survey.action;

import java.util.Iterator;
import java.util.List;

import com.datacom.survey.dataobjects.Survey;
import com.datacom.survey.dataobjects.SurveyAnswer;
import com.datacom.survey.services.SurveyService;
import com.datacom.survey.utils.DatabaseFactory;
import com.opensymphony.xwork2.ActionSupport;

public class SurveyAction  extends ActionSupport{

	private int id;
	private Survey survey;
	private List<Survey> surveys;
	
	private static String READ = "read";
	
	public String execute() throws Exception {
		surveys = SurveyService.getSurveys();
		
		return SUCCESS;
	}
	
	public String read() throws Exception {
		
		survey = SurveyService.getSurvey(id);
		
		return READ; 
	}
	
	public String edit() throws Exception {
		
		survey = SurveyService.getSurvey(id);
		
		return INPUT;
	}
	
	public String create() throws Exception {
		survey = SurveyService.newSurvey();
		
		return INPUT;
	}
	
	public String update() throws Exception {
		SurveyService.updateSurvey(survey);
		
		return execute();
	}
	
	public String delete() throws Exception {
		SurveyService.deleteSurvey(id);
		
		return execute();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Survey getSurvey() {
		return survey;
	}

	public void setSurvey(Survey survey) {
		this.survey = survey;
	}

	public List<Survey> getSurveys() {
		return surveys;
	}

	public void setSurveys(List<Survey> surveys) {
		this.surveys = surveys;
	}

}
