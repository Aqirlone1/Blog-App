class AddFeedbackToTodos < ActiveRecord::Migration[7.0]
  def change
    add_column :todos, :feedback, :string
  end
end
