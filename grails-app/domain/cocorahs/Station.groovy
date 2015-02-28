package cocorahs

class Station{
    public  String stationId;
    public  String postIds;
    private String lastLocation;
    private Date   lastUpdate;

    static belongsTo = [user:User]
    static hasMany = [posts : Post]

    static constraints = {

    }
}

