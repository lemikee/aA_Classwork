require_relative 'question_database'

class User
  attr_accessor :id, :fname, :lname

  def self.find_by_id(id)
   data = QuestionDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        users.id = ?
    SQL

    data.empty? User.new(data.first)
  end

  def initialize(hash)
    @id = hash.values_at('id')
    @fname = hash.values_at('fname')
    @lname = hash.values_at('lname')
  end

end