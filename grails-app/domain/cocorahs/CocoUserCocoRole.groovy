package cocorahs

import org.apache.commons.lang.builder.HashCodeBuilder

class CocoUserCocoRole implements Serializable {

	private static final long serialVersionUID = 1

	CocoUser cocoUser
	CocoRole cocoRole

	boolean equals(other) {
		if (!(other instanceof CocoUserCocoRole)) {
			return false
		}

		other.cocoUser?.id == cocoUser?.id &&
		other.cocoRole?.id == cocoRole?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (cocoUser) builder.append(cocoUser.id)
		if (cocoRole) builder.append(cocoRole.id)
		builder.toHashCode()
	}

	static CocoUserCocoRole get(long cocoUserId, long cocoRoleId) {
		CocoUserCocoRole.where {
			cocoUser == CocoUser.load(cocoUserId) &&
			cocoRole == CocoRole.load(cocoRoleId)
		}.get()
	}

	static boolean exists(long cocoUserId, long cocoRoleId) {
		CocoUserCocoRole.where {
			cocoUser == CocoUser.load(cocoUserId) &&
			cocoRole == CocoRole.load(cocoRoleId)
		}.count() > 0
	}

	static CocoUserCocoRole create(CocoUser cocoUser, CocoRole cocoRole, boolean flush = false) {
		def instance = new CocoUserCocoRole(cocoUser: cocoUser, cocoRole: cocoRole)
		instance.save(flush: flush, insert: true)
		instance
	}

	static boolean remove(CocoUser u, CocoRole r, boolean flush = false) {
		if (u == null || r == null) return false

		int rowCount = CocoUserCocoRole.where {
			cocoUser == CocoUser.load(u.id) &&
			cocoRole == CocoRole.load(r.id)
		}.deleteAll()

		if (flush) { CocoUserCocoRole.withSession { it.flush() } }

		rowCount > 0
	}

	static void removeAll(CocoUser u, boolean flush = false) {
		if (u == null) return

		CocoUserCocoRole.where {
			cocoUser == CocoUser.load(u.id)
		}.deleteAll()

		if (flush) { CocoUserCocoRole.withSession { it.flush() } }
	}

	static void removeAll(CocoRole r, boolean flush = false) {
		if (r == null) return

		CocoUserCocoRole.where {
			cocoRole == CocoRole.load(r.id)
		}.deleteAll()

		if (flush) { CocoUserCocoRole.withSession { it.flush() } }
	}

	static constraints = {
		cocoRole validator: { CocoRole r, CocoUserCocoRole ur ->
			if (ur.cocoUser == null) return
			boolean existing = false
			CocoUserCocoRole.withNewSession {
				existing = CocoUserCocoRole.exists(ur.cocoUser.id, r.id)
			}
			if (existing) {
				return 'userRole.exists'
			}
		}
	}

	static mapping = {
		id composite: ['cocoRole', 'cocoUser']
		version false
	}
}
