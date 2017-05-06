class Task < ApplicationRecord
  belongs_to :user

  def complete
    self.completed = true
    self.save
  end

  def as_json(options={})
    super(except: [:user_id, :created_at, :updated_at])
  end

end
