class CreateUser < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, null: false, unique: true
      t.timestamps
    end

    create_table :polls do |t|
      t.string :title
      t.integer :author_id
      t.timestamps
    end

    create_table :questions do |t|
      t.text :question
      t.integer :poll_id
      t.timestamps
    end

    create_table :answer_choices do |t|
      t.integer :question_id
      t.text :answer_choice
      t.timestamps
    end

    create_table :responses do |t|
      t.integer :user_id
      t.integer :answer_choice_id
      t.timestamps
    end
    add_index :polls, :author_id
    add_index :questions, :poll_id
    add_index :answer_choices, :question_id
    add_index :responses, :user_id
    add_index :responses, :answer_choice_id
  end
end
