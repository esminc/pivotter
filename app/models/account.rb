# -*- coding: utf-8 -*-
require 'digest/sha1'

class Account
  include DataMapper::Resource
  include DataMapper::Validate
  attr_accessor :password, :password_confirmation

  # Properties
  property :id,               Serial
  property :name,             String
  property :crypted_password, String
  property :salt,             String
  property :role,             String

  # Validations
  validates_presence_of      :name, :role
  validates_presence_of      :password,                          :if => :password_required
  validates_presence_of      :password_confirmation,             :if => :password_required
  validates_length_of        :password, :min => 4, :max => 40,   :if => :password_required
  validates_confirmation_of  :password,                          :if => :password_required
  validates_length_of        :name,     :min => 3, :max => 100
  validates_uniqueness_of    :name,     :case_sensitive => false
  validates_format_of        :role,     :with => /[A-Za-z]/

  ##
  # This method is for authentication purpose
  #
  def self.authenticate(name, password)
    account = first(:conditions => { :name => name }) if name.present?
    account && account.password_clean == password ? account : nil
  end

  ##
  # This method is used by AuthenticationHelper
  #
  def self.find_by_id(id)
    get(id) rescue nil
  end

  ##
  # This method is used to retrieve the original password.
  #
  def password_clean
    crypted_password.decrypt(salt)
  end

  ###
  # Password setter generates salt and crypted_password
  #
  def password=(val)
    return if val.blank?
    attribute_set(:salt, Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{name}--")) if new?
    attribute_set(:crypted_password, val.encrypt(self.salt))
  end

  private

  def password_required
    crypted_password.blank? || !password.blank?
  end
end
