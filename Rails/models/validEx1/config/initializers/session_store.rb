# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_validEx1_session',
  :secret      => '3e7d2ea11c2009032dd7637d6393234070e700e32fe60f4c6b92766fdce3469fabb438c1320a812e395a36ff538c7f5907a2a4170838c093bd873527cae26491'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
