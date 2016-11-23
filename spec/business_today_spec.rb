require 'rspec'
require_relative '../lib/business_today'
require_relative 'spec_helper'

describe BusinessToday do
  context 'without a given date, the date is set to today' do
    it 'should return true if today is a business day, or not a holiday' do
      expect(BusinessToday.is_open?).to be_truthy
    end
    it 'should have the exit code' do
      expect { BusinessToday.run }.to terminate.with_code(0)
    end
  end

  context 'with a given date' do
    let(:holiday) { Date.civil(2016, 11, 24) }
    it 'should return false if today is a holiday, or not a business day' do
      expect(BusinessToday.is_open?(holiday)).to be_falsey
    end
    it 'should have the exit code' do
      expect { BusinessToday.run(holiday) }.to terminate.with_code(1)
    end
  end
end