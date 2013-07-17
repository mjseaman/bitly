get '/' do

  # let user create new short URL, display a list of shortened URLs
  erb :index
end

post '/urls' do
  new_url = Url.create(params)
  puts params
  @short_url = "localhost:9393/#{new_url.short}"
  @long_url = params[:long]
  erb :index
end

# e.g., /q6bda
get '/:id' do
  # puts params[:short_url]
  long_url_record = Url.find_by_short(params[:id])
  redirect long_url_record.long
end
