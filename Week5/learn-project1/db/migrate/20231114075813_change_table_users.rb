class ChangeTableUsers < ActiveRecord::Migration[7.1]
  def change
    change_table :users do |t|
      t.remove  :age
      t.string  :adrress
      t.index   :name
      t.rename  :sex, :generation
    end
  end
end
