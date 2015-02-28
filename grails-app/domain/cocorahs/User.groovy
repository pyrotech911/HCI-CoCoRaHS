package cocorahs
import java.util.Date;

class User{
    public  String userId;    	     // Username
    private int    privacyFlag;	     // flag that will deciede whether posting is pub or private
    public  String name; 		     // Real name or Nickname
    private String type; 		     // Type of User Normal/Admin
    private Date   lastLogIn; 	     // Time stamp of last login

    static hasMany = [stations:Station]


//    public void SetPrivacy(int privacy){
//        privacyFlag = privacy;
//    }

//    public void SetType(String userType){
//        type = userType;
//    }
//
//    public Date SetLastLogIn(Date timeStamp){
//        lastLogIn = timeStamp;
//    }
//
//    public int GetPrivacy(){
//        return privacyFlag;
//    }
//
//    public String GetType(){
//        return type;
//    }
//
//    public Date GetLastLogIn(){
//        return lastLogIn;
//    }

    static constraints = {
//        login size: 5..15, blank: false, unique: true
//        password size: 5..15, blank: false
    }
}
