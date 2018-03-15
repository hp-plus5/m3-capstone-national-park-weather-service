package com.techelevator.npgeek.model;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

public class Survey {

	@NotBlank(message="This is a required field")
	private Long surveyId;

	@NotBlank(message="This is a required field")
	private String surveyParkCode;
	
	@NotBlank(message="This is a required field")
	@Size(max=20)
	@Email (message="invalid email")
	private String emailAddress;
	
	@NotBlank(message="This is a required field")
	@Size(max=20)
	private String state;
	
	@NotBlank(message="This is a required field")
	private String activityLevel;
	
	
	public Long getSurveyId() {
		return surveyId;
	}
	public void setSurveyId(Long surveyId) {
		this.surveyId = surveyId;
	}
	public String getSurveyParkCode() {
		return surveyParkCode;
	}
	public void setSurveyParkCode(String surveyParkCode) {
		this.surveyParkCode = surveyParkCode;
	}
	public String getEmailAddress() {
		return emailAddress;
	}
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getActivityLevel() {
		return activityLevel;
	}
	public void setActivityLevel(String activityLevel) {
		this.activityLevel = activityLevel;
	}
}