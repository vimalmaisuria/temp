class Project < ActiveRecord::Base
  has_many :tasks
  accepts_nested_attributes_for :tasks, :allow_destroy => true

   def task_attributes=(task_attributes)
       task_attributes.each do |attributes|
       tasks.build(attributes)
     end
   end
end
