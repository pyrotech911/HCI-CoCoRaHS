package cocorahs



import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.SpringSecurityService
import grails.transaction.Transactional

@Transactional(readOnly = true)
class StationController {
	
	def springSecurityService
	
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	
	static final boolean debugIndex = true
	def index() {
		def currUser = springSecurityService.getCurrentUser()
		def stations = Station.findAllWhere(user : (CocoUser)currUser)
		
		if(debugIndex)
		{
			stations.each{ println it.id + " " + it.stationId }
		}
		
		def stationList = []
		for(int i = 0; i < stations.size; i++) {
			def stationDetail = [:]
			stationDetail.put('stationId', stations[i].stationId)
			stationDetail.put('longitude', stations[i].longitude)
			stationDetail.put('latitude', stations[i].latitude)
			stationDetail.put('id', (stations[i].id).toString())
			stationList << stationDetail
		}
		
		[stationList: stationList]
	}
	
    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Station.list(params), model:[stationInstanceCount: Station.count()]
    }

    def show(Station stationInstance) {
        respond stationInstance
    }

    def create() {
		def currUser = springSecurityService.getCurrentUser()
		[currUser:currUser]
        respond new Station(params)
    }

    @Transactional
    def save(Station stationInstance) {
        if (stationInstance == null) {
            notFound()
            return
        }

        if (stationInstance.hasErrors()) {
            respond stationInstance.errors, view:'create'
            return
        }

        stationInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'station.label', default: 'Station'), stationInstance.id])
                redirect stationInstance
            }
            '*' { respond stationInstance, [status: CREATED] }
        }
    }

    def edit(Station stationInstance) {
        respond stationInstance
    }

    @Transactional
    def update(Station stationInstance) {
        if (stationInstance == null) {
            notFound()
            return
        }

        if (stationInstance.hasErrors()) {
            respond stationInstance.errors, view:'edit'
            return
        }

        stationInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Station.label', default: 'Station'), stationInstance.id])
                redirect stationInstance
            }
            '*'{ respond stationInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Station stationInstance) {

        if (stationInstance == null) {
            notFound()
            return
        }

        stationInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Station.label', default: 'Station'), stationInstance.id])
                redirect action:"list", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'station.label', default: 'Station'), params.id])
                redirect action: "list", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
