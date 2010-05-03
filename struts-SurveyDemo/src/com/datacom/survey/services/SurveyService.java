package com.datacom.survey.services;

import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;

import com.datacom.survey.dataobjects.Survey;
import com.datacom.survey.dataobjects.SurveyAnswer;
import com.datacom.survey.dataobjects.SurveyQuestion;
import com.datacom.survey.utils.DatabaseFactory;

public class SurveyService {

	@SuppressWarnings("unchecked")
	public static List<Survey> getSurveys() {
		
		return (List<Survey>)DatabaseFactory.getListData("survey.findAll");
	}
	
	public static Survey getSurvey(int id) {
		return (Survey)DatabaseFactory.getData("survey.findSpecific", id);
	}
	
	public static Survey updateSurvey(Survey survey) {
		survey.setStartDate(new Date());
		survey.setScore(0);
		Iterator<SurveyAnswer> it = survey.getAnswers().iterator();
		while(it.hasNext()) {
			SurveyAnswer answer = it.next();

			SurveyQuestion question = SurveyQuestionService.getSurveyQuestion(answer.getQuestion().getId());
			answer.setQuestion(question);
			
			int score = 0;
			try {
				score = Integer.parseInt(answer.getAnswer());
			}
			catch (Exception ex) {
				
			}
			
			survey.setScore(survey.getScore() + score);
		}

		
		
		survey = (Survey)DatabaseFactory.updateData(survey);
		
		it = survey.getAnswers().iterator();
		while(it.hasNext()) {
			SurveyAnswer answer = it.next();
			
			answer.setSurvey(survey);
			DatabaseFactory.updateData(answer);
		}
		
		return survey;
	}
	
	public static void deleteSurvey(int id) {
		DatabaseFactory.delete("survey.delete", id);
	}
	
	public static Survey newSurvey() {
		Survey survey = new Survey();
		survey.setAnswers(new Vector<SurveyAnswer>());
		
		List<SurveyQuestion> questions = SurveyQuestionService.getSurveyQuestions();
		Iterator<SurveyQuestion> it = questions.iterator();
		while (it.hasNext()) {
			SurveyQuestion question = it.next();
			SurveyAnswer answer = new SurveyAnswer();
			answer.setQuestion(question);
			answer.setSurvey(survey);

			survey.getAnswers().add(answer);
		}
		
		return survey;
	}
}
