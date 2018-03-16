package com.techelevator.npgeek.model;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCSurveyDAO implements SurveyDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCSurveyDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Survey> getAllSurveyResults() {
		List<Survey> allSurveys = new ArrayList<>();
		String sqlSelectAllSurveyResults = "SELECT * FROM survey_result ";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllSurveyResults);
		while(results.next()) {
			Survey survey = new Survey();
			survey.setSurveyParkCode(results.getString("parkcode"));
			survey.setSurveyId(results.getLong("surveyid"));
			survey.setEmailAddress(results.getString("emailaddress"));
			survey.setState(results.getString("state"));
			survey.setActivityLevel(results.getString("activitylevel"));
			allSurveys.add(survey);
		}
		return allSurveys;
	}
	
	@Override
	public Map<String, Integer> getDisplayInformation() {
		Map<String, Integer> surveyResults = new LinkedHashMap<>();
		String sqlSelectAllSurveyResults = 	"SELECT COUNT (parkcode) AS favNum," + 
											"parkcode " + 
											"FROM survey_result " + 
											"GROUP BY parkcode " + 
											"ORDER BY favNum DESC, parkcode ASC";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllSurveyResults);
		while(results.next()) {
			surveyResults.put(results.getString("parkcode"), results.getInt("favNum"));
		}
		return surveyResults;
	}
	
//	@Override
//	public Map<String, Integer> getDisplayInformation() {
//		Map<String, Integer> surveyResults = new HashMap<>();
//		String sqlSelectAllSurveyResults = 	"SELECT COUNT (survey_result.parkcode) AS favNum,\n" + 
//											"park.parkname\n" + 
//											"FROM survey_result\n" + 
//											"JOIN park\n" + 
//											"ON survey_result.parkcode = park.parkcode\n" + 
//											"GROUP BY park.parkname\n" + 
//											"ORDER BY favNum DESC, park.parkname ASC";
//		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllSurveyResults);
//		while(results.next()) {
//			surveyResults.put(results.getString("park.parkname"), results.getInt("favNum"));
//		}
//		return surveyResults;
//	}

	@Override
	public void save(Survey survey) {
		Long surveyId = getNextSurveyId();
		String sqlInsertSurvey = "INSERT INTO survey_result(surveyid, parkcode, emailaddress, state, activitylevel) VALUES (?,?,?,?,?)";
		jdbcTemplate.update(sqlInsertSurvey, surveyId, survey.getSurveyParkCode(), survey.getEmailAddress(), survey.getState(), survey.getActivityLevel());
		survey.setSurveyId(surveyId);
	}
	
	private Long getNextSurveyId() {
		String sqlSelectNextSurveyId = "SELECT NEXTVAL('seq_surveyId')";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectNextSurveyId);
		Long surveyId = null;
		if(results.next()) {
			surveyId = results.getLong(1);
		} else {
			throw new RuntimeException("Something strange happened, unable to select next survey ID from sequence");
		}
		return surveyId;
	}
}