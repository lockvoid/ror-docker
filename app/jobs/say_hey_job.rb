class SayHeyJob < ApplicationJob
  queue_as :default

  def perform(item)
    sleep 5
    # Do something later
  end
end
