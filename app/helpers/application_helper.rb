module ApplicationHelper
  def flash_class(level)
    case level.to_sym
      # allow either standard rails flash category symbols...
      when :notice then "info"
      when :success then "success"
      when :alert then "warning"
      when :error then "danger"
      # ... or bootstrap class symbols
      when :info then "info"
      when :warning then "warning"
      when :danger then "danger"
      # and default to being alarming
      else "danger"
    end
  end

  def page_title
    @title || controller_name.gsub( /Controller/, "" ).humanize
  end

  def map_for(geolocation)
    if geolocation
      content_tag(
        :iframe,
        nil,
        width: "100%",
        height:"450",
        frameborder: "0",
        style: "border:0",
        allowfullscreen: true,
        src: "https://www.google.com/maps/embed/v1/place?q=#{geolocation}&zoom=10&key=#{ENV['GOOGLE_API_KEY']}"
      )
    else
      yield if block_given?
    end
  end
end
