package test;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.todo.Category;
import com.todo.Task;

class CategoryTest {
	
	private Category category1;
	
	@Mock
    private Task mockTask;
	
	@Mock
	private Task mockTask2;
	
	@BeforeEach
	public void setUp() {
		MockitoAnnotations.openMocks(this);
		Category.resetIdCount();
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
	
	@Test
	void testAddTask() {
     
        category1.addTask(mockTask);

        assertNotNull(category1.getTasks()); 
        assertEquals(1, category1.getTasks().size()); 
        assertTrue(category1.getTasks().contains(mockTask));
	}
	
	@Test
	void testRemoveTask() {
		
		category1.addTask(mockTask);
		assertNotNull(category1.getTasks());
		assertEquals(1, category1.getTasks().size());
		assertTrue(category1.getTasks().contains(mockTask));
		
		category1.removeTask(mockTask);
		assertEquals(0, category1.getTasks().size());
		assertFalse(category1.getTasks().contains(mockTask));
		
	}
	
	@Test
	void testGetTasks() {
		
		category1.addTask(mockTask);
		category1.addTask(mockTask2);
		
		assertNotNull(category1.getTasks());
		assertEquals(2, category1.getTasks().size());
		assertTrue(category1.getTasks().contains(mockTask));
		assertTrue(category1.getTasks().contains(mockTask2));	
	}
	
	
	
}
