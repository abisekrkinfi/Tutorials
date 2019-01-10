# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_practice_session',
  :secret      => 'cd46992146fe5371ba626223f0ae9fc1f7f00a9f26197bf0b530751ba6a49448696275255db10be6bd3fff90fc5ab6e9c8ee24f81dafc7850e40b21a1a7f1001'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
