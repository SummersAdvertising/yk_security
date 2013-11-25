class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.string :title
      t.string :area
      t.text :content
      t.string :compensation
      t.string :job_type
      t.string :shift
      t.string :holiday
      t.string :experience
      t.string :educated
      t.string :comment
      t.string :contact_name
      t.string :contact_phone
      t.text :contact_address
      t.string :contact_email
      t.string :notice_type
      t.string :status

      t.timestamps
    end
  end
end
