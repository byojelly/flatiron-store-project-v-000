module ItemsHelper
      def to_currency(number)
        #binding.pry
        number.to_f / 100
    #number is an integer type that needs to be a float
      end
end
