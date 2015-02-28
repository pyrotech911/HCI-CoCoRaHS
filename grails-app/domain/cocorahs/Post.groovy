package cocorahs

class Post{
    public  long    postId;
    private String  gpsLocation;
    private String  photoIds;
    private String  comment;
    private String  stationId;
    private String  userId;
    private Date    timeStamp;


    static belongsTo = [station : Station]
    static hasMany = [photos: Photo]

    static constraints = {

    }
}


