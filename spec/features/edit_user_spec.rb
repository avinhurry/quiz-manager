# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'edit user journey', type: :feature do
  scenario 'register for an edit user account' do
    register_as_edit_user
    expect(page).to have_text('Welcome! You have signed up successfully.')
  end

  scenario 'creating a quiz with question and answers' do
    register_as_edit_user
    create_quiz_with_question_and_answers
    expect(page).to have_text('Quiz was successfully created.')
  end

  scenario 'editing a quiz' do
    register_as_edit_user
    create_quiz_with_question_and_answers
    expect(page).to have_text('My Amazing Quiz')
    expect(page).to have_text('Whats the object oriented way to become wealthy?')
    expect(page).to have_text('Win the lottery')
    expect(page).to have_text('Inheritance')
    expect(page).to have_text('Rob a bank')
    click_link('Edit')
    fill_in 'Quiz name', with: 'My Not So Amazing Quiz'
    fill_in 'Question', with: 'Is the earth flat?'
    fill_in 'quiz[questions_attributes][0][answers_attributes][0][name]', with: 'Yes'
    fill_in 'quiz[questions_attributes][0][answers_attributes][1][name]', with: 'No'
    fill_in 'quiz[questions_attributes][0][answers_attributes][2][name]', with: 'If it has an edge'
    click_button('Update Quiz')
    expect(page).to_not have_text('My Amazing Quiz')
    expect(page).to have_text('My Not So Amazing Quiz')
    expect(page).to have_text('Is the earth flat?')
    expect(page).to have_text('Yes')
    expect(page).to have_text('No')
    expect(page).to have_text('If it has an edge')
  end

  scenario 'viewing crud links to quiz' do
    register_as_edit_user
    create_quiz_with_question_and_answers
    click_link('Quizzes')
    expect(page).to have_text('My Amazing Quiz')
    expect(page).to have_link('View')
    expect(page).to have_link('Edit')
    expect(page).to have_link('Delete')
    expect(page).to have_link('New Quiz')
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
