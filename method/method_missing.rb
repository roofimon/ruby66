class BookStore
  def initialize
    @books = []
  end

  def add_book(title, author)
    @books << { title: title, author: author }
  end

  def method_missing(method_name, *args, &block)
    match = /find_by_(.+)/.match(method_name.to_s)
    if match
      @books.select { |book| book[match[1].to_sym] == args.first }.first
    else
      super
    end
  end
end

describe BookStore do
  # Given
  let!(:book_store) { BookStore.new }
  let!(:ruby_book) { { title: 'Ruby', author: 'Matz'} }

  before do
    # Given
    book_store.add_book('Ruby', 'Matz')
  end

  describe '#find_by_author' do
    it 'should return a book writen by a given author' do
      # When
      book = book_store.find_by_author('Matz')
      # Then
      expect(book).to eq ruby_book
    end

    context 'When author does not exist' do
      it 'should return nil' do
        # When
        book = book_store.find_by_author('Gosling')
        # Then
        expect(book).to be_nil
      end
    end
  end

  describe '#find_by_title' do
    it 'should return a book that has a given title' do
      # When
      book = book_store.find_by_title('Ruby')
      # Then
      expect(book).to eq ruby_book
    end

    context 'When title does not exist' do
      it 'should return nil' do
        # When
        book = book_store.find_by_title('Java')
        # Then
        expect(book).to be_nil
      end
    end
  end

  context 'When find by column that does not exist' do
    it 'should return nil' do
      # When
      book = book_store.find_by_content("whatever")
      # Then
      expect(book).to be_nil
    end
  end

  context 'When invoke a method that does not exist' do
    it 'should raise NoMethodError' do
      # When & Then
      expect{book_store.find}.to raise_error(NoMethodError)
    end
  end
end
