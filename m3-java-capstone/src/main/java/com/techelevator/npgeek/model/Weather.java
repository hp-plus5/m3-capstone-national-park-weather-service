package com.techelevator.npgeek.model;

public class Weather {

	private String weatherParkCode;
	private int fiveDayForecastValue;
	private int low;
	private int high;
	private String forecast;
	
	public int getFiveDayForecastValue() {
		return fiveDayForecastValue;
	}
	public void setFiveDayForecastValue(int fiveDayForecastValue) {
		this.fiveDayForecastValue = fiveDayForecastValue;
	}
	public int getLow() {
		return low;
	}
	public void setLow(int low) {
		this.low = low;
	}
	public int getHigh() {
		return high;
	}
	public void setHigh(int high) {
		this.high = high;
	}
	public String getForecast() {
		return forecast;
	}
	public void setForecast(String forecast) {
		this.forecast = forecast;
	}
	public String getWeatherParkCode() {
		return weatherParkCode;
	}	
	public void setWeatherParkCode(String weatherParkCode) {
		this.weatherParkCode = weatherParkCode;
	}
}