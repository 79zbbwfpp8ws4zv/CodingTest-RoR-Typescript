require 'test_helper'

class UpdateFlowTest < ActionDispatch::IntegrationTest
  teardown do
    Todo.destroy_all
  end

  test 'does not cause an exception when id is not present' do
    post "/todo"

    assert_response :not_found
  end

  test 'POSTing checked: false to /todo unchecks the todo' do
    todo1 = Todo.create!(title: 'test1', checked: true)

    post todo_path(id: todo1.id), params: { checked: false }

    assert_response :no_content
    assert_equal todo1.reload.checked, false
  end

  test 'POSTing checked: true to /todo checks the todo' do
    todo1 = Todo.create!(title: 'test1', checked: false)

    post todo_path(id: todo1.id), params: { checked: true }

    assert_response :no_content
    assert_equal todo1.reload.checked, true
  end
end

