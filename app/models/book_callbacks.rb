class BookCallbacks
  cattr_accessor :logger
  self.logger ||= Rails.logger

  def after_destroy(b)
    logger.info('deleted: ' + b.inspect)
  end
end
