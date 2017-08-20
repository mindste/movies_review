class AddFriendlyIdToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column  :movies,  :friendly_id,  :string
    add_index  :movies, :friendly_id,  :unique  =>  true

    Movie.find_each  do  |m|
      m.update( :friendly_id  =>  SecureRandom.uuid )
    end
  end

end
