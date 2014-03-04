class BookStore
  def self.init_methods
    instance_eval do
      const_set("SEARCH_FIELDS", [:title, :author]) 

      @@total_books = 0

      def search(query)
        'Nothing'
      end
    end

    class_eval do
      def initialize
        @books = []
      end

      def add_book(title, author)
        @books << { title: title, author: author }
      end
    end
  end

  def self.clear!
    class_eval do
      undef :add_book
    end

    instance_eval do
      undef :search
      remove_class_variable(:@@total_books)
      remove_const(:SEARCH_FIELDS)
    end
  end
end
