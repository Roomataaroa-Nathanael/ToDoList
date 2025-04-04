package com.todo;

import java.util.ArrayList;

public class Category {
	
	private static int _idCount = 0;
	private int _id;
	private String _name;
	private String _description;
	private ArrayList<Task> _tasks;
	
	public Category(String name, String description) {
		_id = ++_idCount;
		_name = name;
		_description = description;
		_tasks = new ArrayList<>();
	}
	
	//just for the test
	public static void resetIdCount() {
	    _idCount = 0;
	}
	
	public int getId() {
		return _id;
	}
	
	public void setName(String name) {
		_name = name;
	}
	
	public String getName() {
		return _name;
	}
	
	public void setDescription(String description) {
		_description = description;
	}
	
	public String getDescription() {
		return _description;
	}
	
	public ArrayList<Task> getTasks(){
		return _tasks;
	}
	
	public void addTask(Task task) {
		_tasks.add(task);
	}
	
	public void removeTask(Task task) {
		_tasks.remove(task);
	}
	
	
	
}
