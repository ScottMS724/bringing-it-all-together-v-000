class Dog 
  attr_accessor :id, :name, :breed 
  
  def initialize(id: nil, name:, breed:)
    @id = id 
    @name = name 
    @breed = breed 
  end 
  
  def self.create_table 
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS dogs ( 
        id INTEGER PRIMARY KEY, 
        name TEXT, 
        breed TEXT 
        )
      SQL
      
      DB[:conn].execute(sql)
  end 
  
  def self.drop_table 
    sql = <<-SQL
      DROP TABLE IF EXISTS dogs
      SQL
      
      DB[:conn].execute(sql)
  end 
  
  def self.new_from_db(row)
    attributes_hash = {
      :id => row[0],
      :name => row[1],
      :breed => row[2]
    }
    self.new(attributes_hash)
  end
  
  def self.find_by_name(name)
    sql = <<-SQL
      "SELECT *
      FROM dogs 
      WHERE name = ?
      LIMIT 1
      SQL
      
      DB[:conn].execute(sql, name).collect do |row|
        self.new_from_db(row)
      end.first 
  end 
  
  def update
    
  end 
  
  def save 
  end 
  
  
  
  
  
end 