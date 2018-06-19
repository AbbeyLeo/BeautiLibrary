package com.dao;

import java.util.List;

import com.bean.User;

public interface UserDao {
	public User Query(String username);
	public List<User> QueryAll();
	public List<User> QueryById(int id);
	public void DeleteUserById(String id);
}
