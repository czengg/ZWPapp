module ReportHelper

	CLIENT_ID = '1054118034982-4sv7qjfo178ggmi7vie9agsfuv5psptb.apps.googleusercontent.com'
    CLIENT_SECRET = 'OjhkWSpRibVM0m4hrfOU-M3T'
    OAUTH_SCOPE = 'https://www.googleapis.com/auth/drive'
    REDIRECT_URI = 'urn:ietf:wg:oauth:2.0:oob'

  def writeReport
    #GOOGLE DRIVE INTEGRATION

    require 'rubygems'
    require 'google/api_client'
    require 'launchy'

    # Get your credentials from the console


    # Create a new API client & load the Google Drive API
    client = Google::APIClient.new
    drive = client.discovered_api('drive', 'v2')

    # Request authorization
    client.authorization.client_id = CLIENT_ID
    client.authorization.client_secret = CLIENT_SECRET
    client.authorization.scope = OAUTH_SCOPE
    client.authorization.redirect_uri = REDIRECT_URI

    uri = client.authorization.authorization_uri
    Launchy.open(uri)

    # Exchange authorization code for access token
    $stdout.write  "Enter authorization code: "
    client.authorization.code = gets.chomp
    client.authorization.fetch_access_token!

    # Insert a file
    file = drive.files.insert.request_schema.new({
      'title' => 'My document',
      'description' => 'A test document',
      'mimeType' => 'text/plain'
    })

    File.open('app/assets/Documents/document.txt', 'w') {|f| f.write("Hello World!!") }

    media = Google::APIClient::UploadIO.new('app/assets/Documents/document.txt', 'text/plain')
    result = client.execute(
      :api_method => drive.files.insert,
      :body_object => file,
      :media => media,
      :parameters => {
        'uploadType' => 'multipart',
        'alt' => 'json'})

    # Pretty print the API result
    jj result.data.to_hash
  end

end
