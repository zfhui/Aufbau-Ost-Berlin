class AddAddressToBuildings < ActiveRecord::Migration
  def change
    add_column :buildings, :street_name, :string, default: ""
    add_column :buildings, :house_no,    :string, default: ""
    add_column :buildings, :zipcode,     :string, default: ""
    add_column :buildings, :city,        :string, default: ""
    add_column :buildings, :country,     :string, default: ""
  end
end
