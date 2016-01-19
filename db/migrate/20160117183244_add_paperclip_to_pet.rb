class AddPaperclipToPet < ActiveRecord::Migration
  def change
    add_attachment :pets, :image 
  end
end
