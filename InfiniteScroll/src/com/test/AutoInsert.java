package com.test;

public class AutoInsert {
    InsertCode code = new InsertCode();
    String arr[] = {"apple","banana","kiwi","lemon","strawberry","melon","tomato"};
    String sendArr[] = new String[20];
    public void insertion(){
        for(int i=0;i<20;i++) {
            int t = (int)(Math.random()*arr.length);
            String str=arr[t]+Integer.toString(i);
            sendArr[i] = str;
            System.out.println(sendArr[i]);

        }
        code.insertArr(sendArr);
    }

}
