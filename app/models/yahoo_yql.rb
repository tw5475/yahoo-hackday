# encoding: utf-8
require 'google_translate'
class YahooYql
  def yql(query)
    uri = "http://query.yahooapis.com/v1/public/yql"
    response = Net::HTTP.post_form( URI.parse( uri ), {
      'q' => query,
      'format' => 'json'
    })
    json = JSON.parse( response.body )
    return json
  end
  def get_weather()
    res = {}
    response = yql("select * from weather.forecast where woeid=2306179 AND u='c'")
    if response["query"] && response["query"]["results"]
      response = response["query"]["results"]["channel"]
      response["item"]["description"]  =~ /src=\"(.*?)\"/
      res.merge!(:sunrise=>response["astronomy"]["sunrise"],
                :sunset => response["astronomy"]["sunset"],
                :image =>$1,
                :temp => response["item"]["condition"]["temp"]+"度",
                :text => GoogleTranslate.new.translate("en".to_sym, "zh-TW".to_sym, response["item"]["condition"]["text"]).first,
                :en_text => response["item"]["condition"]["text"],
                :temp_range => "#{response["item"]["forecast"][0]["low"]} ~ #{response["item"]["forecast"][0]["high"]} 度"
                )
    end
    res
  end
end