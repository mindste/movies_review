class AddRowOrderToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column  :movies, :row_order,  :integer


     # 因为要改用这个 row_order 来做排序，而数据库已经有的 events 默认是 nil
     # 因此这里要设定 row_order 的值，其中 `:last` 是 ranked-model
     Movie.find_each do |m|
       m.update( :row_order_position => :last )
     end

     add_index :movies, :row_order
  end
end
