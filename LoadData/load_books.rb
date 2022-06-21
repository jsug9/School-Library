require 'json'
require_relative '../Classes/book'

module Books_controller
  def load_books
    data = []
    file = './data/books.json'
    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |book|
        data << Book.new( book['title'], book['author'])
      end
    end
    data
  end

  def save_books
    data = []
    @books.each do |book|
      data << {title: book.title, author: book.author}
    end
    File.write('./data/books.json', JSON.generate(data))
  end
end