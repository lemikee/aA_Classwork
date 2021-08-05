require 'sqlite3'
require 'singleton'

class QuestionDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true # makes sure that it correctly converts to correct ruby type ie varchar --> str
    self.results_as_hash = true # makes sure that result is a hash
  end

end