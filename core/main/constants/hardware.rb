#
#   Copyright 2012 Wade Alcorn wade@bindshell.net
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#

module BeEF
module Core
module Constants
  
  # @note The hardware's strings for hardware detection.
  module Hardware

    HW_UNKNOWN_IMG        = 'pc.png'
	HW_IPHONE_UA_STR      = 'iPhone'
 	HW_IPHONE_IMG         = 'iphone.jpg'
	HW_IPAD_UA_STR	      = 'iPad'
	HW_IPAD_IMG	          = 'ipad.png'
	HW_IPOD_UA_STR	      = 'iPod'
	HW_IPOD_IMG	          = 'ipod.jpg'
	HW_BLACKBERRY_UA_STR  = 'BlackBerry'
	HW_BLACKBERRY_IMG     = 'blackberry.png'
	HW_ANDROID_UA_STR     = 'Android'
	HW_ANDROID_IMG        = 'android.png'
	HW_WINPHONE_UA_STR    = 'Windows Phone'
	HW_WINPHONE_IMG       = 'win.png'
    HW_ZUNE_UA_STR        = 'ZuneWP7'
    HW_ZUNE_IMG           = 'zune.gif'
	HW_KINDLE_UA_STR      = 'Kindle'
	HW_KINDLE_IMG         = 'kindle.png'
    HW_ALL_UA_STR         = 'All'

        # Attempt to match operating system string to constant
        # @param [String] name Name of operating system
        # @return [String] Constant name of matched operating system, returns 'ALL'  if nothing are matched
		def self.match_hardware(name)
			case name.downcase
				when /iphone/
					HW_IPHONE_UA_STR
				when /ipad/
					HW_IPAD_UA_STR
				when /ipod/
					HW_IPOD_UA_STR
				when /blackberry/
					HW_BLACKBERRY_UA_STR
				when /android/
					HW_ANDROID_UA_STR
				when /windows phone/
					HW_WINPHONE_UA_STR
				when /zune/
					HW_ZUNE_UA_STR
				when /kindle/
					HW_KINDLE_UA_STR
				else
					'ALL'
				end
		end
	
  end
  
end
end
end
