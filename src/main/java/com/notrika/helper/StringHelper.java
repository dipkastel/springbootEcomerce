package com.notrika.helper;

public class StringHelper {

    public static String getAlphaNumericString(int n)
    {
        String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvxyz";
        return generateString(n,AlphaNumericString);
    }

    public static String getNumericString(int n) {
        String AlphaNumericString = "0123456789";

        return generateString(n,AlphaNumericString);
    }

    private static String generateString(int n, String alphaNumericString) {
        StringBuilder sb = new StringBuilder(n);

        for (int i = 0; i < n; i++) {
            int index
                    = (int)(alphaNumericString.length()
                    * Math.random());
            sb.append(alphaNumericString
                    .charAt(index));
        }
        return sb.toString();
    }
}
