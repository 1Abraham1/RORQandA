require "application_system_test_case"

class SiltestsTest < ApplicationSystemTestCase

  def sign_up(email, name, password, password_confirmation)
    visit root_path

    visit all_path
    click_on "Sign Up"

    fill_in "E-mail", with: email
    fill_in "Name", with: name
    fill_in "password", with: password
    fill_in "password_confirmation", with: password_confirmation
    
    click_on "Register"

    assert_text "Welcome to the app"
  end

  def log_in(email, password)
    visit root_path

    click_on "Log In"

    fill_in "E-mail", with: email
    fill_in "password", with: password
    
    click_on "Sign in!"

    assert_text "Welcome back"
  end

  def create_question(title, body)
    visit questions_path

    click_on "New question"

    fill_in "Title", with: title
    fill_in "Body", with: body
    
    click_on "Submit"

    assert_text "Question created!"
  end

  def update_question(title, body, type)
    visit questions_path

    if type == "first"
      click_on("Edit", match: :first)
    else
      click_on("Edit", match: :first)
    end

    fill_in "Title", with: title
    fill_in "Body", with: body
    
    click_on "Submit"

    assert_text "Question updated!"
  end

  def create_answer_for_question(body, type)
    visit questions_path

    if type == "first"
      click_on("Show", match: :first)
    else
      click_on("Show", match: :first)
    end

    fill_in "Body", with: body
    
    click_on "Submit"

    assert_text "Answer created!"
  end

  def update_answer_for_question(body, type)
    visit questions_path

    if type == "first"
      click_on("Show", match: :first)
    else
      click_on("Show", match: :first)
    end

    if type == "first"
      click_on("edit", match: :first)
    else
      click_on("edit", match: :first)
    end

    fill_in "Body", with: body
    
    click_on "Submit"

    assert_text "Answer updated!"
  end

  def delete_question(type)
    visit questions_path

    if type == "first"
      click_on("Delete", match: :first)
    else
      click_on("Delete", match: :first)
    end
    
    click_on "Подтвердить"

    assert_text "Question deleted!"
  end

  def search_questions(search, body)
    visit all_path

    fill_in "Search for title", with: search
    click_on "Search"

    click_on "Show", match: :first

    fill_in "Body", with: body
    
    click_on "Submit"

    assert_text "Answer created!"
  end

  test "first" do
    sign_up("systemtest@mail.com", "SYSTEM", "systemtest", "systemtest")

    create_question("test for delete", "test for delete")
    create_question("test for delete", "test for delete")
    create_question("test for delete", "test for delete")

    delete_question("last")
    
    create_question("title111", "body111")
    create_question("title222", "body222")
    
    update_question("updated_first title111", "updated_first title222", "first")
    
    
    update_question("updated_last title111", "updated_last title222", "last")
    create_answer_for_question("answer1 first", "first")
    update_answer_for_question("updated answer1 first", "first")
  end

  test "second" do
    sign_up("systemtest@mail.com", "SYSTEM", "systemtest", "systemtest")

    # create_question("test for delete", "test for delete")
    # create_question("test for delete", "test for delete")
    # create_question("test for delete", "test for delete")
    create_question("title111", "body111")
    create_question("title222", "body222")

    search_questions("1", "answer from search")
  end

  test "third" do
    log_in("akop2003@gmail.com", "Akop2003!")

    visit questions_path
    create_question("title111_jacob", "body111")
    create_question("title222_jacob", "body222")
  end

end
