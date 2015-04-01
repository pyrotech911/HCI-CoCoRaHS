import cocorahs.CocoRole
import cocorahs.Station
import cocorahs.CocoUser
import cocorahs.CocoUserCocoRole

class BootStrap {

    def init = { servletContext ->
		def adminRole = new CocoRole(authority: 'ROLE_ADMIN').save(flush: true) 
		def userRole = new CocoRole(authority: 'ROLE_USER').save(flush: true)
		def st1 = new Station(stationId:"Station1",latitude:47.1122,longitude:-58.9657)
		def st2 = new Station(stationId:"Station2",latitude:48.1234,longitude:-58.9656)
		def st3 = new Station(stationId:"Station3",latitude:24.9876,longitude:45.3333)
				
		def testUser = new CocoUser(username: 'test', enabled: true, password: 'test')
			.addToStations(st1)
			.addToStations(st2)
		    .save(flush: true, failOnError: true)
			
		def testUser2 = new CocoUser(username: 'another', enabled: true, password: 'password')
			.addToStations(st3)
			.save(flush: true)
		
		CocoUserCocoRole.create testUser, adminRole, true
		
		assert CocoUser.count() == 2 
		assert CocoRole.count() == 2 
		assert CocoUserCocoRole.count() == 1
    }
    def destroy = {
    }
}
