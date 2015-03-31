package cocorahs

class CocoUser {

	transient springSecurityService

	String username				// Username
	String password				// Password
	private int privacyFlag		// Determines whether posting is public or private
	public String name			// Real name or Nickname
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	
	static hasMany = [stations: Station]
	
	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true
		password blank: false
	}

	static mapping = {
		password column: '`password`'
	}

	Set<CocoRole> getAuthorities() {
		CocoUserCocoRole.findAllByCocoUser(this).collect { it.cocoRole }
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}
	
	String toString(){
		"${username}"
	   }
}
