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
