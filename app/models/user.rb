class User < ApplicationRecord
  has_many :tasks

  def as_json(options={})
    super( only: [:id, :name],
    methods: [:tasks_count],
    include: [tasks: {only: :name}])
  end

  def tasks_count
    self.tasks.count
  end

end
