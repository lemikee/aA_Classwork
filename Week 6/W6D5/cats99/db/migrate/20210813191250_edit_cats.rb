class EditCats < ActiveRecord::Migration[5.2]
  def change

    change_column :cats, :sex, :string, null: false

  end
end
