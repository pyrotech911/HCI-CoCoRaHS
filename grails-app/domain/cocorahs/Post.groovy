package cocorahs

class Post{
    private String  gpsLocation;
    private String  photoIds;
    String  comment;
    private String  stationId;
    private String  userId;
    Date    timeStamp;
    byte[] photo
    byte[] photo_s

    static belongsTo = [station : Station]
    static hasMany = [photos: Photo]

    static constraints = {
        photo(nullable:true, maxSize:1024*1024*2)
        photo_s(nullable:true, maxSize:1024*1024*2)
    }
}


