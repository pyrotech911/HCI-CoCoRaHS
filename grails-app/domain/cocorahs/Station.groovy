package cocorahs

class Station{
    String stationId;
    public String postIds;
    private String lastLocation;
    private Date   lastUpdate;

    static belongsTo = [user: CocoUser]
    static hasMany = [posts : Post]

    static constraints = {
		
    }
	
	String toString(){
		"${stationId}"
	   }
}

