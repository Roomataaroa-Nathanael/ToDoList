package com.todo;

import java.util.ArrayList;
import java.util.List;

public class Category {
	
	private static int _idCount = 0;
	private int _id;
	private String _name;
	private String _description;
	private List<Task> _tasks;
	
	public Category(String name, String description) {
		_id = _idCount++;
		_name = name;
		_description = description;
		_tasks = new ArrayList<>();
	}
	
	
}
