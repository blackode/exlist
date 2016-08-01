defmodule Exlist.Lists do
@moduledoc """ 
	Extension to lists functions
"""

	@doc """
	Flattens the given `list` and returns  the `sum` of those elements

	## Examples

			iex> Exlist.Lists.flat_sum [1,2,3,4,[5,6,7,[8,9,0]]]
			45
	"""
	@spec flat_sum(list(number)) :: number

	def flat_sum(list) when is_list(list) do
		list
		|> List.flatten
		|> list_sum
	end

  @doc """
  Returns the sum of all elements of the list

	## Examples 

			iex> Exlist.Lists.list_sum [1,2,3,4,,5,6,7,8,9,0]
	    45
	"""
	@spec list_sum(list) :: number
	
	def list_sum([head|tail]) do
		head + list_sum(tail)
	end

	@doc false
	def list_sum([]), do: 0

	@doc """
	Returns the given `number` of elements in the `list`
	"""
	@spec list_get(list,integer) :: list

	def list_get(list,num) when is_list(list) do
		
	end

	@doc """
	adds the given element `elem` to the end of the list `list`

  ## Examples


      iex> Exlist.Lists.append []
      nil

      iex> Exlist.Lists.append [1,2,3],4
      [1,2,3,4]

      iex> Exlist.Lists.append [1,2,3],:atom
      [1,2,3, :atom]

      iex> Exlist.Lists.append [1,2,3],%{name: "john"}
      [1, 2, 3, %{name: "john"}]
      
  """
  @spec append(list,any) :: list

  def append(list,elem) when not is_list(elem) do
    list ++ [elem]
  end
  
  @doc false
  def append [] do
  	nil
  end

  @doc """
  adds the list to end of the given list as a list or list of items based on the boolean `true` or `false` respectively

	## Examples

			iex> Exlist.Lists.append [1,2,3],[4,5,6]
			[1,2,3,[4,5,6]]

			iex> Exlist.Lists.append [1,2,3],[4,5,6],:false 
			[1,2,3,[4,5,6]]

			iex> Exlist.Lists.append [1,2,3],[4,5,6], :true
			[1,2,3,4,5,6]

  """
  @spec append(list,list,boolean) ::list
  
  def append(list1,list2,mode \\ :false) when is_list(list2) do
  	case mode do
  		:true ->
  			list1 ++ list2
  		:false ->
  			list1 ++ [list2]
  	end
  end
  
  	@doc """
  	adds the given element `elem` to the begining  of the list `list`

    ## Examples

        iex> Exlist.Lists.prepend []
        nil

        iex> Exlist.Lists.prepend [1,2,3],4
        [4,1,2,3]

        iex> Exlist.Lists.prepend [1,2,3],:atom
        [:atom,1,2,3]

        iex> Exlist.Lists.prepend [1,2,3],%{name: "john"}
        [%{name: "john"},1, 2, 3]
        
    """
    @spec prepend(list,any) :: list

    def prepend(list,elem) when not is_list(elem) do
      [elem] ++ list
    end
    
    @doc false
    def prepend [] do
    	nil
    end

    @doc """
    adds the list to begining of the given list as a list or list of items
    based on the boolean `true` or `false` respectively

  	## Examples

    		iex> Exlist.Lists.prepend [1,2,3],[4,5,6]
    		[[4,5,6],1,2,3]

    		iex> Exlist.Lists.prepend [1,2,3],[4,5,6],:false 
    		[[4,5,6],1,2,3]

    		iex> Exlist.Lists.prepend [1,2,3],[4,5,6], :true
    		[4,5,6,1,2,3]

    """
    @spec prepend(list,list,boolean) ::list
    
    def prepend(list1,list2,mode \\ :false) when is_list(list2) do
    	case mode do
    		:true ->
    			list2 ++ list1
    		:false ->
    			[list2] ++ list1
    	end
    end




end