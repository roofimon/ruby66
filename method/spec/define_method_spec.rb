require_relative '../define_method.rb'

describe BookStore do
  # Given
  let!(:book_store) { BookStore.new }
  let!(:ruby_book) { { title: 'Ruby', author: 'Matz'} }

  before do
    # Given
    book_store.add_book('Ruby', 'Matz')
  end

  describe '#find_by_author' do
    it 'should be responded by BookStore instance' do
      expect(book_store.respond_to? :find_by_author).to be_true
    end

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
    it 'should be responded by BookStore instance' do
      expect(book_store.respond_to? :find_by_title).to be_true
    end

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
    it 'should invoke method_missing' do
      book_store.should_receive(:method_missing)
      book = book_store.find_by_content("whatever")
    end
  end
end
