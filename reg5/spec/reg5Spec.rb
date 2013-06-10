require 'spec_helper'

describe 'reg5' do
  describe "My cat eats catfood".sub("cat", "dog") do
    it{should eql("My dog eats catfood")}
  end

  describe "My cat eats catfood".sub(/cat/, "dog") do
    it{should eql("My dog eats catfood")}
  end

  describe "My cat eats catfood".gsub("cat", "dog") do
    it{should eql("My dog eats dogfood")}
  end

  str = "My cat gets catatonic when I attempt to concatenate his food with Muscat grapes"
  describe str.gsub("cat", "dog") do
    it{should eql("My dog gets dogatonic when I attempt to condogenate his food with Musdog grapes")}
  end

  describe str.gsub(/\bcat\b/, 'dog') do
    it{should eql("My dog gets catatonic when I attempt to concatenate his food with Muscat grapes")}
  end

  contracts_arr = [
    "Hughes Missile Systems Company, Tucson, Arizona, is being awarded a $7,311,983 modification to a
    firm fixed price contract for the FY94 TOW missile production buy, total 368 TOW 2Bs. Work will be
    performed in Tucson, Arizona, and is expected to be completed by April 30, 1996. Of the total contract
    funds, $7,311,983 will expire at the end of the current fiscal year. This is a sole source contract initiated on
    January 14, 1991. The contracting activity is the U.S. Army Missile Command, Redstone Arsenal, Alabama
    (DAAH01-92-C-0260).",
    "Conventional Munitions Systems, Incorporated, Tampa, Florida, is being awarded a $6,952,821
    modification to a firm fixed price contract for Dragon Safety Circuits Installation and retrofit of Dragon I
    Missiles with Dragon II Warheads. Work will be performed in Woodberry, Arkansas (90%), and Titusville,
    Florida (10%), and is expected to be completed by May 31, 1996. Contract funds will not expire at the
    end of the current fiscal year. This is a sole source contract initiated on May 2, 1994. The contracting activity is
    the U.S. Army Missile Command, Redstone Arsenal, Alabama (DAAH01-94-C-S076)."
  ]

  describe "the regex should match the dollar values in the array." do
    matches = []
    contracts_arr.each do |contract|
      matches << contract.match(/\$[\d,]+/).to_s
    end
    it{matches.should =~ ['$7,311,983','$6,952,821']}
  end

  describe "the regex should match the first date values in the array" do
    matches = []
    contracts_arr.each do |contract|
      matches << contract.match(/(\w+) \d{1,2}, \d{4}/).to_s
    end
    it{matches.should =~ ['April 30, 1996','May 31, 1996']}
  end

  describe "the regex should match the first date values, then delimits the dates with month, day, year" do
    matches = []
    contracts_arr.each do |contract|
      contract.match(/(\w+) (\d{1,2}), (\d{4})/) do |m|
        matches << "Month: #{m[1]}, Day: #{m[2]}, Year: #{m[3]}"
      end
    end
    it{matches.should =~ ["Month: April, Day: 30, Year: 1996","Month: May, Day: 31, Year: 1996"]}
  end

  describe "the regex should capture a few words before the date to get context" do
    matches = []
    contracts_arr.each do |contract|
      contract.match(/\b(.{10,20}) (\w+ \d{1,2}, \d{4})/){|m| matches << "#{m[1]} \t\t #{m[2]}"}
    end
    it{matches.should =~ [" to be completed by \t\t April 30, 1996", " to be completed by \t\t May 31, 1996"]}
  end

  describe "the regex should return date amoney strings" do
    matches = []
    contracts_arr.each do |contract|
      contract.match(/(\$[\d,]+).+?(\w+ \d{1,2}, \d{4})/m) do |m|
        matches << "#{m[1]} \t\t #{m[2]}"
      end
    end
    it{matches.should =~ ["$6,952,821 \t\t May 31, 1996", "$7,311,983 \t\t April 30, 1996"]}
  end

  locations = 'Alabama, AL, Alaska, AK, Arizona, AZ, Arkansas, AR, California, CA, Colorado, CO,
  Connecticut, CT, Delaware, DE, Florida, FL, Georgia, GA, South Dakota, SD'

  describe "should scan for all instances that fit regex" do
    it{locations.scan(/[A-Z]{2}/).should =~ ['AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'FL', 'GA', 'SD']}
    it{locations.scan(/(\w[A-Za-z ]+), ([A-Z]{2})/).map{|loc| {:state=>loc[1], :city=>loc[0]}}.
    should =~ [
      {:state=>"AL", :city=>"Alabama"}, {:state=>"AK", :city=>"Alaska"}, {:state=>"AZ", :city=>"Arizona"},
      {:state=>"AR", :city=>"Arkansas"}, {:state=>"CA", :city=>"California"}, {:state=>"CO", :city=>"Colorado"},
      {:state=>"CT", :city=>"Connecticut"}, {:state=>"DE", :city=>"Delaware"}, {:state=>"FL", :city=>"Florida"},
      {:state=>"GA", :city=>"Georgia"}, {:state=>"SD", :city=>"South Dakota"}
    ]}
  end


end










