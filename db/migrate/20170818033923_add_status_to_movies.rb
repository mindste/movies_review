class AddStatusToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column  :movies, :status, :string, :default  =>  "hidden"
  end
end
