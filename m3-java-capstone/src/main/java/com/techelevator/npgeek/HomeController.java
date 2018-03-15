package com.techelevator.npgeek;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.npgeek.model.Park;
import com.techelevator.npgeek.model.ParkDAO;
import com.techelevator.npgeek.model.Weather;
import com.techelevator.npgeek.model.WeatherDAO;

@Controller
public class HomeController {
	
	@Autowired
	ParkDAO parkDao;
	
	@Autowired
	WeatherDAO weatherDao;

	@RequestMapping(path="/", method=RequestMethod.GET)
	public String displayListOfParks(ModelMap modelHolder) {
		modelHolder.put("parks", parkDao.getAllParks());
		return "homePage";
	}
	
	@RequestMapping(path="/details", method=RequestMethod.GET)
	public String displayListOfParks(ModelMap modelHolder, @RequestParam String code) {		
		Park park = parkDao.getParkByCode(code);
		Weather[] weather = weatherDao.getWeatherInPark(code);
		code = code.toUpperCase();
		park.setCode(code);
		
		modelHolder.put("weather", weather);		
		modelHolder.put("park", park);
		return "detailPage";
	}
}
