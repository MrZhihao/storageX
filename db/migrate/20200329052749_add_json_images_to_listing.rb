class AddJsonImagesToListing < ActiveRecord::Migration
  def change
    add_column :listings, :images, :json
  end
end
