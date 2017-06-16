require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
    found_col = DBConnection.execute2(<<-SQL)
    SELECT *
    FROM #{self.table_name}
    LIMIT 0
    SQL
    @columns = found_col.first.map &:to_sym
  end

  def self.finalize!
    self.columns.each do |col_name|
      define_method(col_name) do
        self.attributes[col_name]
      end

      define_method("#{col_name}=") do |value|
        self.attributes[col_name] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || self.name.underscore.pluralize
  end

  def self.all
    all = DBConnection.execute(<<-SQL)
      SELECT #{table_name}.*
      FROM #{table_name}
    SQL
    parse_all(all)
  end

  def self.parse_all(results)
    results.map { |result| self.new(result) }
  end

  def self.find(id)
    all = DBConnection.execute(<<-SQL, id)
      SELECT #{table_name}.*
      FROM #{table_name}
      WHERE #{table_name}.id = ?
    SQL
    parse_all(all).first
  end

  def initialize(params = {})
    params.each do |attr_name, value|
    attr_name = attr_name.to_sym
     if self.class.columns.include?(attr_name)
       self.send("#{attr_name}=", value)
     else
       raise "unknown attribute '#{attr_name}'"
     end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.class.columns.map { |attr| self.send(attr) }
  end

  def insert
    columns = self.class.columns
    col_names = columns.map(&:to_s).join(", ")
    question_marks = (["?"] * columns.count).join(", ")

    DBConnection.execute(<<-SQL, *attribute_values)
    INSERT INTO
      #{self.class.table_name} (#{col_names})
    VALUES
      (#{question_marks})
    SQL

    self.id = DBConnection.last_insert_row_id
  end


  def update
    set_line = self.class.columns.map {
       |attr| "#{attr} = ?" }.join(", ")
    DBConnection.execute(<<-SQL, *attribute_values, id)
    UPDATE
      #{self.class.table_name}
    SET
      #{set_line}
    WHERE
      #{self.class.table_name}.id = ?
    SQL
  end

  def save
    # ...
  end
end
