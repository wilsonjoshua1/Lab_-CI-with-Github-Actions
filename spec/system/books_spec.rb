require 'rails_helper'

RSpec.describe "Books", type: :system do
  before do
    driven_by(:rack_test)
  end

  # pending "add some scenarios (or delete) #{__FILE__}"
  
  it 'adds a book successfully with a flash notice' do
  visit new_book_path  # Navigate to the new book form
    
  fill_in 'Title', with: 'Title'  # Fill in the title
  click_button 'Create Book'  # Submit the form

  # Check that a flash notice appears
  expect(page).to have_content('Book was successfully created.')

 # Check if the book was added to the database
  expect(Book.count).to eq(1)  
end

it 'fails to add a book with an empty title and shows a flash alert' do
  visit new_book_path  # Navigate to the new book form
  # Leave title empty
  fill_in 'Title', with: ''  
  # Submit the form
  click_button 'Create Book'  

  # Check that a flash alert appears
  expect(page).to have_content('Failed to add book. Please check the form.')



  expect(Book.count).to eq(0)  
end
end