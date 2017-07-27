package pl.lczyrny.password.util;

import java.security.SecureRandom;

/**
 * Created by Lukasz on 27.03.2017.
 */
public class StringHelper {
    private StringHelper(){
        //util class
    }

    private static StringBuilder addChar(Integer position, Integer size, Integer lastRand, StringBuilder sb) {
        if(position >= size)
            return sb;

        SecureRandom random = new SecureRandom();
        Integer randNum;

        if((position % 6) == 0) {
            randNum = random.nextInt();
        } else {
            randNum = lastRand;
        }

        Integer chr = randNum & 0x1f;
        if(chr < 26) {
            sb.append(Character.toChars('A' + chr));
        } else {
            sb.append(Character.toChars('0' + (chr - 26)));
        }
        return addChar(position + 1, size, randNum >> 5, sb);
    }

    public static String escapeBashChars(String input) {
        String result = "";
        for(int i = 0; i < input.length(); i++) {
            char c = input.charAt(i);
            if(c == '$' || c == '.') {
                result += "\\" + c;
                int nextPos = i + 1;
                if(nextPos < input.length()) {
                    char nextChar = input.charAt(nextPos);
                    result += "\\" + nextChar;
                    i++;
                }
            } else if(c == ';') {
                result += "\\" + c;
            } else {
                result += c;
            }
        }

        return result;
    }

    public static String randomString(Integer size) {
        return addChar(0, size, 0, new StringBuilder(size)).toString();
    }
}
