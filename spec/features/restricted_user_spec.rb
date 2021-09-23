# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'restricted user journey', type: :feature do
  scenario 'can only see view crud link' do
    register_as_edit_user
    create_quiz_with_question_and_answers
    click_link('Sign out')
    register_as_restricted_user
    expect(page).to have_text('My Amazing Quiz')
    expect(page).to have_link('View')
    expect(page).to_not have_link('Edit')
    expect(page).to_not have_link('Delete')
    expect(page).to_not have_link('New Quiz')
    click_link('View', match: :first)
    expect(page).to have_link('Back')
  end

  def register_as_restricted_user
    visit('/')
    click_link('Sign in', match: :first)
    click_link('Register for a Proco Manager account')
    fill_in 'Email', with: 'user@proco.com'
    fill_in 'Password', with: 'verysecure'
    fill_in 'Password confirmation', with: 'verysecure'
    choose('user_user_type_restricted_permission')
    click_button('Sign up')
  end

  def register_as_edit_user
    visit('/')
    click_link('Sign in', match: :first)
    click_link('Register for a Proco Manager account')
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'verysecure'
    fill_in 'Password confirmation', with: 'verysecure'
    choose('user_user_type_edit_permission')
    click_button('Sign up')
  end

  def create_quiz_with_question_and_answers
    click_link('New Quiz')
    fill_in 'Quiz name', with: 'My Amazing Quiz'
    fill_in 'Question', with: 'Whats the object oriented way to become wealthy?'
    fill_in 'quiz[questions_attributes][0][answers_attributes][0][name]', with: 'Win the lottery'
    fill_in 'quiz[questions_attributes][0][answers_attributes][1][name]', with: 'Inheritance'
    fill_in 'quiz[questions_attributes][0][answers_attributes][2][name]', with: 'Rob a bank'
    click_button('Create Quiz')
  end
end