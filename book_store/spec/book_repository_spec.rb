require 'book_repository'

RSpec.describe BookRepository do
  def reset_books_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store' })
    connection.exec(seed_sql)
  end
  before(:each) do 
    reset_books_table
  end

  it 'select first book form books table' do
    repo = BookRepository.new

    books = repo.all
    expect(books.length).to eq(5) # =>  5
    expect(books[0].id).to eq('1') # =>  1
    expect(books[0].title).to eq('Nineteen Eighty-Four') # =>  'Nineteen Eighty-Four'
    expect(books[0].author_name).to eq('George Orwell') # =>  'George Orwell'
  end

  it 'select second book from books' do
    repo = BookRepository.new

    books = repo.all
    expect(books[1].id).to eq('2') # =>  2
    expect(books[1].title).to eq('Mrs Dalloway') # =>  'Mrs Dalloway'
    expect(books[1].author_name).to eq('Virginia Woolf') # =>  'Virginia Woolf')
  end
end