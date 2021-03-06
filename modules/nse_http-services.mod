#!/usr/bin/env bash

# shellcheck shell=bash

# ``````````````````````````````````````````````````````````````````````````````
# Function name: nse_http-services()
#
# Description:
#   NSE HTTP Services Module.
#
# Usage:
#   nse_http-services
#
# Examples:
#   nse_http-services
#

function nse_http-services() {

  # shellcheck disable=SC2034
  local _FUNCTION_ID="nse_http-services"
  local _STATE=0

  # User variables:
  # - module_name: store module name
  # - module_args: store module arguments

  export _module_show=
  export _module_help=
  export _module_opts=
  export _module_commands=

  # shellcheck disable=SC2034
  _module_variables=()

  # shellcheck disable=SC2034
  author="trimstray"
  contact="trimstray@gmail.com"
  version="1.0"
  description="NSE HTTP Services Module"

  # shellcheck disable=SC2034,SC2154
  _module_cfg="${_modules}/${module_name}.cfg"

  touch "$_module_cfg"

  # shellcheck disable=SC2034,SC2154
  _module_help=$(printf "%s" "
  Module: ${module_name}

    Description
    -----------

      NSE HTTP Services Module.

    Commands
    --------

      help                            display module help
      show    <key>                   display module or profile info
      config  <key>                   show module configuration
      set     <key>                   set module variable value
      use     <module>                reuse module (changed env)
      pushd   <key>|init|show|flush   command line commands stack
      search  <key>                   search key in all commands
      init    <alias|id>              run profile

      Options:

        <key>                         key value
        <value>                       profile alias or id

")

  # shellcheck disable=SC2154
  if [[ "$_mstate" -eq 0 ]] ; then

    if [[ -e "$_module_cfg" ]] && [[ -s "$_module_cfg" ]] ; then

      # shellcheck disable=SC1090
      source "$_module_cfg"

    else

      # shellcheck disable=SC2034
      _module_variables=()

      if [[ "${#_module_variables[@]}" -ne 0 ]] ; then

        printf "_module_variables=(\"%s\")\n" "${_module_variables[@]}" > "$_module_cfg"

      fi

      _mstate=1

    fi

  else

    # shellcheck disable=SC1090
    source "$_module_cfg"

  fi

  # In the given commands you can use variables from the CLI config
  # command or the etc/main.cfg file.

  # shellcheck disable=SC2034
  _module_commands=(\
  #
  "https://nmap.org/nsedoc/scripts/http-apache-negotiation.html;\
  ;http-apache-negotiation;--script=http-apache-negotiation" \
  #
  "https://nmap.org/nsedoc/scripts/http-apache-server-status.html;\
  ;http-apache-server-status;--script=http-apache-server-status" \
  #
  "https://nmap.org/nsedoc/scripts/http-aspnet-debug.html;\
  ;http-aspnet-debug;--script=http-aspnet-debug" \
  #
  "https://nmap.org/nsedoc/scripts/http-awstatstotals-exec.html;\
  ;http-awstatstotals-exec;--script=http-awstatstotals-exec.nse" \
  #
  "https://nmap.org/nsedoc/scripts/http-bigip-cookie.html;\
  ;http-bigip-cookie;--script=http-bigip-cookie" \
  #
  "https://nmap.org/nsedoc/scripts/http-cakephp-version.html;\
  ;http-cakephp-version;--script=http-cakephp-version" \
  #
  "https://nmap.org/nsedoc/scripts/http-dlink-backdoor.html;\
  ;http-dlink-backdoor;--script=http-dlink-backdoor" \
  #
  "https://nmap.org/nsedoc/scripts/http-drupal-enum.html;\
  ;http-drupal-enum;--script=http-drupal-enum" \
  #
  "https://nmap.org/nsedoc/scripts/http-drupal-enum-users.html;\
  ;http-drupal-enum-users;--script=http-drupal-enum-users" \
  #
  "https://nmap.org/nsedoc/scripts/http-git.html;\
  ;http-git;--script=http-git" \
  #
  "https://nmap.org/nsedoc/scripts/http-iis-short-name-brute.html;\
  ;http-iis-short-name-brute;--script=http-iis-short-name-brute" \
  #
  "https://nmap.org/nsedoc/scripts/http-iis-webdav-vuln.html;\
  ;http-iis-webdav-vuln;--script=http-iis-webdav-vuln" \
  #
  "https://nmap.org/nsedoc/scripts/http-joomla-brute.html;\
  ;http-joomla-brute;--script=http-joomla-brute" \
  #
  "https://nmap.org/nsedoc/scripts/http-jsonp-detection.html;\
  ;http-jsonp-detection;--script=http-jsonp-detection" \
  #
  "https://nmap.org/nsedoc/scripts/http-malware-host.html;\
  ;http-malware-host;--script=http-malware-host" \
  #
  "https://nmap.org/nsedoc/scripts/http-passwd.html;\
  ;http-passwd;--script=http-passwd" \
  #
  "https://nmap.org/nsedoc/scripts/http-php-version.html;\
  ;http-php-version;--script=http-php-version" \
  #
  "https://nmap.org/nsedoc/scripts/http-phpmyadmin-dir-traversal.html;\
  ;http-phpmyadmin-dir-traversal;--script=http-phpmyadmin-dir-traversal" \
  #
  "https://nmap.org/nsedoc/scripts/http-robots.txt.html;\
  ;http-robots;--script=http-robots.txt" \
  #
  "https://nmap.org/nsedoc/scripts/http-tplink-dir-traversal.html;\
  ;http-tplink-dir-traversal;--script=http-tplink-dir-traversal" \
  #
  "https://nmap.org/nsedoc/scripts/http-virustotal.html;\
  ;http-virustotal;--script=http-virustotal" \
  #
  "https://nmap.org/nsedoc/scripts/http-vmware-path-vuln.html;\
  ;http-vmware-path-vuln;--script=http-vmware-path-vuln" \
  #
  "https://nmap.org/nsedoc/scripts/http-waf-detect.html;\
  ;http-waf-detect;--script=http-waf-detect" \
  #
  "https://nmap.org/nsedoc/scripts/http-waf-fingerprint.html;\
  ;http-waf-fingerprint;--script=http-waf-fingerprint" \
  #
  "https://nmap.org/nsedoc/scripts/http-webdav-scan.html;\
  ;http-webdav-scan;--script=http-webdav-scan" \
  #
  "https://nmap.org/nsedoc/scripts/http-wordpress-brute.html;\
  ;http-wordpress-brute;--script=http-wordpress-brute" \
  #
  "https://nmap.org/nsedoc/scripts/http-wordpress-enum.html;\
  ;http-wordpress-enum;--script=http-wordpress-enum" \
  #
  "https://nmap.org/nsedoc/scripts/http-wordpress-users.html;\
  ;http-wordpress-users;--script=http-wordpress-users" \
  )

  # shellcheck disable=SC2034,SC2154
  _module_show=(\
      "${module_name}" \
      "${version}" \
      "${#_module_commands[@]}" \
      "${author}" \
      "${contact}" \
      "${description}" \
      )

  # shellcheck disable=SC2034
  export _module_opts=(\
  "$_module_help")

  return $_STATE

}
