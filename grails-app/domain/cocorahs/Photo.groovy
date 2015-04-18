package cocorahs

class Photo{
    public  String   caption;  	 // caption for a photo
    public  long     size;		 // size of the file
    private String   resolution; // photo resolution
//    byte[]   photo       // photo data in byte array

    static belongsTo = [post : Post]

    static constraints = {
//        photo(nullable:true, maxSize:1024*1024*2)
    }
}