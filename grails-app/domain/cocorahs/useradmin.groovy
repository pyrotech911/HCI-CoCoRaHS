package cocorahs

import org.apache.commons.lang.builder.HashCodeBuilder

class useradmin implements Serializable {

	private static final long serialVersionUID = 1

	user user
	admin admin

	boolean equals(other) {
		if (!(other instanceof useradmin)) {
			return false
		}

		other.user?.id == user?.id &&
		other.admin?.id == admin?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (user) builder.append(user.id)
		if (admin) builder.append(admin.id)
		builder.toHashCode()
	}

	static useradmin get(long userId, long adminId) {
		useradmin.where {
			user == user.load(userId) &&
			admin == admin.load(adminId)
		}.get()
	}

	static boolean exists(long userId, long adminId) {
		useradmin.where {
			user == user.load(userId) &&
			admin == admin.load(adminId)
		}.count() > 0
	}

	static useradmin create(user user, admin admin, boolean flush = false) {
		def instance = new useradmin(user: user, admin: admin)
		instance.save(flush: flush, insert: true)
		instance
	}

	static boolean remove(user u, admin r, boolean flush = false) {
		if (u == null || r == null) return false

		int rowCount = useradmin.where {
			user == user.load(u.id) &&
			admin == admin.load(r.id)
		}.deleteAll()

		if (flush) { useradmin.withSession { it.flush() } }

		rowCount > 0
	}

	static void removeAll(user u, boolean flush = false) {
		if (u == null) return

		useradmin.where {
			user == user.load(u.id)
		}.deleteAll()

		if (flush) { useradmin.withSession { it.flush() } }
	}

	static void removeAll(admin r, boolean flush = false) {
		if (r == null) return

		useradmin.where {
			admin == admin.load(r.id)
		}.deleteAll()

		if (flush) { useradmin.withSession { it.flush() } }
	}

	static constraints = {
		admin validator: { admin r, useradmin ur ->
			if (ur.user == null) return
			boolean existing = false
			useradmin.withNewSession {
				existing = useradmin.exists(ur.user.id, r.id)
			}
			if (existing) {
				return 'userRole.exists'
			}
		}
	}

	static mapping = {
		id composite: ['admin', 'user']
		version false
	}
}
