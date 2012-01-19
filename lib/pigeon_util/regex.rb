# -*- encoding : utf-8 -*-
module PigeonUtil
  module Regex
    ROUTE_LOGIN      = /(fb:)?[a-z0-9][a-z0-9_\-]+/i
    LOGIN            = /\A\w[\w\.\-_@]+\z/                     # ASCII, strict
    UNICODE_LOGIN    = /\A[[:alnum:]][[:alnum:]\.\-_@]+\z/     # Unicode, strict
    PERMISSIVE_LOGIN = /\A[^[:cntrl:]\\<>\/&]*\z/              # Unicode, permissive
    LOGIN_MESSAGE    = "use only letters, numbers, and .-_@ please.".freeze

    NAME          = /\A[^[:cntrl:]\\<>\/&]*\z/                 # Unicode, permissive
    NAME_MESSAGE  = "avoid non-printing characters and \\&gt;&lt;&amp;/ please.".freeze

    EMAIL_NAME    = '[\w\.%\+\-]+'.freeze
    DOMAIN_HEAD   = '(?:[A-Z0-9\-]+\.)+'.freeze
    DOMAIN_TLD    = '(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|jobs|museum)'.freeze
    EMAIL         = /\A#{EMAIL_NAME}@#{DOMAIN_HEAD}#{DOMAIN_TLD}\z/i
    EMAIL_MESSAGE = "should look like an email address.".freeze
  end
end
