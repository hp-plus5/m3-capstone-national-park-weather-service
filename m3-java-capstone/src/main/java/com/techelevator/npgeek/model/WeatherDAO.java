package com.techelevator.npgeek.model;

public interface WeatherDAO {

	public Weather[] getWeatherInPark(String weatherParkCode);
}