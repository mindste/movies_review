class CreateBuyers < ActiveRecord::Migration[5.0]
  def change
    create_table :buyers do |t|
      t.string  :status, :default  =>  "pending"
      t.string  :uuid
      t.string  :name
      t.string  :email
      t.string  :cellphone
      t.integer  :movie_id, :index  =>  true
      t.integer :user_id,  :index  =>  true
      t.integer :ticket_id,  :index  =>  true
      t.text  :bio
      t.timestamps
    end

    add_index  :buyers, :uuid,  :unique  =>  true
  end
end
