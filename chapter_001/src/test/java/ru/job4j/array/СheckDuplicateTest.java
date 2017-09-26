package ru.job4j.array;


import static org.hamcrest.core.Is.is;
import static org.junit.Assert.assertThat;

/**
* Test.
*
* @author Vitaly Zubov (mailto:Zubov.VP@yandex.ru)
* @version $Id$
* @since 0.1
*/

public class CheckDuplicateTest {
	/**
	* Test add.
	*/
	public void whenSecondWordConsistsOfFirstWoord() {
		String consists = new String();
		consists.origin = "Привет";
		consists.sub = "иве";
		Boolean result = consists.contains(origin, sub);
		boolean expected = true;
		assertThat(result, is(expected));
	}
	}