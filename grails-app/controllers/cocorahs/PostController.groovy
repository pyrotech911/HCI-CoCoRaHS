package cocorahs

import grails.plugin.springsecurity.annotation.Secured

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
            postDetail.put('comment', posts[i].comment)
            postList << postDetail
        }
        [postList: postList]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Post.list(params), model: [postInstanceCount: Post.count()]
    }

    def show(Post postInstance) {
        respond postInstance
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

        postInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'post.label', default: 'Post'), postInstance.id])
                redirect(controller: "station", action: "index")
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
        postInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Post.label', default: 'Post'), postInstance.id])
                redirect(controller: 'station', action: 'index')
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
    def showPhoto() {
        def debugCover = false;
        if (debugCover) {
            println " "
            println "In showPhoto"
            println "post.id: " + params.id
        }
        def post = cocorahs.Post.get(params.id)
        response.outputStream << post.photo
        response.outputStream.flush()
    }

    @Secured(['permitAll'])
    def showPhoto_S() {
        def debugCover = false;
        if (debugCover) {
            println " "
            println "In showPhoto"
            println "post.id: " + params.id
        }
        def post = cocorahs.Post.get(params.id)
        response.outputStream << post.photo_s
        response.outputStream.flush()
    }


}