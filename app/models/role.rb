class Role < ActiveRecord::Base

	belongs_to :person
	belongs_to :project
	belongs_to :status
	validates :person_id, presence: true
    validates :project_id, presence: true
    validates :status_id, presence: true
    validates :title, presence: true

    default_scope {order("updated_at Desc")}

end
