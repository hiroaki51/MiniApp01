class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string      :user_id
      t.text        :comment
      t.timestamps
    end
  end
end
