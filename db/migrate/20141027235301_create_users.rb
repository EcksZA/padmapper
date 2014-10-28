class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :first_name
    	t.string :last_name
    	t.string :company
    	t.string :work_phone
    	t.string :cell_phone
    end
  end
end
