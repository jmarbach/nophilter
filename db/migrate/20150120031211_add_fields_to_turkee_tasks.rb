class AddFieldsToTurkeeTasks < ActiveRecord::Migration
  def change
  	 add_column :turkee_tasks, :form_body, :text
  	 add_column :turkee_tasks, :display_submissions, :boolean
  end


end
