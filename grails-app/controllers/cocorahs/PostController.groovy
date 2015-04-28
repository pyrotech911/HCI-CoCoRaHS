package cocorahs

import grails.plugin.springsecurity.annotation.Secured

import java.text.NumberFormat

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PostController {

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

    static final boolean debugIndex = true

    def index() {
        def statId = Long.valueOf(params.stID)
        def currStation = Station.findAllWhere(id: statId)
        def posts = Post.findAllWhere(station: currStation[0])

        if (debugIndex) {
            posts.each { println it.id + " " + it.comment }
        }

        def postList = []
        for (int i = 0; i < posts.size; i++) {
            def postDetail = [:]
            postDetail.put('id', posts[i].id)
			if(posts[i].comment.length() > 100) {
				String details = posts[i].comment.substring(0, 100) + "..."
				postDetail.put('comment', details)
			} else {
                postDetail.put('comment', posts[i].comment)
			}
            postList << postDetail
        }
		
		def latlng = []
		def latlngDetail = [:]
		latlngDetail.put('lat', currStation[0].latitude)
		latlngDetail.put('lon', currStation[0].longitude)
		latlngDetail.put('name', currStation[0].stationName)
		latlng << latlngDetail
		
        [postList: postList, latlng: latlng]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Post.list(params), model: [postInstanceCount: Post.count()]
    }

    def show(Post postInstance) {
        respond postInstance
    }

    @Transactional
    def retSta(Post postInstance){
        if (postInstance == null) {
            notFound()
            return
        }

        if (postInstance.hasErrors()) {
            respond postInstance.errors, view: 'create'
            return
        }

        request.withFormat {
            form multipartForm {
                def par = [:]
                par.put("stID", postInstance.stationId)
                flash.message = message(code: 'default.created.message', args: [message(code: 'post.label', default: 'Post'), postInstance.id])
                redirect(controller: "post", action: "index", params: par)
            }
            '*' { respond postInstance, [status: OK] }
        }
    }

    def create() {
        def sta = cocorahs.Station.get(params.stID)
        respond new Post([station: sta])
    }


    @Transactional
    def save(Post postInstance) {


        if (postInstance == null) {
            notFound()
            return
        }

        if (postInstance.hasErrors()) {
            respond postInstance.errors, view: 'create'
            return
        }

        def station = Station.get(postInstance.stationId)
        NumberFormat formatter = NumberFormat.getInstance()
        float fLat = formatter.parse(params.newLat)
        float fLng = formatter.parse(params.newLng)
        station.latitude = fLat
        station.longitude = fLng

        postInstance.save flush: true

        request.withFormat {
            form multipartForm {
//                flash.message = message(code: 'default.created.message', args: [message(code: 'post.label', default: 'Post'), postInstance.id])
                redirect(controller: "post", action: "show", id: postInstance?.id)
            }
            '*' { respond postInstance, [status: CREATED] }
        }
    }

    def edit(Post postInstance) {
        respond postInstance
    }

    @Transactional
    def update(Post postInstance) {
        if (postInstance == null) {
            notFound()
            return
        }

        if (postInstance.hasErrors()) {
            println("errors...." + postInstance.errors)
            respond postInstance.errors, view: 'edit'
            return
        }

        //retain old photos if new ones are not uploaded
        def photo1 = request.getFile('photo_gauge')
        def photo2 = request.getFile('photo_sky')
        def photo3 = request.getFile('photo_north')
        def photo4 = request.getFile('photo_south')
        def photo5 = request.getFile('photo_east')
        def photo6 = request.getFile('photo_west')
        if(photo1.empty){
            postInstance.photo_gauge = postInstance.getPersistentValue('photo_gauge')
        }
        if(photo2.empty){
            postInstance.photo_sky = postInstance.getPersistentValue('photo_sky')
        }
        if(photo3.empty){
            postInstance.photo_north = postInstance.getPersistentValue('photo_north')
        }
        if(photo4.empty){
            postInstance.photo_south = postInstance.getPersistentValue('photo_south')
        }
        if(photo5.empty){
            postInstance.photo_east = postInstance.getPersistentValue('photo_east')
        }
        if(photo6.empty){
            postInstance.photo_west = postInstance.getPersistentValue('photo_west')
        }

        postInstance.save flush: true

        request.withFormat {
            form multipartForm {
//                flash.message = message(code: 'default.updated.message', args: [message(code: 'Post.label', default: 'Post'), postInstance.id])
                redirect(controller: "post", action: "show", id: postInstance?.id)
            }
            '*' { respond postInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Post postInstance) {

        if (postInstance == null) {
            notFound()
            return
        }

        postInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Post.label', default: 'Post'), postInstance.id])
                redirect action: "list", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'post.label', default: 'Post'), params.id])
                redirect action: "list", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }


    @Secured(['permitAll'])
    def showPhotoGauge() {
        def debugCover = false;
        if (debugCover) {
            println " "
            println "In showPhoto"
            println "post.id: " + params.id
        }
        def post = cocorahs.Post.get(params.id)
        response.outputStream << post.photo_gauge
        response.outputStream.flush()
    }

    @Secured(['permitAll'])
    def showPhotoSky() {
        def debugCover = false;
        if (debugCover) {
            println " "
            println "In showPhoto"
            println "post.id: " + params.id
        }
        def post = cocorahs.Post.get(params.id)
        response.outputStream << post.photo_sky
        response.outputStream.flush()
    }
	
	@Secured(['permitAll'])
	def showPhotoNorth() {
		def debugCover = false;
		if (debugCover) {
			println " "
			println "In showPhoto"
			println "post.id: " + params.id
		}
		def post = cocorahs.Post.get(params.id)
		response.outputStream << post.photo_north
		response.outputStream.flush()
	}
	
	@Secured(['permitAll'])
	def showPhotoSouth() {
		def debugCover = false;
		if (debugCover) {
			println " "
			println "In showPhoto"
			println "post.id: " + params.id
		}
		def post = cocorahs.Post.get(params.id)
		response.outputStream << post.photo_south
		response.outputStream.flush()
	}
	
	@Secured(['permitAll'])
	def showPhotoEast() {
		def debugCover = false;
		if (debugCover) {
			println " "
			println "In showPhoto"
			println "post.id: " + params.id
		}
		def post = cocorahs.Post.get(params.id)
		response.outputStream << post.photo_east
		response.outputStream.flush()
	}
	
	@Secured(['permitAll'])
	def showPhotoWest() {
		def debugCover = false;
		if (debugCover) {
			println " "
			println "In showPhoto"
			println "post.id: " + params.id
		}
		def post = cocorahs.Post.get(params.id)
		response.outputStream << post.photo_west
		response.outputStream.flush()
	}

//    def redirectSta{
//        redirect  controller: "station", action: "index"
//    }


}