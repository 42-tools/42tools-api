namespace :coalitions do
  desc 'Updates coalitions'
  task update: :environment do
    FortyTwo::Api.instance.get('/v2/coalitions') do |coalitions_payload|
      coalitions_payload.each do |coalition_data|
        unless FortyTwo::User.exists?(coalition_data.user_id)
          UserJob.perform_now(coalition_data.user_id)
        end

        coalition = FortyTwo::Coalition.find_or_initialize_by(id: coalition_data.id)
        coalition.assign_attributes(
          name: coalition_data.name, slug: coalition_data.slug, image_url: coalition_data.image_url,
          color: coalition_data.color, score: coalition_data.score, master_id: coalition_data.user_id
        )
        coalition.save!
      end
    end
  end
end
