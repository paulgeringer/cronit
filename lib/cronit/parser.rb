class Parser
  attr_accessor :crontab

  def initialize(crontab)
    @crontab = crontab
  end

  def arrayify_crontab
    crontab.split
  end

  def validate_crontab
    raise InvalidCrontab if self.arrayify_crontab.length < 5
  end
end

class InvalidCrontab < StandardError
end
