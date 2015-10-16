require 'net/http'

class AjaxController < ApplicationController

  def test
  end

  def upanel
    @time = Time.now.to_s
  end

  def search
    @books = Book.select(:publish).distinct
  end

  def result
    sleep(2)
    @books = Book.where(publish: params[:publish])
  end

  def slideshow
    #api_key = 'xxxxxxxx'
    #secret = 'xxxxxxxx'
    api_key = 'qPIgzUDk'
    secret = 'T6o6e2YU'
    ts = Time.now.to_i
    h = Digest::SHA1.hexdigest(secret + ts.to_s)
    render text: "https://www.slideshare.net/api/2/search_slideshows?q=Rails&lang=ko&api_key=#{api_key}&hash=#{h}&ts=#{ts}"
  end

  def search_slide
    #api_key = 'xxxxxxxx'
    #secret = 'xxxxxxxx'
    api_key = 'qPIgzUDk'
    secret = 'T6o6e2YU'
    ts = Time.now.to_i
    h = Digest::SHA1.hexdigest(secret + ts.to_s)
    Net::HTTP.start('www.slideshare.net', 443,
      use_ssl: true, ca_file: 'tmp/cacert.pem') do |https|
      res = https.get("/api/2/search_slideshows?q=#{ERB::Util.url_encode(params[:keywd])}&lang=ko&api_key=#{api_key}&hash=#{h}&ts=#{ts}")
      render json: Hash.from_xml(res.body).to_json
    end
  end

end
