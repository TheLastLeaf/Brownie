package kr.co.brownie.miniGame.service;

public class experi {
	public static void main(String[] args) {
		String a = "[37, 39, 7, 9, 10, 43, 13, 48, 16, 17, 22, 55, 23, 24, 29]";
		
		a = a.replace("[", "");
		a = a.replace("]", "");
		String[] splitStr = a.split(",");
		
		System.out.println(splitStr[0]);
	}
}
