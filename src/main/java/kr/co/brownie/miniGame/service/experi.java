package kr.co.brownie.miniGame.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class experi {
	public static void main(String[] args) {
		List<Integer> list = new ArrayList<Integer>();
		for(int i=0;i<15;i++) {
			int ins = 0;
			int d = (int)(Math.random() * 101);
			if(94<=d&&d<=96) {
				ins=46;
			} else if (0<=d&&d<=25) {
				ins=38;
			} else if (26<=d&&d<=50) {
				ins=42;
			} else if (51<=d&&d<=60) {
				ins=39;
			} else if (61<=d&&d<=75) {
				ins=43;
			} else if (76<=d&&d<=80) {
				ins=40;
			} else if (81<=d&&d<=90) {
				ins=44;
			} else if (91<=d&&d<=93) {
				ins=41;
			} else if (97<=d&&d<=100) {
				ins=45;
			}
			list.add(ins);
		}
		
		Collections.shuffle(list); 
		Collections.shuffle(list); 
		
		if(list.contains(47)) {
			for(int i=0;i<list.size();i++) {
				if(list.get(i)==47) {
					int ins = 0;
					int d = (int)(Math.random() * 101);
					if(d==100) {
						ins=68;
					} else if (0<=d&&d<=55) {
						ins=61;
					} else if (56<=d&&d<=70) {
						ins=62;
					} else if (71<=d&&d<=80) {
						ins=67;
					} else if (81<=d&&d<=87) {
						ins=64;
					} else if (88<=d&&d<=93) {
						ins=66;
					} else if (94<=d&&d<=96) {
						ins=65;
					} else if (97<=d&&d<=99) {
						ins=63;
					}
					list.set(i, ins);
				}
			}
		}
		
		
		String array = list.toString();
		System.out.println(array);
	}
}
