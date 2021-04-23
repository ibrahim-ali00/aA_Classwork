require "sqlite3"
require "singleton"

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super("questions.db")
  end
end

class Users
  def initialize(options)
    @id = options["id"]
    @fname = options["fname"]
    @lname = options["lname"]
  end

  def self.find_by_name(fname, lname)
    users_data = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
        SELECT
            *
        FROM
            users
        WHERE
            fname = users.fname, lname = users.lname 
    SQL
    return nil unless questions.length > 0
    User.new(users_data)
  end
end

class Question
  attr_accessor :id, :title, :body, :author_id
  def self.find_by_id(id)
    questions_data = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            questions
        WHERE
            id = questions.id
    SQL
    return nil unless questions.length > 0
    Question.new(questions_data)
  end

  def self.find_by_author_id(author_id)
    questions_data = QuestionsDatabase.instance.execute(<<-SQL, author_id)
        SELECT
            *
        FROM
            questions
        WHERE
            author_id = questions.author_id
    SQL
    return nil unless questions.length > 0
    Question.new(questions_data)
  end

  #   def author
  #     .find_by_id()
  #   end

  def initialize(options)
    @id = options["id"]
    @title = options["title"]
    @body = options["body"]
    @author_id = options["author_id"]
  end
end

class QuestionFollows
  def initialize(options)
    @id = options["id"]
    @question_id = options["question_id"]
    @follower_id = options["follower_id"]
  end
end

class QuestionLikes
  def initialize(options)
    @id = options["id"]
    @question_id = options["question_id"]
    @liker_id = options["liker_id"]
  end
end

class Replies
  def initialize(options)
    @id = options["id"]
    @question_id = options["question_id"]
    @user_reply_id = options["user_reply_id"]
    @body = options["body"]
    @parent_reply_id = options["parent_reply_id"]
  end
end
