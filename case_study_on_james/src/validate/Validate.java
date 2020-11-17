package validate;

import java.util.regex.Pattern;

public class Validate {
    private static String VALIDATE_TITLE = "^([A-Z])+(\\w)*(\\s+\\w+)*$";

    public static boolean regex(String values){
        if(Pattern.compile(VALIDATE_TITLE).matcher(values).matches()){
            return true;
        }
        return false;
    }
}
