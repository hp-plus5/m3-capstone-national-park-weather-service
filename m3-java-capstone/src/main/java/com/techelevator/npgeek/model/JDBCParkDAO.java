package com.techelevator.npgeek.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCParkDAO implements ParkDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCParkDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Park> getAllParks() {
		List<Park> allParks = new ArrayList<>();
		String sqlSelectAllParks = "SELECT * FROM park";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllParks);
		while (results.next()) {
			allParks.add(mapRowToPark(results));
		}
		return allParks;
	}

	@Override
	public Park getParkByCode(String code) {
		Park park = new Park();
		String parkByCodeSql = "SELECT * FROM park WHERE parkCode = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(parkByCodeSql, code.toUpperCase());
		while (results.next()) {
			park = mapRowToPark(results);
		}
		return park;
	}

	private Park mapRowToPark(SqlRowSet results) {
		Park park = new Park();
			park.setCode(results.getString("parkCode").toLowerCase());
			park.setName(results.getString("parkName"));
			park.setState(results.getString("state"));
			park.setAcreage(results.getInt("acreage"));
			park.setElevationInFeet(results.getInt("elevationInFeet"));
			park.setMilesOfTrail(results.getDouble("milesOfTrail"));
			park.setNumberOfCampsites(results.getInt("numberOfCampsites"));
			park.setClimate(results.getString("climate"));
			park.setYearFounded(results.getInt("yearFounded"));
			park.setAnnualVisitorCount(results.getInt("annualVisitorCount"));
			park.setInspirationalQuote(results.getString("inspirationalQuote"));
			park.setInspirationalQuoteSource(results.getString("inspirationalQuoteSource"));
			park.setDescription(results.getString("parkDescription"));
			park.setEntryFee(results.getInt("entryFee"));
			park.setNumberOfAnimalSpecies(results.getInt("numberOfAnimalSpecies"));
		return park;
	}
}