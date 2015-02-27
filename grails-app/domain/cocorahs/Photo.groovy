package cocorahs

class Photo{
    public  long     photoId;
    private long     postId;	// related post
    private String   userId;	// user ID associated with photo
    private byte[]   photoType;	// File Type of photo
    public  String   caption; 	// caption for a photo
    public  long     size;		// size of the file
    private String   resolution;    // photo resolution
    private String   photoUrl       // photo location relative to root directory

    // actual photo

//    static belongsTo = [users : User]
//    static belongsTo = [stations : Station]
//    static belongsTo = [posts : Post]


    static constraints = {


    }

}