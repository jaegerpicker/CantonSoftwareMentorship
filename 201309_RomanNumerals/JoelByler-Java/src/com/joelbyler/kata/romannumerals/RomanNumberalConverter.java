package com.joelbyler.kata.romannumerals;
//JJ
public class RomanNumberalConverter {

	public enum RomanNumber {
		ONETHOUSAND(1000, "M"),
		NINEHUNDRED(900, "CM"),
		FIVEHUNDRED(500, "D"),
		FOURHUNDRED(400, "CD"),
		ONEHUNDRED(100, "C"),
		NINETY(90, "XC"),
		FIFTY(50, "L"),
		FOURTY(40, "XL"),
		TEN(10, "X"),
		NINE(9, "IX"),
		FIVE(5, "V"),
		FOUR(4, "IV"), 
		ONE(1, "I");
		
		private int number;
		private String roman;
		RomanNumber(int number, String string){
			this.number = number;
			this.roman = string;
		}
		String getRoman() {
			return roman;
		}
		int getNumber() {
			return number;
		}
	}
	
	public static String fromInteger(int number) {
		String numeral = "";
		int remainder = number;
		for(RomanNumber romanNumber : RomanNumber.values()) {
			while(remainder-romanNumber.getNumber() >=0){
				numeral += romanNumber.getRoman();
				remainder -= romanNumber.getNumber();
			}
		}

		return numeral;
	}

}
// GDI