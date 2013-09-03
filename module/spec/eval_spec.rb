require_relative '../eval.rb'

describe BookStore do
  let!(:book_store) { BookStore.new }

  before do
    if book_store.instance_variable_defined? :@books
      book_store.remove_instance_variable :@books 
    end
  end

  after { BookStore.clear! unless example.metadata[:skip_after] }

  describe '#class_eval' do
    it 'evaluates additional methods' do
      expect(BookStore.instance_methods).not_to include :add_book
      BookStore.init_methods
      expect(BookStore.instance_methods).to include :add_book
    end

    it 'evaluates additional instance variables' do
      expect(book_store.instance_variable_defined? :@books).to be_false
      BookStore.init_methods
      book_store = BookStore.new
      expect(book_store.instance_variable_defined? :@books).to be_true
    end

    it 'raise an error for calling from instance', skip_after: true do
      expect{ book_store.class_eval { 'test' } }.to raise_error NoMethodError
    end
  end
end
