require 'test_helper'

class ResetFlowTest < ActionDispatch::IntegrationTest
  teardown do
    Todo.destroy_all
  end

  test 'can POST to /reset and receive a success response' do
    post "/reset"

    assert_response :no_content
  end

  test 'POSTing to /reset unchecks all todos' do
    todo1 = Todo.create!(title: 'test1', checked: true)
    todo2 = Todo.create!(title: 'test2', checked: true)

    post "/reset"

    assert_response :no_content
    assert_equal todo1.reload.checked, false
    assert_equal todo2.reload.checked, false
  end
end

