package com.shuohe.os;

public class OsParams {

		
		float cpu_utilization;
		float memory_utilization;
		String date;
		
		public OsParams(){}
		
		public void setCpu_utilization(float cpu_utilization) {
			this.cpu_utilization = cpu_utilization;
		}

		public void setMemory_utilization(float memory_utilization) {
			this.memory_utilization = memory_utilization;
		}
		public float getCpu_utilization() {
			return cpu_utilization;
		}
		public float getMemory_utilization() {
			return memory_utilization;
		}

		public String getDate() {
			return date;
		}

		public void setDate(String date) {
			this.date = date;
		}

		
}
