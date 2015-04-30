require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe HuaweiE5180Api do
  let(:agent) { described_class.new }

  describe '#address' do
    it { expect(agent.address).to eq('192.168.8.1') }

    context 'when change address' do
      let(:changed_address) { '10.0.0.1' }
      let(:agent) { described_class.new(changed_address) }

      it { expect(agent.address).to eq(changed_address) }
    end
  end

  describe '#status' do
    it 'returns hash with stats' do
      VCR.use_cassette('status') do
        expect(
          agent.status
        ).to eq('BatteryLevel' => nil,
                'BatteryPercent' => nil,
                'BatteryStatus' => nil,
                'ConnectionStatus' => '901',
                'CurrentNetworkType' => '101',
                'CurrentNetworkTypeEx' => '101',
                'CurrentServiceDomain' => '3',
                'CurrentWifiUser' => '0',
                'PrimaryDns' => '84.72.84.72',
                'PrimaryIPv6Dns' => nil,
                'RoamingStatus' => '0',
                'SecondaryDns' => '56.18.56.18',
                'SecondaryIPv6Dns' => nil,
                'ServiceStatus' => '2',
                'SignalIcon' => '4',
                'SignalStrength' => nil,
                'SimStatus' => '1',
                'TotalWifiUser' => '32',
                'WanIPAddress' => '32.59.32.59',
                'WanIPv6Address' => nil,
                'WifiConnectionStatus' => nil,
                'WifiStatus' => '0',
                'classify' => 'cpe',
                'currenttotalwifiuser' => '32',
                'flymode' => '0',
                'maxsignal' => '5',
                'msisdn' => nil,
                'simlockStatus' => '0',
                'wififrequence' => '0',
                'wifiindooronly' => '0')
      end
    end
  end

  describe '#status_info' do
    it 'returns hash with stats' do
      VCR.use_cassette('status_info') do
        expect(
          agent.status_info
        ).to eq('connectionmode' => '5',
                'connectstatus' => '901',
                'cradlestatus' => '1',
                'currenttime' => '0',
                'gateway' => nil,
                'ipaddress' => nil,
                'macaddress' => 'AA:BB:CC:DD:EE:FF',
                'netmask' => nil,
                'primarydns' => nil,
                'secondarydns' => nil)
      end
    end
  end

  describe '#check_notifications' do
    it 'returns hash with stats' do
      VCR.use_cassette('check_notifications') do
        expect(
          agent.check_notifications
        ).to eq('OnlineUpdateStatus' => '14',
                'SmsStorageFull' => '0',
                'UnreadMessage' => '0')
      end
    end
  end

  describe '#mobile_dataswitch' do
    it 'returns hash with stats' do
      VCR.use_cassette('mobile_dataswitch') do
        expect(
          agent.mobile_dataswitch
        ).to eq('dataswitch' => '1')
      end
    end
  end

  describe '#traffic_statistics' do
    it 'returns hash with stats' do
      VCR.use_cassette('traffic_statistics') do
        expect(
          agent.traffic_statistics
        ).to eq('CurrentConnectTime' => '14835',
                'CurrentDownload' => '2046840798',
                'CurrentDownloadRate' => '192753',
                'CurrentUpload' => '403291957',
                'CurrentUploadRate' => '46346',
                'TotalConnectTime' => '16697',
                'TotalDownload' => '2319884614',
                'TotalUpload' => '712626243',
                'showtraffic' => '1')
      end
    end
  end

  describe '#converged_status' do
    it 'returns hash with stats' do
      VCR.use_cassette('converged_status') do
        expect(
          agent.converged_status
        ).to eq('CurrentLanguage' => 'pl-pl',
                'SimLockEnable' => '0',
                'SimState' => '257')
      end
    end
  end

  describe '#current_plmn' do
    it 'returns hash with stats' do
      VCR.use_cassette('current_plmn') do
        expect(
          agent.current_plmn
        ).to eq('FullName' => 'GreedyGSM',
                'Numeric' => '8472',
                'Rat' => '9',
                'ShortName' => 'Greedy',
                'State' => '0')
      end
    end
  end
end
