# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_migEx1_session',
  :secret      => '34a40f6e43e0265a845fe5514c69d954865826eb2d9d9b0334b13d036c275878a33ace278ba9d256601807e6ec4cc242d66f491abba060ee35dd5a0b80418946'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
