package com.techelevator.npgeek;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.npgeek.model.ParkDAO;
import com.techelevator.npgeek.model.Survey;
import com.techelevator.npgeek.model.SurveyDAO;

@Controller
public class SurveyController {
	
	@Autowired
	SurveyDAO surveyDao;
	
	@Autowired
	ParkDAO parkDao;

	@RequestMapping(path="/submitSurvey", method=RequestMethod.GET)
	public String showSurveyForm(ModelMap modelHolder) {
		modelHolder.put("parks", parkDao.getAllParks());
		if ( ! modelHolder.containsAttribute("survey")) {
			modelHolder.put("survey", new Survey());
		}
		return "survey";
	}
	
	@RequestMapping(path="/submitSurvey", method=RequestMethod.POST)
	public String processSurvey(@ModelAttribute Survey surveyData, BindingResult result, RedirectAttributes flash) {
		if(result.hasErrors()) {
			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "survey", result);
			flash.addFlashAttribute("survey", surveyData);
			System.out.println("Errors!");
			return"redirect:/submitSurvey";
		}
		surveyDao.save(surveyData);
		
		flash.addFlashAttribute("message", "Your survey has been submitted!");
		
		return "redirect:/surveyResults";
	}
	
	
//	@RequestMapping(path="/submitSurvey", method=RequestMethod.POST)
//	public String saveSurveyResults(@ModelAttribute("survey") Survey survey) {		
//		surveyDao.save(survey);
//		return "redirect:/surveyResults";
//	}
	
// This is for after one has submitted their own personal survey and can see results, I think.
// We will also need some form of sessionId in here, I think? And correspondingly in the header.jspf.
	@RequestMapping(path="/surveyResults", method=RequestMethod.GET)
	public String displaySurveyResults(ModelMap modelHolder) {
			modelHolder.put("survey", surveyDao.getDisplayInformation());	
			modelHolder.put("parks", parkDao.getAllParks());
		return "surveyResults";
	}
}