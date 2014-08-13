class User < ActiveRecord::Base

  has_and_belongs_to_many :projects
  has_many :tasks

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, presence: true, uniqueness: true

  has_secure_password validations: false
  validates :password_digest, length: {minimum: 4}, on: :create
  validates :password_digest, confirmation: true
  validates :confirmation_token, uniqueness: true

  ROLES = ["admin","developer","po"]

  validate :roles_validator
  serialize :roles, Array

  def roles_validator
    roles.each do |role|
      errors.add(:role, "#{role} is listed multiple times") unless roles.count(role) <= 1
      errors.add(:role, "#{role} is no a valid role") unless ROLES.include? role
    end
  end

  # Regular Expression to validate emails:
  # regex = []
  # regex << beginning_of_string = "/\A"
  # regex << email_identifier    = "([^@\s]+)"
  # regex << email_ad            = "@"
  # regex << email_domain        = "((?:[-a-z0-9]+\.)+"
  # regex << email_tld           = "[a-z]{2,})"
  # regex << end_of_string       = "\z/"
  # regex << case_insensitive    = "i"
  # EMAIL_REGEX = regex.join('')

  # uncomment to validate if the emails are well formed
  # I would usually recommend to send activation emails and not to try to
  # match the pattern "email" - it is too error prone.
  # a simple matching like "includes an @ and a . and some charachters around them" is ok
  # validates_format_of :email, with: /#{EMAIL_REGEX}/, on: :update
end
