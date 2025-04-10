require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = Task.create!(
      name: 'Test Task',
      status: 'new',
      creator: 'Tester',
      completed: false
    )
  end

  test 'should get index' do
    get tasks_url
    assert_response :success
    assert_select 'h1', 'Task List'
  end

  test 'should get new' do
    get new_task_url
    assert_response :success
    assert_select 'h1', 'Create New Task'
  end

  test 'should create task' do
    assert_difference('Task.count') do
      post tasks_url, params: {
        task: {
          name: 'New Task',
          status: 'in progress',
          creator: 'User1',
          completed: false
        }
      }
    end

    assert_redirected_to task_path(Task.last)
    follow_redirect!
    assert_select 'h1', 'New Task'
  end

  test 'should show task' do
    get task_url(@task)
    assert_response :success
    assert_select 'h1', @task.name
  end

  test 'should get edit' do
    get edit_task_url(@task)
    assert_response :success
    assert_select 'h1', 'Edit Task'
  end

  test 'should update task' do
    patch task_url(@task), params: {
      task: {
        name: 'Updated Task'
      }
    }

    assert_redirected_to task_path(@task)
    @task.reload
    assert_equal 'Updated Task', @task.name
  end

  test 'should destroy task' do
    assert_difference('Task.count', -1) do
      delete task_url(@task)
    end

    assert_redirected_to tasks_path
  end
end
