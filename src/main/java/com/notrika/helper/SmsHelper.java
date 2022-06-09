package com.notrika.helper;

import org.apache.commons.io.IOUtils;

import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.Calendar;

public class SmsHelper {

    public static String FARAZ_SMS_URL = "http://ippanel.com:8080";
    public static String FARAZ_SMS_API_KEY_prefix = "/?apikey=";
    public static String FARAZ_SMS_API_KEY = "9AUtgEP1cotNUnXqvd6WWvo5wXQwJxHzoF8IHASegKI=";
    public static String FARAZ_SMS_FIXPART = FARAZ_SMS_URL + FARAZ_SMS_API_KEY_prefix + FARAZ_SMS_API_KEY;
    public static String FARAZ_SMS_SENDER_NUMBER = "3000505";
    public static String FARAZ_SMS_PATTER_SENDCODE = "tb04oyzxsjz4hmh";

    public static boolean sendMessage(String message,String number) throws Exception{
        String url = FARAZ_SMS_FIXPART + "&pid=" + FARAZ_SMS_PATTER_SENDCODE + "&fnum=" + FARAZ_SMS_SENDER_NUMBER + "&tnum=" + number + "&p1"
                + "=code" + "&v1=" + message;
        URL url2 = new URL(url);
        URLConnection con = url2.openConnection();
        InputStream in = con.getInputStream();
        String encoding = con.getContentEncoding();
        encoding = encoding == null ? "UTF-8" : encoding;
        String body = IOUtils.toString(in, encoding);
        Calendar expireDate = Calendar.getInstance();
        expireDate.add(Calendar.MINUTE, 2);
        return Integer.parseInt(body) > 0;
    }
}
