package com.datacom.survey.services;

import java.util.List;

import com.datacom.survey.dataobjects.SurveyQuestion;
import com.datacom.survey.utils.DatabaseFactory;

public class SurveyQuestionService {

	@SuppressWarnings("unchecked")
	public static List<SurveyQuestion> getSurveyQuestions() {
		
		return (List<SurveyQuestion>)DatabaseFactory.getListData("surveyQuestion.findAll");
	}
	
	public static SurveyQuestion getSurveyQuestion(int id) {
		return (SurveyQuestion)DatabaseFactory.getData("surveyQuestion.findSpecific", id);
	}
	
	public static SurveyQuestion updateSurveyQuestion(SurveyQuestion data) {
		return (SurveyQuestion)DatabaseFactory.updateData(data);
	}
	
	public static void deleteSurveyQuestion(int id) {
		DatabaseFactory.delete("surveyQuestion.delete", id);
	}
}
