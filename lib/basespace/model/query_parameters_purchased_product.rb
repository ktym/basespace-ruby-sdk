# Copyright 2013 Toshiaki Katayama, Joachim Baran
#
#     Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# 
#     Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'basespace/api/basespace_error'

module Bio
module BaseSpace

# This class can be passed as an optional argument for a filtering getUserProducts list response.
class QueryParametersPurchasedProduct
  attr_accessor :passed

  LEGAL = {
    'Tags'        => [],
    'ProductIds'  => [],
  }

  # Create a new QueryParametersPurchasedProduct instance.
  #
  # +pars+:: Query parameters used for list filtering.
  def initialize(pars = {})
    @passed = {}
    pars.each do |k, v|
      @passed[k] = v
    end
    validate
  end
        
  # Return a string representation of all query parameters.
  def to_s
    return @passed.to_s
  end

  # Return debugging information of the object.
  def to_str
    return self.inspect
  end

  # Return the query parameters.
  def get_parameter_dict
    return @passed
  end

  # Check if the query parameters are valid.
  #
  # Throws UnknownParameterError for illegal parameters.
  def validate
    @passed.each do |k, v|
      raise UnknownParameterError.new(k) unless LEGAL.has_key?(k)
    end
  end

end

end # module BaseSpace
end # module Bio

