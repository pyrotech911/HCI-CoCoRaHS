import cocorahs.*

class BootStrap {

    def init = { servletContext ->
		def adminRole = new CocoRole(authority: 'ROLE_ADMIN').save(flush: true) 
		def userRole = new CocoRole(authority: 'ROLE_USER').save(flush: true)
		
		def testUser = new CocoUser(username: 'test', enabled: true, password: 'test') 
		testUser.save(flush: true)
		
		CocoUserCocoRole.create testUser, adminRole, true
		
		assert CocoUser.count() == 1 
		assert CocoRole.count() == 2 
		assert CocoUserCocoRole.count() == 1
    }
    def destroy = {
    }
}
