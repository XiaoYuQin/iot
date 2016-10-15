package com.shuohe.guoneng;

public class ShaolinBusInfo {
	private String LicensePlate;
	private String VinNo;
	private String CarId;
	private String CarTypeName;
	private String CarBatchName;
	private String CompanyName;
	private String UserRegionName;
	private String TerminalCode;

	public ShaolinBusInfo(String CarBatchName,String CarId,String CarTypeName,String CompanyName,String LicensePlate,String TerminalCode,String UserRegionName,String VinNo)
	{
		this.LicensePlate = LicensePlate;
		this.VinNo = VinNo;
		this.CarId = CarId;
		this.CarTypeName = CarTypeName;
		this.CarBatchName = CarBatchName;
		this.CompanyName = CompanyName;
		this.UserRegionName = UserRegionName;
		this.TerminalCode = TerminalCode;
	}
	public String getLicensePlate(){return this.LicensePlate;}
	public String getVinNo(){return this.VinNo;}
	public String getCarId(){return this.CarId;}
	public String getCarTypeName(){return this.CarTypeName;}
	public String getCarBatchName(){return this.CarBatchName;}
	public String getCompanyName(){return this.CompanyName;}
	public String getUserRegionName(){return this.UserRegionName;}
	public String getTerminalCode(){return this.TerminalCode;}
}
