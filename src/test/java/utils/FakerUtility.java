package utils;

import com.github.javafaker.Faker;

public class FakerUtility {
	static Faker faker = new Faker();
	
	public static String getAccountno()
	{
        String accountNo = "TA-" + faker.number().numberBetween(10000, 20000);
        return accountNo;

	}
	public static String getDepartmentNo()
	{
        int department =  faker.number().numberBetween(1, 20);
        String departmentNo = Integer.toString(department);
        return departmentNo;

	}
	
	public static String getSalary() {
		int salaryValue =  faker.number().numberBetween(15000, 85000);
		String salary = Integer.toString(salaryValue);
		return salary;
	}

	public static String getPincode() {
		String pincode =  faker.address().zipCode();
		return pincode;
	}

}
