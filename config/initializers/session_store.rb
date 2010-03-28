# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_appattack_session',
  :secret      => '4d467799392f35866bd2f2fecfef6f0588453aca357f9958295fd2d2db2745f3e213ce5891ed6ecdbd8513031adbac59191efaa2ff4e6c4a4901b41617bd8f21'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
