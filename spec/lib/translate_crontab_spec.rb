require 'spec_helper'

describe TranslateCrontab do

  describe "#translate" do
    context "standard crontab" do
      before(:each) do
        crontab_array = ['1', '2', '3', '4', '5']
        @crontab_string = TranslateCrontab.new( crontab_array ).translate
      end
     
      it "returns the correct minute entry" do
        expect(@crontab_string).to match(/Every 1 minute/)
      end

      it "returns the correct hour entry" do
        expect(@crontab_string).to match(/Every 2 hours/)
      end

      it "returns the correct day-of-month entry" do
        expect(@crontab_string).to match(/Every 3rd of the month/)
      end

      it "returns the correct month entry" do
        expect(@crontab_string).to match(/Every 4th month/)
      end

      it "returns the correct day-of-week entry" do
        expect(@crontab_string).to match(/Every 5th day of the week/)
      end
    end

    context "special @ cron syntax" do

      it "returns the correct entry for @monthly" do
        expect(TranslateCrontab.new("@monthly").translate).to match(/Once every month/)
      end

      it "returns the correct entry for @year" do
        expect(TranslateCrontab.new("@year").translate).to match(/Once every year/)
      end

      it "returns the correct entry for @annually" do
        expect(TranslateCrontab.new("@annually").translate).to match(/Once every year/)
      end

      it "returns the correct entry for @weekly" do
        expect(TranslateCrontab.new("@weekly").translate).to match(/Once every week/)
      end

      it "returns the correct entry for @daily" do
        expect(TranslateCrontab.new("@daily").translate).to match(/Once every day/)
      end

      it "returns the correct entry for @hourly" do
        expect(TranslateCrontab.new("@hourly").translate).to match(/Once every hour/)
      end
      
      it "returns the correct entry for @reboot" do
        expect(TranslateCrontab.new("@reboot").translate).to match(/Once every reboot/)
      end
    end

  end
  
end
