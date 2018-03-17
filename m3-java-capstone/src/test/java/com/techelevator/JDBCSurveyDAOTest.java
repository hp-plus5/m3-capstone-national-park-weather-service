package com.techelevator;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import java.util.LinkedHashMap;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import com.techelevator.npgeek.model.JDBCSurveyDAO;
import com.techelevator.npgeek.model.Survey;


public class JDBCSurveyDAOTest extends DAOIntegrationTest {
	private JDBCSurveyDAO sut;
	private String fakeCode;

	@Before
	public void setUp() throws Exception {
		sut = new JDBCSurveyDAO(getDataSource());
		JdbcTemplate jdbcTemplate = new JdbcTemplate(getDataSource());
		
		String sqlSurveyInsert = ("INSERT INTO survey_result (parkcode, surveyid, emailaddress, activitylevel, state) "
		        + "VALUES (?, ?, ?, ?, ?) RETURNING parkcode");
		fakeCode = jdbcTemplate.queryForObject(sqlSurveyInsert, String.class, "ABCD", 201, "barb@test.com", "active", "OH");
		
	}

	@Test
	public void testGetDisplayInformation() {
		Integer num = 1;
		Map<String, Integer> surveyResults = new LinkedHashMap<>();
		surveyResults = sut.getDisplayInformation();
		if(surveyResults.containsKey(fakeCode)) {
			assertEquals(num, surveyResults.get(fakeCode));
			return;
		}
		fail("Not yet implemented");
	}

	@Test
	public void testSave() {
		Survey testSurvey = new Survey();
		Long num = 39L;
		testSurvey.setSurveyParkCode("EFGH");
		testSurvey.setSurveyId(num);
		testSurvey.setEmailAddress("test@test.test");
		testSurvey.setState("PA");
		testSurvey.setActivityLevel("active");
		
		sut.save(testSurvey);
		
		if(testSurvey.getSurveyParkCode().equals("EFGH")) {
			assertEquals("test@test.test", testSurvey.getEmailAddress());
			assertEquals("PA", testSurvey.getState());
			return;
		}
		
		
		fail("Survey does not exist");
	}

}
