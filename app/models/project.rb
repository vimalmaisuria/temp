class Project < ActiveRecord::Base
  has_many :tasks
  accepts_nested_attributes_for :tasks, :allow_destroy => true

   def task_attributes=(task_attributes)
       task_attributes.each do |attributes|
       tasks.build(attributes)
     end
   end
   
   def self.search(params)
     projects = scoped
     projects = projects.where("name like ?","%" + params[:name] + "%") if params[:name]
     projects
    # if params
     # where('name LIKE ?',"%#{params}")
  #  else
      # scoped
   # end
   end
   
   def self.scope_builder
     DynamicDelegator.new(scoped)
   end
   
end
