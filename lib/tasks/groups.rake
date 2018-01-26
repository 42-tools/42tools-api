namespace :groups do
  desc 'Updates groups'
  task update: :environment do
    FortyTwo::Api.instance.get('/v2/groups') do |groups_payload|
      groups_payload.each do |group_data|
        group = FortyTwo::Group.find_or_initialize_by(id: group_data.id)
        group.assign_attributes(name: group_data.name)
        group.save!
      end
    end
  end
end
