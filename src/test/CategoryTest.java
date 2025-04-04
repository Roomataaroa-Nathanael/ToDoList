package test;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.todo.Category;

class CategoryTest {
	
	private Category category1;
	
	@BeforeEach
	public void setUp() {
		category1 = new Category("Job", "All tasks for my job");
	}
	
	@Test
	void testAutoIncrementId() {
		Category category2 = new Category("Hobbies", "All tasks for football, mma, etc...");
		assertEquals(1, category1.getId());
		assertEquals(2, category2.getId());
	}
	
	@Test
	void testSetName() {
		category1.setName("Family");
		assertEquals("Family", category1.getName());
	}
	
	@Test
	void testGetName() {
		assertEquals("Job", category1.getName());
	}
	
	@Test
	void testSetDescription() {
		category1.setDescription("Family");
		assertEquals("Family", category1.getDescription());
	}
	
	@Test
	void testGetDescription() {
		assertEquals("All tasks for my job", category1.getDescription());
	}
	
}
