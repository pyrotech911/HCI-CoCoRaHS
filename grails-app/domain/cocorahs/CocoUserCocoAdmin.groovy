package cocorahs

import org.apache.commons.lang.builder.HashCodeBuilder

class CocoUserCocoAdmin implements Serializable {

	private static final long serialVersionUID = 1

	CocoUser cocoUser
	CocoAdmin cocoAdmin

	boolean equals(other) {
		if (!(other instanceof CocoUserCocoAdmin)) {
			return false
		}

		other.cocoUser?.id == cocoUser?.id &&
		other.cocoAdmin?.id == cocoAdmin?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (cocoUser) builder.append(cocoUser.id)
		if (cocoAdmin) builder.append(cocoAdmin.id)
		builder.toHashCode()
	}

	static CocoUserCocoAdmin get(long userId, long adminId) {
		CocoUserCocoAdmin.where {
			cocoUser == CocoUser.load(userId) &&
			cocoAdmin == CocoAdmin.load(adminId)
		}.get()
	}

	static boolean exists(long userId, long adminId) {
		CocoUserCocoAdmin.where {
			cocoUser == CocoUser.load(userId) &&
			cocoAdmin == CocoAdmin.load(adminId)
		}.count() > 0
	}

	static CocoUserCocoAdmin create(CocoUser cocoUser, CocoAdmin cocoAdmin, boolean flush = false) {
		def instance = new CocoUserCocoAdmin(cocoUser: cocoUser, cocoAdmin: cocoAdmin)
		instance.save(flush: flush, insert: true)
		instance
	}

	static boolean remove(CocoUser u, CocoAdmin r, boolean flush = false) {
		if (u == null || r == null) return false

		int rowCount = CocoUserCocoAdmin.where {
			cocoUser == CocoUser.load(u.id) &&
			cocoAdmin == CocoAdmin.load(r.id)
		}.deleteAll()

		if (flush) { CocoUserCocoAdmin.withSession { it.flush() } }

		rowCount > 0
	}

	static void removeAll(CocoUser u, boolean flush = false) {
		if (u == null) return

		CocoUserCocoAdmin.where {
			cocoUser == CocoUser.load(u.id)
		}.deleteAll()

		if (flush) { CocoUserCocoAdmin.withSession { it.flush() } }
	}

	static void removeAll(CocoAdmin r, boolean flush = false) {
		if (r == null) return

		CocoUserCocoAdmin.where {
			cocoAdmin == CocoAdmin.load(r.id)
		}.deleteAll()

		if (flush) { CocoUserCocoAdmin.withSession { it.flush() } }
	}

	static constraints = {
		cocoAdmin validator: { CocoAdmin r, CocoUserCocoAdmin ur ->
			if (ur.cocoUser == null) return
			boolean existing = false
			CocoUserCocoAdmin.withNewSession {
				existing = CocoUserCocoAdmin.exists(ur.cocoUser.id, r.id)
			}
			if (existing) {
				return 'userRole.exists'
			}
		}
	}

	static mapping = {
		id composite: ['cocoAdmin', 'cocoUser']
		version false
	}
}
