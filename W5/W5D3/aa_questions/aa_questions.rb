require 'sqlite3'
require 'singleton'


class QuestionsDatabase < SQLite3::Database

include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end

end

class Users




end

class Questions

  def find_by_id(num)
    excecute(<<-SQL, id)
    Question.new = SELECT id FROM questions WHERE id = num
    SQL
  end

  def find_by_title(title)
    
  end


end

class Question_Likes


end


class Replies



end

class Question_Follows



end