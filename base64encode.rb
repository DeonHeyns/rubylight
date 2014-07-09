=begin
using System.Text;

namespace Foo 
{
 public class Bar 
 {
     public string Base64Encode(string str) 
     {
         var bytes = Encoding.UTF8.GetBytes(str);
            var base64 = Convert.ToBase64String(bytes);
            return base64;
     }
 } 
}
=end

require 'base64'
class Foo
	def base64_encode(str)
		Base64.encode64(str)
	end
end