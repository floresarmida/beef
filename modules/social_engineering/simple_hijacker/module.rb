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
class Simple_hijacker < BeEF::Core::Command

  def self.options

    config = BeEF::Core::Configuration.instance
    @templates = config.get('beef.module.simple_hijacker.templates')

    # Defines which domains to target
    data = []
    data.push({'name' =>'targets', 'description' =>'list domains you want to hijack - separed by ,', 'ui_label'=>'Targetted domains', 'value' => 'beef'})
    
    # We'll then list all templates available 
    tmptpl = []
    @templates.each{ |template|
      tplpath = "#{$root_dir}/modules/social_engineering/simple_hijacker/templates/#{template}.js"
        raise "Invalid template path for command template #{template}" if not File.exists?(tplpath)
        file = File.open(tplpath, "r")
        data.push({'name' => template, 'type' => 'hidden', 'value' => file.read})
      tmptpl<<[ template]
    }
 
    data.push({'name' => 'choosetmpl', 'type' => 'combobox', 'ui_label' => 'Template to use', 'store_type' => 'arraystore', 'store_fields' => ['tmpl'], 'store_data' => tmptpl, 'valueField' => 'tmpl', 'displayField' => 'tmpl' , 'mode' => 'local', 'emptyText' => "Choose a template"})
      
    return data
  end
  
  #
  # This method is being called when a zombie sends some
  # data back to the framework.
  #
  def post_execute
    save({'answer' => @datastore['answer']})
  end
  
end
