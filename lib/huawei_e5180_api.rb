require 'mechanize'
require 'active_support'
require 'active_support/core_ext'

# monitor Huawei E5180 LTE modem
class HuaweiE5180Api < Mechanize
  attr_accessor :address

  DEFAULT_ADDRESS = '192.168.8.1'

  def initialize(address = DEFAULT_ADDRESS)
    @address = address
    super
  end

  def method_missing(m, *_args, &_block)
    cookie!
    Hash.from_xml(get(send("#{m}_url")).body)['response']
  end

  private

  def monitoring_url(endpoint)
    "http://#{address}/api/monitoring/#{endpoint}"
  end

  def status_url
    monitoring_url('status')
  end

  def status_info_url
    "http://#{address}/api/cradle/status-info"
  end

  def check_notifications_url
    monitoring_url('check-notifications')
  end

  def mobile_dataswitch_url
    "http://#{address}/api/dialup/mobile-dataswitch"
  end

  def traffic_statistics_url
    monitoring_url('traffic-statistics')
  end

  def converged_status_url
    monitoring_url('converged-status')
  end

  def current_plmn_url
    "http://#{address}/api/net/current-plmn"
  end

  def home_url
    "http://#{address}/html/home.html"
  end

  def cookie!
    @cookie_request ||= get(home_url)
  end
end
