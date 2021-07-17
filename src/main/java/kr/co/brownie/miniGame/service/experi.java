package kr.co.brownie.miniGame.service;

import java.util.HashMap;

public class experi {
    public static void main(String[] args) {
        HashMap<String, String> str = new HashMap<String, String>();
        HashMap<String, Integer> num = new HashMap<String, Integer>();

        String temp = "asd";

        str.put("1", temp);

        System.out.println("str 첫번째 :" + str);

        temp = "zxc";

        System.out.println("str 두번째 :" + str);

        int tempInt = 1;

        num.put("1", tempInt);

        System.out.println("num 첫번째 :" + num);

        tempInt = 3;

        System.out.println("num 두번째 :" + num);


    }
}
