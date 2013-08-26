package com.joelbyler.kata.romannumerals;

import static org.junit.Assert.*;

import org.junit.Test;

public class RomanNumeralsTest {

	@Test
	public void testOneToI() {
		assertEquals("I", RomanNumberalConverter.fromInteger(1));
	}

	@Test
	public void testTwoToII() {
		assertEquals("II", RomanNumberalConverter.fromInteger(2));
	}

	@Test
	public void testThreeToIII() {
		assertEquals("III", RomanNumberalConverter.fromInteger(3));
	}

	@Test
	public void testFourToIV() {
		assertEquals("IV", RomanNumberalConverter.fromInteger(4));
	}

	@Test
	public void testFiveToV() {
		assertEquals("V", RomanNumberalConverter.fromInteger(5));
	}

	@Test
	public void testSixToVI() {
		assertEquals("VI", RomanNumberalConverter.fromInteger(6));
	}

	@Test
	public void testNineToIX() {
		assertEquals("IX", RomanNumberalConverter.fromInteger(9));
	}

	@Test
	public void testTenToX() {
		assertEquals("X", RomanNumberalConverter.fromInteger(10));
	}

	@Test
	public void testElevenToXI() {
		assertEquals("XI", RomanNumberalConverter.fromInteger(11));
	}
	
	@Test
	public void testTwentyEightToXXVIII() {
		assertEquals("XXVIII", RomanNumberalConverter.fromInteger(28));
	}
	
	@Test
	public void testFourtyToXL() {
		assertEquals("XL", RomanNumberalConverter.fromInteger(40));
	}
	
	@Test
	public void testFiftyToL() {
		assertEquals("L", RomanNumberalConverter.fromInteger(50));
	}
	
	@Test
	public void testNinetyToXC() {
		assertEquals("XC", RomanNumberalConverter.fromInteger(90));
	}
	
	@Test
	public void testOneHundredToC() {
		assertEquals("C", RomanNumberalConverter.fromInteger(100));
	}
	
	@Test
	public void testFourHundredToCD() {
		assertEquals("CD", RomanNumberalConverter.fromInteger(400));
	}
	
	@Test
	public void testFiveHundredToD() {
		assertEquals("D", RomanNumberalConverter.fromInteger(500));
	}
	
	@Test
	public void testNineHundredToCM() {
		assertEquals("CM", RomanNumberalConverter.fromInteger(900));
	}
	
	@Test
	public void testOneThousandToM() {
		assertEquals("M", RomanNumberalConverter.fromInteger(1000));
	}
	
	@Test
	public void testExample1() {
		assertEquals("CLIX", RomanNumberalConverter.fromInteger(159));
	}
	@Test
	public void testExample2() {
		assertEquals("CCXCVI", RomanNumberalConverter.fromInteger(296));
	}
	@Test
	public void testExample3() {
		assertEquals("MMMCMXCII", RomanNumberalConverter.fromInteger(3992));
	}
	
}
