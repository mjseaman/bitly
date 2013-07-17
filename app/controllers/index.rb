get '/' do

  # let user create new short URL, display a list of shortened URLs
  erb :index
end

post '/urls' do
  new_url = Url.new(params)
  if new_url.valid?
    new_url.save
    @url_message = "Your short url is <a href=\"http://localhost:9393/" + new_url.short + "\">localhost:9393/" + new_url.short + "</a>"
  else
    @url_message = "Your URL was invalid.  Please be sure to include http://, etc."
  end
  erb :index
end

# e.g., /q6bda
get '/:short' do
  # puts params[:short_url]
  long_url_record = Url.find_by_short(params[:short])
  long_url_record.counter += 1
  long_url_record.save
  redirect long_url_record.long
end
