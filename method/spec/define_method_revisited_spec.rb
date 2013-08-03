require_relative '../define_method_revisited.rb'

describe BookStore do
  let!(:book_store) { BookStore.new }
  let!(:ruby_book) { { title: 'Ruby', author: 'Matz'} }

  before do
    # Given
    book_store.add_book('Ruby', 'Matz')
  end

  describe "#find_by_author" do
    context 'When it has not been invoked' do
      it 'does not exist in BookStore' do
        expect(book_store.respond_to? :find_by_author).to be_false
      end
    end

    context 'When it has been invoked' do
      subject { book_store.find_by_author 'Matz' }

      it 'exists in BookStore' do
        subject
        expect(book_store.respond_to? :find_by_author).to be_true
        expect(subject).to eq ruby_book
      end
    end
  end

  describe "#find_by_title" do
    context 'When it has not been invoked' do
      it 'does not exist in BookStore' do
        expect(book_store.respond_to? :find_by_title).to be_false
      end
    end

    context 'When it has been invoked' do
      subject { book_store.find_by_title 'Ruby' }

      it 'exists in BookStore' do
        subject
        expect(book_store.respond_to? :find_by_title).to be_true
        expect(subject).to eq ruby_book
      end
    end
  end
end
