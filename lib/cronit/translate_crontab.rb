class TranslateCrontab
  attr_accessor :crontab

  def initialize(crontab)
    @crontab = crontab
  end

  def suffix(num)
    if num > 1
      "s"
    else
      ""
    end
  end

  def ordinal(num)
    case num
    when 1
      "st"
    when 2
      "nd"
    when 3
      "rd"
    else
      "th"
    end
  end

  def translate
    output = ""
    if crontab.is_a? Array
      crontab.each_with_index do |entry, index|
        case index
        when 0
          output << "Every #{entry} minute#{suffix(entry.to_i)}"
        when 1
          output << "Every #{entry} hour#{suffix(entry.to_i)}"
        when 2
          output << "Every #{entry}#{ordinal(entry[-1].to_i)} of the month"
        when 3
          output << "Every #{entry}#{ordinal(entry[-1].to_i)} month"
        when 4
          output << "Every #{entry}#{ordinal(entry[-1].to_i)} day of the week"
        end
      end
      output
    else
      case crontab
      when "@monthly"
        output << "Once every month"
      when "@year"
        output << "Once every year"
      when "@annually"
        output << "Once every year"
      when "@weekly"
        output << "Once every week"
      when "@daily"
        output << "Once every day"
      when "@hourly"
        output << "Once every hour"
      when "@reboot"
        output << "Once every reboot"
      end
    end
  end

end
