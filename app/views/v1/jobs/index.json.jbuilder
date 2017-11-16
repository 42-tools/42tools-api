json.array! @jobs do |job|
  json.extract! job, :id, :priority, :attempts, :run_at, :locked_at, :failed_at, :locked_by, :queue, :created_at, :updated_at
end
