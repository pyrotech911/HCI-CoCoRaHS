package cocorahs

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PhotoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Photo.list(params), model: [photoInstanceCount: Photo.count()]
    }

    def show(Photo photoInstance) {
        respond photoInstance
    }

    def create() {
        respond new Photo(params)
    }

    @Transactional
    def save(Photo photoInstance) {
        if (photoInstance == null) {
            notFound()
            return
        }

        if (photoInstance.hasErrors()) {
            respond photoInstance.errors, view: 'create'
            return
        }
        println("Photo saved " + photoInstance.id + " Size " + photoInstance.size)
        photoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                redirect (controller: 'station', action:'index')
            }
            '*' { respond photoInstance, [status: CREATED] }
        }
    }

    def edit(Photo photoInstance) {
        respond photoInstance
    }

    @Transactional
    def update(Photo photoInstance) {
        if (photoInstance == null) {
            notFound()
            return
        }

        if (photoInstance.hasErrors()) {
            respond photoInstance.errors, view: 'edit'
            return
        }

        photoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Photo.label', default: 'Photo'), photoInstance.id])
                redirect photoInstance
            }
            '*' { respond photoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Photo photoInstance) {

        if (photoInstance == null) {
            notFound()
            return
        }

        photoInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Photo.label', default: 'Photo'), photoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    @Secured(['permitAll'])
    def showPhoto(){
        def debugCover = true;
        if(debugCover){
            println " "
            println "In showPhoto"
            println "params.id: " + params.id
        }
        def photoInstance = Photo.get(params.id)
        println "photo.size: " + photoInstance.size
        response.outputStream << photoInstance.photo
        response.outputStream.flush()

    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'photo.label', default: 'Photo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
