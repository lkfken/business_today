require 'bundler'
Bundler.require

class BusinessToday
  class << self
    def is_open?(date = Date.today)
      calendar.business_day?(date)
    end

    def run(date = Date.today)
      is_open?(date) ? exit(0) : exit(1)
    end

    def calendar
      @calendar ||= Business::Calendar.load('cchp')
    end
  end
end