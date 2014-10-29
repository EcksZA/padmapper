class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
    	t.string :address
    	t.string :price
    	t.string :bedroom
    	t.string :bathroom
    end
  end
end
