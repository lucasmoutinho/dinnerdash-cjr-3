class ApagandoColunaCategory < ActiveRecord::Migration[5.1]
  change_table(:meals) do |m|
  	m.remove :category
  end
end
