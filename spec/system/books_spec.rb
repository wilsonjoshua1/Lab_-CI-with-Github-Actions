require 'rails_helper'

RSpec.describe "Books", type: :system do
  before do
    driven_by(:rack_test)
  end

  # pending "add some scenarios (or delete) #{__FILE__}"
  
  #unit test
  it 'is valid with a title, author, price, and published date' do
    book = Book.new(title: 'Yes Title', author: 'Yes Author', price: 1.00, published_date: '2025-01-01' )
    expect(book).to be_valid
  end

  it 'adds a book successfully with a flash notice' do
  visit new_book_path  
  
  # Fill in
  fill_in 'Title', with: 'Title' 
  fill_in 'Author', with: 'Author'  
  fill_in 'Price', with: '1.00'
  select '2025-01-01', from: 'Published date'

  click_button 'Create Book'  # Submit the form

  # Check that a flash notice appears
  expect(page).to have_content('Book was successfully created.')

 # Check if the book was added to the database
  book = Book.last
  expect(book.title).to eq('Title')
  expect(book.author).to eq('Author')
  expect(book.price).to eq(1.00)
  expect(book.published_date).to eq(Date.parse('2025-01-01'))
  expect(Book.count).to eq(1)  
end

it 'fails to add a book with an empty title and shows a flash alert' do
  visit new_book_path 
  # Leave title empty
  fill_in 'Title', with: ''  
  click_button 'Create Book'  

  # Check that a flash alert appears
  expect(page).to have_content('Failed to add book. Please check the form.')

  expect(Book.count).to eq(0)  
end
end