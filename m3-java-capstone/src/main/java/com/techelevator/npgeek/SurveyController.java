package com.techelevator.npgeek;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.npgeek.model.Survey;
import com.techelevator.npgeek.model.SurveyDAO;

@Controller
public class SurveyController {
	
	@Autowired
	SurveyDAO surveyDao;

	@RequestMapping(path="/submitSurvey", method=RequestMethod.GET)
	public String showSurveyForm() {
		return "survey";
	}
	
	@RequestMapping(path="/submitSurvey", method=RequestMethod.POST)
	public String saveSurveyResults(@RequestParam String surveyParkCode, @RequestParam String emailAddress, @RequestParam String state, @RequestParam String activityLevel) {
		Survey survey = new Survey();
		
		survey.setSurveyParkCode(surveyParkCode); 
		survey.setEmailAddress(emailAddress);
		survey.setState(state);
		survey.setActivityLevel(activityLevel);
		
		surveyDao.save(survey);
		return "redirect:/surveyResults";
	}
	
// This is for after one has submitted their own personal survey and can see results, I think.
// We will also need some form of sessionId in here, I think? And correspondingly in the header.jspf.
	@RequestMapping(path="/survey", method=RequestMethod.GET)
	public String displaySurveyResults(ModelMap modelHolder) {
			modelHolder.put("survey", surveyDao.getAllSurveyResults());	
		return "survey";
	}
}