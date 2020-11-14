package validate;

import java.util.regex.Pattern;

public class ValidateCustomer {
    private static final String PHONE_CUSTOMER = "^\\d{9}$";
    private static final String CMND_CUSTOMER = "^\\d{9}$";
    private static boolean pattern(String regex, String value){
        if(Pattern.compile(regex).matcher(value).matches()){
            return true;
        }
        return false;
    }

    public  static  boolean cmndCustomer(String value){
        if(pattern(CMND_CUSTOMER,value)){
            return true;
        }
        return false;
    }

    public  static  boolean phoneCustomer(String value){
        if(pattern(PHONE_CUSTOMER,value)){
            return true;
        }
        return false;
    }
}
