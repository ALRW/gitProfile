describe ApiController do
  let(:username) { 'ALRW' }
  let(:key) { '123456' }
  subject(:apiReq) { described_class.new() }

  describe '#request' do
    it "sends a http request to an api" do
      apiReq.request(username)
      expect(apiReq.response.message).to eq("OK")
    end

    it 'returns a json object' do
      apiReq.request(username)
      expect{ JSON.parse(apiReq.response.body) }.not_to raise_error
    end
  end

  describe '#build_url' do
    it "creates the request url" do
      expect(apiReq.build_url(username)).to eq("https://api.github.com/search/users?q=ALRW")
    end

    it "can incorporate a user key if required" do
      expect(apiReq.build_url(username, key)).to eq("https://api.github.com/search/users?access_token=123456&q=ALRW")
    end
  end


end
