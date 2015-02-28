package cocorahs

class Station{
    public  String stationId;
    public  String postIds;
    private String lastLocation;
    private Date   lastUpdate;

    static belongsTo = [user:User]
    static hasMany = [posts : Post]

//
//    void SetLastLocation(String loc){
//        lastLocation = loc;
//    }
//
//    void SetLastUpdate(String update){
//        lastUpdate = update;
//    }
//
//    void SetLastLocation(String uId){
//        userIds = uId;
//    }
//
//    void SetLastUser(String lUser){
//        lastUser = lUser;
//    }
//
//
//    String GetLastLocation(String loc){
//        return lastLocation;
//    }
//
//    Date GetLastUpdate(String update){
//        return lastUpdate;
//    }
//
//    String GetLastLocation(String uId){
//        return userIds;
//    }
//
//    String GetLastUser(String lUser){
//        return lastUser;
//    }

    static constraints = {

    }
}

