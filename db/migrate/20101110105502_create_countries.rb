class CreateCountries < ActiveRecord::Migration
  def self.up
    create_table :countries do |t|
      t.string :name
      t.string :code
    end
  end

  def self.down
    drop_table :countries
  end
end
