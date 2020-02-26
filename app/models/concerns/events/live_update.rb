module Events::LiveUpdate
  def trigger!
    super
    notify_clients!
  end

  # send client live updates
  def notify_clients!
    # Have to skip this to prevent PG::InvalidParameterValue (ERROR:  payload string too long)
    # See https://stackoverflow.com/questions/41057130/postgresql-error-payload-string-too-long
    return
    eventable.groups.each do |group|
      MessageChannelService.publish_data(event_collection, to: group.message_channel)
    end
  end

  handle_asynchronously :notify_clients!

  def event_collection
    @event_collection ||= EventCollection.new(self).serialize!
  end
end
