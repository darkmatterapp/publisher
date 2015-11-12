# TODO: make the logger print to STDOUT

# creates the default settings with empty values
# the site owner will need to populate those with real values
Rails.logger.info "Creating default settings..."
[
  ["Site Title",                   "",                                          true],
  ["Site Description",             "",                                          true],
  ["Domain",                       "",                                          true],
  ["Short Domain",                 "",                                          true],
  ["Protocol",                     "http://",                                   true],
  ["Micropub Endpoint",            "/micropub",                                 false],
  ["Rel Authorization Endpoint",   "https://indieauth.com/auth",                true],
  ["Rel Token Endpoint",           "https://tokens.indieauth.com/token",        true],
  ["Rel Me",                       "",                                          true],
  ["Custom CSS",                   "",                                          true],
  ["Text Direction",               "ltr",                                       true],
  ["Favicon URL (16x16 or 32x32)", "/favicon.ico",                              true],
  ["Touch Icon URL (57x57)",       "/apple-touch-icon-precomposed.png",         true],
  ["Touch Icon URL (60x60)",       "/apple-touch-icon-60x60-precomposed.png",   true],
  ["Touch Icon URL (72x72)",       "/apple-touch-icon-72x72-precomposed.png",   true],
  ["Touch Icon URL (76x76)",       "/apple-touch-icon-76x76-precomposed.png",   true],
  ["Touch Icon URL (114x114)",     "/apple-touch-icon-114x114-precomposed.png", true],
  ["Touch Icon URL (120x120)",     "/apple-touch-icon-120x120-precomposed.png", true],
  ["Touch Icon URL (144x144)",     "/apple-touch-icon-144x144-precomposed.png", true],
  ["Touch Icon URL (152x152)",     "/apple-touch-icon-152x152-precomposed.png", true],
  ["Touch Icon URL (180x180)",     "/apple-touch-icon-180x180-precomposed.png", true],
  ["Touch Icon URL (192x192)",     "/touch-icon-192x192.png",                   true],
  ["Public Key",                   "",                                          true],
  ["Footer Show Avatar",           "true",                                      true],
  ["Footer Show Email",            "true",                                      true],
  ["Footer Show License",          "true",                                      true],
  ["Footer Show Links",            "true",                                      true],
  ["Footer Show Name",             "true",                                      true],
  ["Footer Show Site Search",      "true",                                      true],
  ["Header Show Avatar",           "true",                                      true],
  ["Header Show Site Search",      "true",                                      true],
  ["Header Show Site Description", "true",                                      true],
  ["Header Show Site Title",       "true",                                      true]
].each do |setting|
  s          = Setting.new
  s.name     = setting[0]
  s.content  = setting[1]
  s.editable = setting[2]
  s.save(validate: false)
end
Rails.logger.info "...done."

Rails.logger.info "Populating licenses table..."
[
  [
    "Public Domain",
    "CC0",
    "The person who associated a work with this deed has dedicated the work to the public domain
    by waiving all of his or her rights to the work worldwide under copyright law, including all
    related and neighboring rights, to the extent allowed by law. You can copy, modify, distribute
    and perform the work, even for commercial purposes, all without asking permission.",
    "http://creativecommons.org/publicdomain/zero/1.0/"
  ],
  [
    "Some Rights Reserved",
    "CC BY",
    "Attribution",
    "http://creativecommons.org/licenses/by/4.0/"
  ],
  [
    "Some Rights Reserved",
    "CC BY-SA",
    "Attribution Share Alike",
    "http://creativecommons.org/licenses/by-sa/4.0/"
  ],
  [
    "Some Rights Reserved",
    "CC BY-ND",
    "Attribution No Derivatives",
    "http://creativecommons.org/licenses/by-nd/4.0/"
  ],
  [
    "Some Rights Reserved",
    "CC BY-NC",
    "Attribution Non-Commercial",
    "http://creativecommons.org/licenses/by-nc/4.0/"
  ],
  [
    "Some Rights Reserved",
    "CC BY-NC-SA",
    "Attribution Non-Commercial Share Alike",
    "http://creativecommons.org/licenses/by-nc-sa/4.0/"
  ],
  [
    "Some Rights Reserved",
    "CC BY-NC-ND",
    "Attribution Non-Commercial No Derivatives",
    "http://creativecommons.org/licenses/by-nc-nd/4.0/"
  ],
  [
    "All Rights Reserved",
    "&copy;",
    "Copyright",
    "http://en.wikipedia.org/wiki/Copyright"
  ]
].each do |license|
  l             = License.new
  l.name        = license.first
  l.short_code  = license[1]
  l.description = license[2]
  l.url         = license.last
  l.save!
end
Rails.logger.info "...done."

Rails.logger.info "Settting copyright (All Rights Reserved) as default license..."
license          = Setting.new
license.name     = "License"
license.content  = License.find_by(name: "All Rights Reserved").id
license.editable = true
license.save(validate: false)
Rails.logger.info "...done."
