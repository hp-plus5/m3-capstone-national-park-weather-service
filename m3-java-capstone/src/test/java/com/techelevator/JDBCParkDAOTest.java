package com.techelevator;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import com.techelevator.npgeek.model.JDBCParkDAO;
import com.techelevator.npgeek.model.Park;

public class JDBCParkDAOTest extends DAOIntegrationTest {

	private JDBCParkDAO sut;
	private String fakeCode;

	@Before
	public void setUp() throws Exception {
		sut = new JDBCParkDAO(getDataSource());
		JdbcTemplate jdbcTemplate = new JdbcTemplate(getDataSource());
		
		String sqlParkIns = ("INSERT INTO park (parkcode, parkname, state, acreage, elevationinfeet, milesoftrail, numberofcampsites, climate, yearfounded, annualvisitorcount, inspirationalquote, inspirationalquotesource, parkdescription, entryfee, numberofanimalspecies) "
		        + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) RETURNING parkcode");
		fakeCode = jdbcTemplate.queryForObject(sqlParkIns, String.class, "ABCD", "ABCD Name", "OH", 300, 210, 39, 4, "temperate",  1989, 2, "Wow", "Owen Wilson", "description", 70, 30000);
		
	}

	@Test
	public void testGetAllParks() {
		List<Park> parkInfo = sut.getAllParks();
		for(Park p : parkInfo) {
		if(p.getCode().contentEquals(fakeCode)){
		assertEquals("ABCD", p.getCode());
		assertEquals("ABCD Name", p.getName());
		assertEquals("temperate", p.getClimate());
		assertEquals(300, p.getAcreage());
			return;
		    }
		}
		fail("Test Park was not found");
			
	}

	@Test
	public void testGetParkByCode() {
		Park p = sut.getParkByCode(fakeCode);
		
		if(p.getCode().contentEquals(fakeCode)) {
		assertEquals("ABCD", p.getCode());
		assertEquals("ABCD Name", p.getName());
		assertEquals("temperate", p.getClimate());
		assertEquals(300, p.getAcreage());
			return;
		}
		
		fail("Test Park Code Not Found");

	}

}
