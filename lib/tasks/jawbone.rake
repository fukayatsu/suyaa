namespace :jawbone do
  desc 'fetch bandevents and tweet'
  task bandevents: :environment do
    jawbone = Jawbone::Client.new User.first.token
    bandevent = JawboneEvent.find_by(name: 'bandevents')
    unless bandevent
      JawboneEvent.create(name: 'bandevents', last_created_on: Time.now.to_i)
      exit
    end

    events = jawbone.bandevents(created_after: bandevent.last_created_on)
    bandevent.update!(last_created_on: events['meta']['time'])

    events['data']['items'].each do |item|
      puts item['action']
    end
  end
end
