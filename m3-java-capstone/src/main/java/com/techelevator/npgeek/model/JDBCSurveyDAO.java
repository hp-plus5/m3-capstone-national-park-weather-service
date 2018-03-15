package com.techelevator.npgeek.model;

import java.util.ArrayList;
import java.util.List;

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
		String sqlSelectAllSurveyResults = "SELECT * FROM survey_result";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllSurveyResults);
		while(results.next()) {
			Survey survey = new Survey();
			survey.setSurveyParkCode(results.getString("parkCode"));
			survey.setSurveyId(results.getLong("surveyId"));
			survey.setEmailAddress(results.getString("emailAddress"));
			survey.setState(results.getString("state"));
			survey.setActivityLevel(results.getString("activityLevel"));
			allSurveys.add(survey);
		}
		return allSurveys;
	}

	@Override
	public void save(Survey survey) {
		Long surveyId = getNextSurveyId();
		String sqlInsertSurvey = "INSERT INTO survey_result(id, parkCode, emailAddress, state, activityLevel) VALUES (?,?,?,?,?)";
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