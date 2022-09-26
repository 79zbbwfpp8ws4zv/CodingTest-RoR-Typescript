require 'test_helper'

class DeleteFlowTest < ActionDispatch::IntegrationTest
  teardown do
    Todo.destroy_all
    Capybara.use_default_driver
  end

  test 'delete /todo/:id deletes the todo' do
    Capybara.current_driver = :selenium_headless
    todo1 = Todo.create!(title: 'test1', checked: false)

    visit root_path

    assert_equal Todo.count, 1
    assert page.html.include?(todo1.title)

    delete delete_todo_item_path(todo1.id)
    # click_button 'Remove'

    assert_response :no_content
    assert_equal Todo.count, 0

    visit root_path
    assert !page.html.include?(todo1.title)
  end
end

