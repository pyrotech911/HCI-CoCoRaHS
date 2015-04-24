package cocorahs

class Station{
    String stationName;
	float latitude;
	float longitude;
    public String postIds;
    private String lastLocation;
    private Date   lastUpdate;

    static belongsTo = [user: CocoUser]
    static hasMany = [posts : Post]

    static constraints = {
		latitude nullable: true
		longitude nullable: true
    }
	
	String toString(){
		"${stationName}"
	   }
}

