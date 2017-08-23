class CreateMovieAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :movie_attachments do |t|
      t.integer  :movie_id,  :index  =>  true
      t.string   :attachment
      t.string   :description
      t.timestamps
    end
  end
end
