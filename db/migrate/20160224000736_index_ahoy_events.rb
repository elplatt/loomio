class IndexAhoyEvents < ActiveRecord::Migration[5.2]
  def change
    ActiveRecord::Base.connection.execute "CREATE INDEX ahoy_events_properties ON ahoy_events USING gin (properties);"
  end
end
