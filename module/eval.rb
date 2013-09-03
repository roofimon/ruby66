class BookStore
  def self.init_methods
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
  end
end
