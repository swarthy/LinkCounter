package ru.seoTracker

import org.apache.commons.lang.builder.HashCodeBuilder

class UserUserRole implements Serializable {

	private static final long serialVersionUID = 1

	User user
	UserRole userRole

	boolean equals(other) {
		if (!(other instanceof UserUserRole)) {
			return false
		}

		other.user?.id == user?.id &&
			other.userRole?.id == userRole?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (user) builder.append(user.id)
		if (userRole) builder.append(userRole.id)
		builder.toHashCode()
	}

	static UserUserRole get(long userId, long userRoleId) {
		UserUserRole.where {
			user == User.load(userId) &&
			userRole == UserRole.load(userRoleId)
		}.get()
	}

	static UserUserRole create(User user, UserRole userRole, boolean flush = false) {
		new UserUserRole(user: user, userRole: userRole).save(flush: flush, insert: true)
	}

	static boolean remove(User u, UserRole r, boolean flush = false) {

		int rowCount = UserUserRole.where {
			user == User.load(u.id) &&
			userRole == UserRole.load(r.id)
		}.deleteAll()

		rowCount > 0
	}

	static void removeAll(User u) {
		UserUserRole.where {
			user == User.load(u.id)
		}.deleteAll()
	}

	static void removeAll(UserRole r) {
		UserUserRole.where {
			userRole == UserRole.load(r.id)
		}.deleteAll()
	}

	static mapping = {
		id composite: ['userRole', 'user']
		version false
	}
}
