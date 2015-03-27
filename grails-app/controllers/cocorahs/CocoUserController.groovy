package cocorahs



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CocoUserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CocoUser.list(params), model:[cocoUserInstanceCount: CocoUser.count()]
    }

    def show(CocoUser cocoUserInstance) {
        respond cocoUserInstance
    }

    def create() {
        respond new CocoUser(params)
    }

    @Transactional
    def save(CocoUser cocoUserInstance) {
        if (cocoUserInstance == null) {
            notFound()
            return
        }

        if (cocoUserInstance.hasErrors()) {
            respond cocoUserInstance.errors, view:'create'
            return
        }

        cocoUserInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'cocoUser.label', default: 'CocoUser'), cocoUserInstance.id])
                redirect cocoUserInstance
            }
            '*' { respond cocoUserInstance, [status: CREATED] }
        }
    }

    def edit(CocoUser cocoUserInstance) {
        respond cocoUserInstance
    }

    @Transactional
    def update(CocoUser cocoUserInstance) {
        if (cocoUserInstance == null) {
            notFound()
            return
        }

        if (cocoUserInstance.hasErrors()) {
            respond cocoUserInstance.errors, view:'edit'
            return
        }

        cocoUserInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CocoUser.label', default: 'CocoUser'), cocoUserInstance.id])
                redirect cocoUserInstance
            }
            '*'{ respond cocoUserInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CocoUser cocoUserInstance) {

        if (cocoUserInstance == null) {
            notFound()
            return
        }

        cocoUserInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CocoUser.label', default: 'CocoUser'), cocoUserInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'cocoUser.label', default: 'CocoUser'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
