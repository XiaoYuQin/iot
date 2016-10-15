package com.shuohe.guoneng;

public class ShaoLinBusBattery {

	int gpsSignal;
	float soc;
	float batteryVoltage;
	float batteryCurrent;
	String date;
	
	public ShaoLinBusBattery(int gpsSignal,float soc,float batteryVoltage,float batteryCurrent,String date)
	{
		this.gpsSignal = gpsSignal;
		this.soc = soc;
		this.batteryVoltage = batteryVoltage;
		this.batteryCurrent = batteryCurrent;
		this.date = date;
	}

	public int getGpsSignal() {
		return gpsSignal;
	}

	public float getSoc() {
		return soc;
	}

	public float getBatteryVoltage() {
		return batteryVoltage;
	}

	public float getBatteryCurrent() {
		return batteryCurrent;
	}

	public String getDate() {
		return date;
	}
	
	
	
}
