require "fast_sqlite/version"
require 'sqlite3'

SQLite3::Database.class_eval do
  alias_method :initialize_original, :initialize
  def initialize(*args)
    initialize_original(*args)
    gotta_go_fast!

    if block_given?
      yield(self)
      close
    end
  end

  def gotta_go_fast!
    execute('PRAGMA synchronous = OFF')
    execute('PRAGMA journal_mode = MEMORY')
  end
end
