package cocorahs

class Post{
    private String  gpsLocation;
    private String  photoIds;
    String  comment;
    private String  statId;
    private String  userId;
    String    timeStamp;
    byte[] photo_gauge
    byte[] photo_sky
	byte[] photo_north
	byte[] photo_south
	byte[] photo_east
	byte[] photo_west

    static belongsTo = [station : Station]

    static constraints = {
        photo_gauge(nullable:true, maxSize:1024*1024*4)
        photo_sky(nullable:true, maxSize:1024*1024*4)
		photo_north(nullable:true, maxSize:1024*1024*4)
		photo_south(nullable:true, maxSize:1024*1024*4)
		photo_east(nullable:true, maxSize:1024*1024*4)
		photo_west(nullable:true, maxSize:1024*1024*4)
		timeStamp(nullable:true)
    }
}


