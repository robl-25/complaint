class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :locales do |t|
      t.string :city
      t.string :state
      t.string :country
    end

    create_table :companies do |t|
      t.string :name
    end

    create_table :complains do |t|
      t.string :title
      t.text :description
      t.references :company
      t.references :locale
      t.timestamp
    end
  end
end
