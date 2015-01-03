OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '533922412641-7dh1o9q8hn96oveh65r4emu79hdhhtss.apps.googleusercontent.com',
           '0Pl1B3EVhmJU-zL4BUOzCaP9',
           {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}

  provider :facebook, '741644855925953', '4da89d64c859a513e7bff76129b98ab1',
           {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}

  provider :vkontakte, '4710282', '7V2kBtxWPQg1KEqqnHXR',
           {
               scope: 'friends,email',
               display: 'popup',
               lang: 'ru',
               image_size: 'original',
               client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}
           }

end