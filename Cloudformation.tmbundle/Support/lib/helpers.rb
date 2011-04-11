#!/usr/bin/env ruby -wKU

# Inspired by this sample
# http://snipplr.com/view/6555/use-textmates-tmdialog-command-to-create-user-defined-menus/

SUPPORT = ENV['TM_SUPPORT_PATH']
# "DIALOG"=>
#  "/Applications/TextMate.app/Contents/PlugIns/#Dialog2.tmplugin/Contents/Resources/tm_dialog2",

require SUPPORT + '/lib/escape'
require SUPPORT + '/lib/osx/plist'

# Alternative to e_sh (part of escape)
# require 'Shellwords'
# plist.shellescape


# selections=[ {"title" => "Micro Instance", "value" => "t1.micro"}]

module Cloudformation
	def self.select_menu(selections)
		plist = { 'menuItems' => selections }.to_plist

		res = OSX::PropertyList::load(`#{ENV['DIALOG']} -up #{ e_sh plist}`)
		abort unless res.has_key? 'selectedMenuItem'

		print "#{res['selectedMenuItem']['value']}"

	end
end
