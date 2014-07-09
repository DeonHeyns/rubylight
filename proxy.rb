=begin
using System.Runtime.Remoting.Proxies.RealProxy;
namespace Proxy
{
 public class LoggingProxy<T> : RealProxy
 {
     private readonly T _instance;

     private LoggingProxy(T instance)
         : base(typeof(T))
     {
         _instance = instance;
     }

     public static T Create(T instance)
     {
         return (T)new LoggingProxy<T>(instance).GetTransparentProxy();
     }

     public override IMessage Invoke(IMessage msg)
     {
         var methodCall = (IMethodCallMessage)msg;
         var method = (MethodInfo)methodCall.MethodBase;

         try
         {
             Console.WriteLine("Before invoke: " + method.Name);
             var result = method.Invoke(_instance, methodCall.InArgs);
             Console.WriteLine("After invoke: " + method.Name);
             return new ReturnMessage(result, null, 0, methodCall.LogicalCallContext, methodCall);
         }
         catch (Exception e)
         {
             Console.WriteLine("Exception: " + e);
             if (e is TargetInvocationException && e.InnerException != null)
             {
                 return new ReturnMessage(e.InnerException, msg as IMethodCallMessage);
             }

             return new ReturnMessage(e, msg as IMethodCallMessage);
         }
     }
 }
}

ICalculator calculator = LoggingProxy<ICalculator>.Create(new Calculator());
calculator.Add(1,2);
=end

class Proxy
	def initialize (target_object)
		@object = target_object
	end

	def method_missing(method_name, *args, &block)
		begin
			puts 'Before Invoke ' + method_name
			@object.send(method_name, *args, &block)
			puts 'After Invoke ' + method_name
		rescue NameError => ex
			puts 'Exception ' + message
		end
	end
end

class Calculator
    def add(lhs, rhs)
        lhs + rhs
    end
end

calculator = Proxy.new(Calculator.new)
calculator(1, 2)

