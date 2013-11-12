module Application
  class EventNotFoundError < StandardError; end
  class EventExpiredError < StandardError; end
  class AlreadyAppliedError < StandardError; end
end