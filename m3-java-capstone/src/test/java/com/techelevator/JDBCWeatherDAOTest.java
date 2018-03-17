package com.techelevator;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import com.techelevator.npgeek.model.JDBCWeatherDAO;
import com.techelevator.npgeek.model.Weather;

public class JDBCWeatherDAOTest extends DAOIntegrationTest{
	private JDBCWeatherDAO sut;
	private String fakeCode;
	private String fakeParkCode;

	@Before
	public void setUp() throws Exception {
		sut = new JDBCWeatherDAO(getDataSource());
		JdbcTemplate jdbcTemplate = new JdbcTemplate(getDataSource());
		
		String sqlParkInsert = ("INSERT INTO park (parkcode, parkname, state, acreage, elevationinfeet, milesoftrail, numberofcampsites, climate, yearfounded, annualvisitorcount, inspirationalquote, inspirationalquotesource, parkdescription, entryfee, numberofanimalspecies) "
		        + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) RETURNING parkcode");
		fakeParkCode = jdbcTemplate.queryForObject(sqlParkInsert, String.class, "ABCD", "ABCD Name", "OH", 300, 210, 39, 4, "temperate",  1989, 2, "Wow", "Owen Wilson", "description", 70, 30000);
		
		String sqlWeatherInsert = ("INSERT INTO weather (parkcode, fiveDayForecastValue, high, low, forecast) "
		        + "VALUES (?, ?, ?, ?, ?) RETURNING parkcode");
		fakeCode = jdbcTemplate.queryForObject(sqlWeatherInsert, String.class, "ABCD", 3, 77, 3, "sunny");
		
	}

	@Test
	public void testGetWeatherInPark() {
		Weather[] weather = new Weather[1];
		sut.getWeatherInPark(fakeCode.toLowerCase());
		if(weather[0].getFiveDayForecastValue() == 3) {
			assertEquals("sunny", weather[0].getForecast());
			assertEquals(3, weather[0].getLow());
		}
		
		fail("Weather does not exist");
	}

}
