class CreateResumes < ActiveRecord::Migration[6.1]
  def change
    create_table :resumes do |t|
  
      t.string     :furigana, limit: 255
      t.string     :name, limit: 255
      t.text       :about_me, limit: 255
      t.text       :career, limit: 1000
      t.string     :profile_image
      t.text       :skill, limit: 1000
      t.text       :hobby, limit: 1000
      
      t.references :user, foreign_key: true, null: false
      
      t.timestamps
    end
  end
end
