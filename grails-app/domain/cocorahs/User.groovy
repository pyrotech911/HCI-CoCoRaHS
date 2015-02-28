package cocorahs
import java.util.Date;

class User{
    public  String userId;    	     // Username
    private int    privacyFlag;	     // flag that will deciede whether posting is pub or private
    public  String name; 		     // Real name or Nickname
    private String type; 		     // Type of User Normal/Admin
    private Date   lastLogIn; 	     // Time stamp of last login

    static hasMany = [stations:Station]
    

    static constraints = {
//        login size: 5..15, blank: false, unique: true
//        password size: 5..15, blank: false
    }
}
