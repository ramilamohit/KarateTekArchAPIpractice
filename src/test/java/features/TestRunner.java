package features;

import com.intuit.karate.junit5.Karate;

public class TestRunner {
	
	@Karate.Test
	Karate crudFakerTest() {
		return Karate.run("crudoperationFaker").relativeTo(getClass());
	}


	@Karate.Test
	Karate crudJsonTest() {
		return Karate.run("crudJson").relativeTo(getClass());
	}


	@Karate.Test
	Karate basicPracticeTest() {
		return Karate.run("basicPractice").relativeTo(getClass());
	}

}
