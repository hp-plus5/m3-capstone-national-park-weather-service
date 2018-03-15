package com.techelevator.npgeek.model;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCWeatherDAO implements WeatherDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCWeatherDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public Weather[] getWeatherInPark(String weatherParkCode) {
		Weather[] weather = new Weather[5];
		String weatherByCodeSql = "SELECT * FROM weather WHERE parkCode = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(weatherByCodeSql, weatherParkCode.toUpperCase());
			
			for(int i = 0; i < weather.length; i++) {
				results.next();
				weather[i] = mapRowToWeather(results);
			}
		return weather;
	}

	private Weather mapRowToWeather(SqlRowSet results) {
		Weather weather = new Weather();
		weather.setWeatherParkCode(results.getString("parkCode").toLowerCase());
		weather.setFiveDayForecastValue(results.getInt("fiveDayForecastValue"));
		weather.setLow(results.getInt("low"));
		weather.setHigh(results.getInt("high"));
		if(results.getString("forecast").equals("partly cloudy")) {
			weather.setForecast("partlyCloudy");
		} else {
			weather.setForecast(results.getString("forecast"));
		}
		
		return weather;
	}
}