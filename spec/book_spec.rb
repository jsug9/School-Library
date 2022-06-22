require './Classes/book'

describe Book do
  title = 'The Great Gatsby'
  author = 'F. Scott Fitzgerald'
  let(:book) { Book.new(title, author) }

  it 'should be a book' do
    expect(book).to be_a(Book)
  end

  it 'should have a title' do
    expect(book.title).to eq(title)
  end

  it 'should have an author' do
    expect(book.author).to eq(author)
  end

  it 'should have a list of rentals' do
    expect(book.rentals).to eq([])
  end
end
