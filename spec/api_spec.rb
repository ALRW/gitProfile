describe ApiController do
  username = 'ALRW'

  describe '#request' do
    it "sends a http request to an api" do
      expect(subject.request(username)).to eq("OK")
    end
  end

  describe '#build_url' do
    it "creates the request url" do
      expect(subject.build_url(username)).to eq("https://api.github.com/search/users?q=ALRW")
    end

    it "can incorporate a user key if required" do
      key = "123456"
      expect(subject.build_url(username, key)).to eq("https://api.github.com/search/users?access_token=123456&q=ALRW")
    end
  end


end
