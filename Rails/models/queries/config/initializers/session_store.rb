# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_queries_session',
  :secret      => 'baa44854c77adb1ac978a8db45b6d769ff4e5fca15ddec58765fb4be865938fdb0524b0b5a421e60786d84cb652c7b89c0bea612348eb506476f9ab710026fb5'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
