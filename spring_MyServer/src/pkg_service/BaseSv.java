package pkg_service;

import pkg_dao.UserDao;

public class BaseSv {
	public static UserDao dao;
	public void setDao(UserDao dao) {
		this.dao = dao;
	}
}
