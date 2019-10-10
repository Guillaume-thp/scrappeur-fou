require_relative '../lib/app.rb'

decribe "the perform method" do
    it "should return" do
    expect(perform[3].symbol[0].length < 10).to eq(true)
    expect(perform[3].values[0].class.to_s).to eq('Float')
    end
end
