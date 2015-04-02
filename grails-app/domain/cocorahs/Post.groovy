package cocorahs

class Post{
    long    postId;
    private String  gpsLocation;
    private String  photoIds;
    String  comment;
    private String  stationId;
    private String  userId;
    private Date    timeStamp;


    static belongsTo = [station : Station]
    static hasMany = [photos: Photo]

    static constraints = {

    }
}


